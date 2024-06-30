
www.dev.demo.io {
	tls internal
    root * {$DEMO_IO_WEBSERVER_ROOT}
    file_server
}

api.dev.demo.io {
	tls internal
	root * {$DEMO_IO_PHP_ROOT}
	php_fastcgi {$DEMO_IO_PHP_FASTCGI_GATEWAY}
	rewrite * /index.php
}
