<?php
switch (true) {
    case str_contains($_SERVER["REQUEST_URI"], "/database"):
        $dsn = getenv("DATABASE_DSN");
        echo "<h3>dsn: $dsn</h3>";
        $user = getenv("DATABASE_USER");
        $pass = file_get_contents(getenv("DATABASE_PASSWORD_FILE"));
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $grants = $pdo->query("SHOW GRANTS");
        echo "<pre>"; print_r($grants->fetchAll()); echo "</pre>";
        break;
    default:
        echo "<h3>api.demo.io (caddy AND php via socket)</h3>";
        echo "<pre>";
        print_r([
            "time" => date('Y-m-d H:i:s'),
            "timezone" => date_default_timezone_get()
        ]);
        echo "</pre>";
        echo "<pre>"; print_r($_SERVER); echo "</pre>";
        echo "<pre>"; print_r(getenv()); echo "</pre>";
        echo "<pre>"; phpinfo(); echo "</pre>";
}

