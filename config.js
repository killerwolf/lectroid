// Lectroid configuration.

module.exports = function (app) {

    // Name of this blog.
    app.set('siteName', 'h4md1.fr');

    // Absolute base URL for this site.
    app.set('siteUrl', 'http://www.h4md1.fr/');

    // Name of this blog's author.
    app.set('author', 'Hamdi LAADHARI');

    // Email address for this blog's author.
    app.set('authorEmail', 'killerwolf06@gmail.com');

    // Enable or disable gzip compression.
    app.enable('gzip');

    // Enable or disable legacy Thoth redirects.
    app.disable('legacyRedirects');

    //choosing template 
    app.set('design', 'personal');
    
    // Production-only overrides.
    if (app.get('env') === 'production') {

        // Absolute base URL for this site.
        app.set('siteUrl', 'http://www.h4md1.fr/');

    }

};
