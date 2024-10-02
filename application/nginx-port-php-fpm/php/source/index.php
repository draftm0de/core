<?php
echo "<h3>api.demo.io (nginx AND php via port)</h3>";
echo "<pre>";
print_r([
    "time" => date('Y-m-d H:i:s'),
    "timezone" => date_default_timezone_get()
]);
echo "</pre>";
echo "<pre>"; print_r($_SERVER); echo "</pre>";
echo "<pre>"; phpinfo(); echo "</pre>";
?>