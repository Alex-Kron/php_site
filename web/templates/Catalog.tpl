<head>
    <meta charset="UTF-8">
    <title>Каталог</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
{include 'Header.tpl'}
<br>
<a class="btn btn-success" href={'?action=add'}>Add new product</a>
<div class="list-group">
    {foreach from = $cat_page item="cat_item"}
        <a class="list-group-item flex-column align-items-start" href={'?action=item&id='|cat:$cat_item[0]}>
            <div class="card">
                <div class="card-title d-flex w-100 justify-content-between">
                    <h4 class="mb-1 text-dark">{$cat_item[1]}
                        <div class="blockquote-footer">{$cat_item[13]}</div>
                    </h4>
                    <small>{$cat_item[10]|cat:' р.'}</small>

                </div>
                <div class="card-text">
                    Category: {$cat_item[12]}
                </div>
            </div>
        </a>
    {/foreach}


    <nav aria-label="...">
        <ul class="pagination justify-content-center">
            {if ($page_num-1 >= 1)}
                <li class="page-item">
                    <a class="page-link" tabindex="-1" href={'?action=catalog&filter=all&page='|cat:{$page_num-1}}>Previous</a>
                </li>
            {else}
                <li class="page-item disabled">
                    <a class="page-link" tabindex="-1" href={'?action=catalog&filter=all&page='|cat:{$page_num-1}}>Previous</a>
                </li>
            {/if}
            {if ($page_num-1 >= 1)}
                <li class="page-item"><a class="page-link"
                                         href={'?action=catalog&filter=all&page='|cat:{$page_num-1}}>{$page_num-1}</a>
                </li>
            {/if}
            <li class="page-item active">
                <a class="page-link" href={'?action=catalog&filter=all&page='|cat:{$page_num}}>{$page_num} <span
                            class="sr-only">(current)</span></a>
            </li>
            {if sizeof($cat_page) == $delim}
                <li class="page-item"><a class="page-link"
                                         href={'?action=catalog&filter=all&page='|cat:{$page_num+1}}>{$page_num+1}</a>
                </li>
            {/if}
            {if sizeof($cat_page) == $delim}
                <li class="page-item">
                    <a class="page-link" href={'?action=catalog&filter=all&page='|cat:{$page_num+1}}>Next</a>
                </li>
            {else}
                <li class="page-item disabled">
                    <a class="page-link" href={'?action=catalog&filter=all&page='|cat:{$page_num+1}}>Next</a>
                </li>
            {/if}
        </ul>
    </nav>
</div>