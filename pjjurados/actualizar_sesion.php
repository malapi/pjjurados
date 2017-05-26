<?php
echo date(DATE_RFC2822);
session_name("sessionOS");
session_start();
echo "\n".session_id();

?>