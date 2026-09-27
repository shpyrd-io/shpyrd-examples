<?php
// The PHP buildpack serves public/ with nginx (BP_PHP_SERVER) and runs PHP-FPM.
header('Content-Type: text/html; charset=utf-8');
$who = $_SERVER['HTTP_X_SHPYRD_USER'] ?? 'anonymous visitor';
?>
<!doctype html>
<html lang="en"><head><meta charset="utf-8"><title>example-php</title>
<style>body{font-family:system-ui;background:#0f172a;color:#e2e8f0;text-align:center;padding-top:20vh}code{background:#1e293b;padding:.15rem .4rem;border-radius:.3rem}</style></head>
<body>
<h1>PHP <?= PHP_VERSION ?> on shpyrd</h1>
<p>Hello, <code><?= htmlspecialchars($who) ?></code>. Served by <code><?= $_SERVER['SERVER_SOFTWARE'] ?? 'php' ?></code> with PHP-FPM.</p>
<p>Project <code><?= htmlspecialchars(getenv('SHPYRD_PROJECT') ?: '') ?></code>, workspace <code><?= htmlspecialchars(getenv('SHPYRD_WORKSPACE') ?: '') ?></code>.</p>
</body></html>
