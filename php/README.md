# example-php

A PHP page served by nginx + PHP-FPM through the Paketo PHP buildpack. No `composer.json`: a
plain PHP app needs none, and one without a `composer.lock` fails the build (`composer
check-platform-reqs` wants the lock).
