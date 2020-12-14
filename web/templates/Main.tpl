<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
{include 'Header.tpl'}
<br>
<div class="text-light text-center display-1 bg-dark">{$brand}
{if isset($news)}
    <div class="display-4">{$news}</div>
{/if}
</div>
</body>