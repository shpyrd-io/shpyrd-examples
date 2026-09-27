# example-ruby-apt

A Ruby app that needs `libvips` from apt: the `Aptfile` lists the packages, the platform installs
them into the image at build time (RFC-0065).

If a library is still missing at run time, list it: the build image carries more libraries than
the run image, and a dependency the build already has is not installed for the app (here
`libglib2.0-0` and `libgomp1`).
