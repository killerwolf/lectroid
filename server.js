#!/usr/bin/env node
// -- New Relic ----------------------------------------------------------------
require('newrelic-config')
  .key(process.env.NEWRELIC_KEY)
  .name('h4md1')
  .profile();

// -- Node modules -------------------------------------------------------------
var fs = require('fs');

// -- Lectroid modules ---------------------------------------------------------
var Content   = require('./lib/content'),
    Page      = require('./lib/page'),
    Paginator = require('./lib/paginator'),
    Post      = require('./lib/post');

// -- Express initialization ---------------------------------------------------
var consolidate = require('consolidate'),
    express     = require('express'),
    swig        = require('swig'),
    app         = express();

// Load config.
require('./config')(app);

// Configure Swig.
swig.init({
    allowErrors: true,
    cache      : app.enabled('view cache'),
    filters    : require('./lib/filters')(app),
    root       : __dirname + '/views/' + app.get('design')
});

app.engine('swig', consolidate.swig);

app.set('view engine', 'swig');
app.set('views', __dirname + '/views/' + app.get('design') );
app.set('view options', {layout: false});

// Make the year available to all templates.
app.locals.year = new Date().getFullYear();

// Configure Express.
app.disable('x-powered-by');

if (app.enabled('gzip')) {
    app.use(express.compress());
}

if (app.get('env') === 'development') {
    app.use(express.responseTime());
    app.use(express.logger('tiny'));

    // Reload content from disk every time it's rendered.
    Content.reload = true;

    // Reload posts when one is added or deleted. In Node 0.8.x on OS X,
    // fs.watch() only picks up file creations, deletions, and renames. It
    // doesn't pick up changes to existing files, so unfortunately we can only
    // rely on this to detect new or deleted posts. This has supposedly been
    // fixed in Node 0.9.x.
    fs.watch(__dirname + '/content/post', function () {
        console.log('Reloading posts.');
        Post.initialize();
    });
}

// Set a few security-related headers.
app.use(function (req, res, next) {
    res.set('X-Content-Type-Options', 'nosniff');
    res.set('X-Frame-Options', 'SAMEORIGIN');
    next();
});

app.use(express.static(__dirname + '/public'));
app.use(app.router);

// -- Routes -------------------------------------------------------------------
app.get('/', function (req, res, next) {
    var page = req.query.page;

    if (page === '1') {
        res.redirect(301, '/');
        return;
    }

    var pagination = new Paginator(Post.recent(), '/?page=:page', {page: page || 1}),
        posts      = pagination.itemsOnPage();

    Post.render(posts, function (err) {
        if (err) {
            next(err);
            return;
        }

        res.render('index', {
            pagination: pagination,
            posts     : posts,
            page      : {slug: 'home'}
        });
    });
});

app.get('/page/:slug', function (req, res, next) {
    var page = Page.getBySlug(req.params.slug);

    if (!page) {
        next();
        return;
    }

    Page.render(page, function (err) {
        if (err) {
            next(err);
            return;
        }

        res.render('page', {page: page});
    });
});

app.get('/post/:slug', function (req, res, next) {
    var slug = req.params.slug,
        post = Post.getBySlug(slug);

    if (!post) {
        next();
        return;
    }

    // Redirect legacy Thoth id-based URLs to canonical slug-based URLs.
    if (slug !== post.slug) {
        res.redirect(301, '/post/' + encodeURIComponent(post.slug));
        return;
    }

    Post.render(post, function (err) {
        if (err) {
            next(err);
            return;
        }

        res.render('post', {post: post});
    });
});

app.get('/robots.txt', function (req, res) {
    res.type('text/plain');
    res.render('robots');
});

app.get('/rss', function (req, res, next) {
    var posts = Post.recent().slice(0, 10);

    Post.render(posts, function (err) {
        if (err) {
            next(err);
            return;
        }

        res.render('rss', {posts: posts});
    });
});

app.get('/sitemap', function (req, res) {
    res.type('text/xml');

    res.render('sitemap', {
        pages: Page.recent(),
        posts: Post.recent()
    });
});

app.get('/tag/:tag', function (req, res, next) {
    var tag   = req.params.tag.replace(/\+/g, ' ').toLowerCase(),
        posts = Post.getByTag(tag);

    if (!posts) {
        next();
        return;
    }

    var pagination = new Paginator(posts, '/tag/' + encodeURIComponent(tag) + '?page=:page', {
            page: req.query.page || 1
        });

    posts = pagination.itemsOnPage();

    Post.render(posts, function (err) {
        if (err) {
            next(err);
            return;
        }

        // Tell robots not to index this page, since it contains duplicate
        // content. They'll still follow links on it, though.
        res.set('X-Robots-Tag', 'noindex');

        res.render('tag', {
            pagination: pagination,
            posts     : posts,
            tag       : tag
        });
    });
});

// -- Legacy redirects ---------------------------------------------------------

if (app.enabled('legacyRedirects')) {
    app.get('/archive', function (req, res) {
        res.redirect(301, '/');
    });

    app.get('/archive/:page', function (req, res) {
        res.redirect(301, '/?page=' + encodeURIComponent(req.params.page));
    });

    app.get('/index', function (req, res) {
        res.redirect(301, '/');
    });

    app.get('/tag/:tag/:page', function (req, res) {
        res.redirect(301, '/tag/' + encodeURIComponent(req.params.tag) +
                '?page=' + encodeURIComponent(req.params.page));
    });
}

// -- Error handlers -----------------------------------------------------------

app.use(function (req, res, next) {
    res.status(404);

    res.set('X-Robots-Tag', 'noindex');

    if (req.accepts('html')) {
        res.type('text/html');

        res.render('errors/404', {
            url: req.url
        });

        return;
    }

    if (req.accepts('json')) {
        res.send({error: 'Not found.'});
        return;
    }

    res.type('txt').send('Not found.');
});

app.use(function (err, req, res, next) {
    console.error(err.stack);

    res.status(err.status || 500);

    if (req.accepts('html')) {
        res.type('text/html');

        res.render('errors/500', {
            error: err
        });

        return;
    }

    if (req.accepts('json')) {
        res.send({error: '500 Internal Server Error'});
        return;
    }

    res.type('txt').send('Internal Server Error');
});

// -- Server -------------------------------------------------------------------
var port = process.env.PORT || process.env.OPENSHIFT_NODEJS_PORT;
var port = port|| 8080;

var domain = process.env.OPENSHIFT_NODEJS_IP || "0.0.0.0"

app.listen(port, domain, function () {
  console.log('Listening on host:port http://'+domain+':'+ port);
});
