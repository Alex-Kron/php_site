<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<div class="navbar navbar-expand-md navbar-dark bg-dark">
    <a class="navbar-brand" href="?action=main">{$brand}</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="btn-group">
                <button type="button" class="btn btn-outline-light">
                    <a class="btn-outline-light" href="?action=catalog&filter=all&page=1">Каталог</a>
                </button>
                <button type=button class="btn btn-outline-light dropdown-toggle dropdown-toggle-split"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu">
                    {foreach from=$catalog item="catalog_item"}
                        <a class="dropdown-item" href={'?action=catalog&filter='|cat:$catalog_item|cat:'&page=1'}>{$catalog_item}</a>
                    {/foreach}
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="?action=lk">Личный кабинет</a>
            </li>
        </ul>
        <form class="form-inline my-2">
            <input class="form-control m-2" type="text" name="search" placeholder="Поиск">
            <button type="button" class="btn btn-outline-light m-2">Поиск</button>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>
</html>