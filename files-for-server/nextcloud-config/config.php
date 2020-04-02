<?php
$CONFIG = array (
    //Для добавления отображения превью видеофайлов
    'enabledPreviewProviders' => array (
      'OC\\Preview\\Movie',
      'OC\\Preview\\Image'
    ),
    'preview_max_x' => 512,
    'preview_max_y' => 512,
    // (стоковые настройки удалены отсюда)
    // ОЧЕНЬ ВАЖНО ДОБАВИТЬ В {nextcloud}/config/config.php
    // Эти настройки:
    'overwritehost' => 'bati4eli.ru',
    'overwriteprotocol' => 'https',
    'overwrite.cli.url' => 'https://bati4eli.ru',
    'trusted_domains' =>
    array (
    0 => 'bati4eli.ru',
    1 => '192.168.1.75',
    ),
);