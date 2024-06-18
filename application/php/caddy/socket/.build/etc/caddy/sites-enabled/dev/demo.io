
www.dev.demo.io {
	tls internal
    root * {$HTML_PATH}
    file_server
}

api.dev.demo.io {
	tls internal
	root * {$PHP_ROOT_PATH}
	php_fastcgi unix//sock/docker.sock
	rewrite * /index.php
}
