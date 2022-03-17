<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'WPCACHEHOME', 'C:\xampp\htdocs\Ruslan14\wp-content\plugins\wp-super-cache/' ); //Added by WP-Cache Manager
define('WP_CACHE', true); //Added by WP-Cache Manager
define('DB_NAME', 'Ruslan14');

/** Имя пользователя MySQL */
define('DB_USER', 'root');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', '');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8mb4');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'f}[.GADC-=fJK6}b0^=I?q%b.:z}yq/I32q{!!lD*v9#ey`/%l%xZP_meGW0XP*^');
define('SECURE_AUTH_KEY',  'B(j5bkDK]Yb}V>.M03JD[9RY.AOvl?P1tp/_!Pt/sjH)0#XK@H[7-T8IP,<YZ?!<');
define('LOGGED_IN_KEY',    '/L8(/K9 _y;i6ZXwodYhB7Al;Y0&kXrYZ0CHr3!_zIfuUtY%`dm-:#3nVO1?s#rX');
define('NONCE_KEY',        '{F`[X0o@-R>U9->!hgsp}!QUiT*TStRgz|S`6ck+kJ6?&VHJ}iq}v[xu+P%fnc( ');
define('AUTH_SALT',        ';p`nUEMp~E@:9(VoZB@FJtprT=ICh}L^}.: ;vu|^QsH7$81MC::3JgKs+z4Q4,%');
define('SECURE_AUTH_SALT', '|8j]>J;liH.dw.K5{r#z%^}V$je%`M}-T`[]jHW]Q6z/%!7jtkz1<oyGODE`ij@I');
define('LOGGED_IN_SALT',   'k.Wsy;}}NvWDdR~l2,RQ:N71.^l2@:>XAMl^I#bYF{M@$^:z&J[l0A0F8b8K&3|^');
define('NONCE_SALT',       '+^AN=sq4SaKv[t)HKMu m,9.tL^7#8$nGg{X@&$MEVaS@D}A`<~k3_X$HaU9^<3r');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
