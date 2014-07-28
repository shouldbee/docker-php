<?php

assert_options(ASSERT_CALLBACK, function($script, $line, $message) {
  header("HTTP", null, 500);
  echo "FAIL: " . file($script)[$line - 1];
  register_shutdown_function(function(){ exit(1); });
});

assert(ini_get("date.timezone") === "Asia/Tokyo");
assert(ini_get("expose_php") === "0");
php_sapi_name() == "cli" and assert(ini_get("display_errors") === "1");
php_sapi_name() != "cli" and assert(ini_get("display_errors") === "0");
assert(ini_get("log_errors") === "1");
assert(ini_get("log_errors_max_len") === "4096");
assert(ini_get("error_log") === "/var/log/php_error.log");
assert(ini_get("register_globals") === false);
assert(ini_get("register_long_arrays") === false);
assert(ini_get("allow_url_include") === "0");
assert(ini_get("default_charset") === "UTF-8");
assert(ini_get("phar.readonly") === "1");
php_sapi_name() == "cli" and assert(ini_get("max_execution_time") === "0");
php_sapi_name() == "apache" and assert(ini_get("max_execution_time") === "30");
php_sapi_name() == "apache2handler" and assert(ini_get("max_execution_time") === "30");
assert(ini_get("memory_limit") === "128M");
assert(ini_get("upload_max_filesize") === "32M");

// mbstring
assert(ini_get("mbstring.language") === "Japanese");
assert(ini_get("mbstring.internal_encoding") === "UTF-8");
assert(ini_get("mbstring.http_input") === "pass");
assert(ini_get("mbstring.http_output") === "pass");
assert(ini_get("mbstring.encoding_translation") === "");
assert(ini_get("mbstring.detect_order") === "UTF-8, EUC-JP, SJIS, ASCII");
assert(ini_get("mbstring.substitute_character") === "");
