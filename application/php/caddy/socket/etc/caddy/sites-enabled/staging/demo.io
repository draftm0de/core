
www.staging.demo.io {
	tls internal
    root * {$HTML_CONTENT_FOLDER}
    file_server
}

api.staging.demo.io {
	tls internal
	root * {$PHP_WORK_DIR}
	php_fastcgi {$PHP_FASTCGI}
	rewrite * /index.php
}
