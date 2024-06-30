<?php
echo "<h3>api.demo.io (caddy AND php via socket)</h3>";
echo "<pre>";
print_r([
    "time" => date('Y-m-d H:i:s'),
    "timezone" => date_default_timezone_get()
]);
echo "</pre>";
echo "<pre>"; print_r($_SERVER); echo "</pre>";
echo "<pre>"; phpinfo(); echo "</pre>";