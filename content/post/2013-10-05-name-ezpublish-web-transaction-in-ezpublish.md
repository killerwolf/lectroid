---
title: Name eZ Publish web transaction in New Relic
tags:
- newrelic
- ezpublish
---

<img class="thumbnail pull-left" src="/img/personal/posts/2013-10/newrelic_transaction.png" />

When using **NewRelic PHP agent** with an eZ Publish stack. the profiled transactions will show under `/index.php`. To get better insights of what makes your app struggle.

**NewRelic** provides a self explanatory [**PHP API**](https://docs.newrelic.com/docs/php/the-php-api). This API lets you send additional metrics/data along by the ones the agent already gathers.

The eZ Publish extension [**ezpublish-newrelic**](https://github.com/killerwolf/ezpublish-newrelic) I wrote allows you to track modules and theires views under a separate transaction name. 

Code source is hosted on [GitHub](https://github.com/killerwolf/ezpublish-newrelic) and is available for install on [**Packagist**](https://packagist.org/packages/killerwolf/ezpublish-newrelic) via **Composer**, feel free to contribute.
