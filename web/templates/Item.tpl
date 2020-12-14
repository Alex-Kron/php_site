<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
{include 'Header.tpl'}
<br>
<div class="btn-group" role="group">
    <a class="btn btn-outline-dark" href={'?action=edit&id='|cat:{$item[0]}}>Edit</a>
    <a class="btn btn-outline-danger" href={'?action=remove&id='|cat:{$item[0]}}>Remove</a>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Name</h4>
        <p class="card-text">
            {$item[1]}
        </p>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Category</h4>
        <p class="card-text">
            {$item[12]}
        </p>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Brand</h4>
        <p class="card-text">
            {$item[13]}
        </p>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Colour</h4>
        <p class="card-text">
            {$item[4]}
        </p>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Material</h4>
        <p class="card-text">
            {$item[5]}
        </p>
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h4 class="card-title">Price</h4>
        <p class="card-text">
            {$item[10]} р.
        </p>
    </div>
</div>
<br>
</body>