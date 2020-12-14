<head>
    <meta charset="UTF-8">
    <title>Главная</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
{include 'Header.tpl'}
<br>
<form>
    <div class="form-group">
        <input class="form-control" type="text" name="action" id="action" value="add_item" hidden>
    </div>
    <div class="form-group">
        <label class="h4" for="name">Name</label>
        <input class="form-control" type="text" name="name_prod" id="name" value="Name">
    </div>
    <div class="form-group">
        <label class="h4" for="ct">Category</label>
        <select class="custom-select" id="ct" name="category">
            {foreach from=$category item="cat"}
                <option value={$cat[0]}>{$cat[1]}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="h4" for="col">Colour</label>
        <select class="custom-select" id="col" name="colour">
            {foreach from=$colours item="colour"}
                <option value={$colour[0]}>{$colour[1]}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="h4" for="br">Brand</label>
        <select class="custom-select" id="br" name="brand">
            {foreach from=$brands item="b"}
                <option value={$b[0]}>{$b[1]}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="h4" for="mt">Material</label>
        <select class="custom-select" id="mt" name="material">
            {foreach from=$material item="mat"}
                <option value={$mat[0]}>{$mat[1]}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label class="h4" for="price">Price</label>
        <input class="form-control" type="number" name="price" id="pce" min="0.00" max="500000" value="0">
    </div>
    <button type="submit" class="btn btn-success m-2">Submit</button>
</form>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>