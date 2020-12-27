# Find-and-Replace

// Посмотреть содержимое файла
get: http://site.ru/far.php?pass=*******&edit=dir/file.txt

// Изменить
Content-Type: application/x-www-form-urlencoded
post: http://site.ru/far.php?pass=*******
content: save=data%2Ftemplate.txt&source=111

Ответ: ok

... изучить остальные возможные функции...