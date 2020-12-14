<?php
require_once('Config.php');
global $smarty;
global $brand;
global $news;
global $db;

function head() {
    global $db;
    global $smarty;
    global $brand;
    global $news;
    try {
        $smarty->assign('brand', $brand);
        $smarty->assign('news', $news);
        $sql = 'SELECT Name_cat FROM categories;';
        $query = $db->prepare($sql);
        $query->execute();
        $categories = $query->fetchAll(PDO::FETCH_COLUMN, 0);
        $smarty->assign('catalog', $categories);
    } catch (SmartyException $exception) {
        $smarty->display('Error.tpl');
    } catch (PDOException $exception) {
        $smarty->display('Error.tpl');
    }
}

function main()
{
    global $db;
    global $smarty;
    global $brand;
    global $news;
    try {
        head();
        $smarty->display('Main.tpl');
    } catch (SmartyException $e) {
        $smarty->display('Error.tpl');
    } catch (Exception $e) {
        $smarty->display('Error.tpl');
    } catch (PDOException $exception) {
        $smarty->display('Error.tpl');
    }
}

function catalog()
{
    global $db;
    global $smarty;

    head();

    $delim = 25;
    try {
        $sql = 'SELECT IDprod, Name_prod, SizeRU, SizeEU, Name_colour, Name_mat, Name_se, Name_country, Number, Image_hash, Price, Name_sex, Name_cat, Name_br 
            FROM products
            LEFT JOIN brands b on b.IDbrand = products.IDbrand
            LEFT JOIN categories c on c.IDcat = products.IDcat
            LEFT JOIN colours c2 on c2.IDcolour = products.IDcolour
            LEFT JOIN country c3 on c3.IDcountry = b.IDcountry
            LEFT JOIN sex s on s.IDsex = products.IDsex
            LEFT JOIN materials m on m.IDmat = products.IDmaterials
            LEFT JOIN seasons s2 on s2.IDseason = products.IDseason';
        $filter = filter_input(INPUT_GET, 'filter', FILTER_SANITIZE_STRIPPED);
        if ($filter == 'all' | is_null($filter)) {
            $query = $db->prepare($sql);
        } else {
            $sql = $sql . ' WHERE Name_cat = :filter';
            $query = $db->prepare($sql);
            $query->bindParam('filter', $filter);
        }
        $query->execute();
        $goods = $query->fetchAll();

        $page_num = filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT);
        $goods_page = array_slice($goods, (($page_num - 1) * $delim), $delim);
        $smarty->assign('cat_page', $goods_page);
        $smarty->assign('page_num', $page_num);
        $smarty->assign('delim', $delim);
        $smarty->display('Catalog.tpl');

    } catch (PDOException $exception) {
        $smarty->display('Error.tpl');
    }
}

function item() {
    head();
    global $db;
    global $smarty;
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $sql = 'SELECT IDprod, Name_prod, SizeRU, SizeEU, Name_colour, Name_mat, Name_se, Name_country, Number, Image_hash, Price, Name_sex, Name_cat, Name_br 
            FROM products
            LEFT JOIN brands b on b.IDbrand = products.IDbrand
            LEFT JOIN categories c on c.IDcat = products.IDcat
            LEFT JOIN colours c2 on c2.IDcolour = products.IDcolour
            LEFT JOIN country c3 on c3.IDcountry = b.IDcountry
            LEFT JOIN sex s on s.IDsex = products.IDsex
            LEFT JOIN materials m on m.IDmat = products.IDmaterials
            LEFT JOIN seasons s2 on s2.IDseason = products.IDseason
            WHERE IDprod=:id';
    $query = $db->prepare($sql);
    $query->bindParam('id', $id);
    $query->execute();
    $item = $query->fetch();
    $smarty->assign('item',$item);
    try {
        $smarty->display('Item.tpl');
    } catch (SmartyException $e) {
        $smarty->display('Error.tpl');
    }
}

function remove() {
    global $db;
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $sql = 'DELETE FROM products WHERE IDprod=:id';
    $query = $db->prepare($sql);
    $query->bindParam('id', $id);
    $query->execute();
    catalog();
}

function add() {
    head();
    global $db;
    global $smarty;
    $sql1 = 'SELECT * FROM colours';
    $sql2 = 'SELECT * FROM categories';
    $sql3 = 'SELECT IDbrand, Name_br FROM brands';
    $sql4 = 'SELECT * FROM materials';

    $query = $db->prepare($sql1);
    $query->execute();
    $colours = $query->fetchAll();

    $query = $db->prepare($sql2);
    $query->execute();
    $categories = $query->fetchAll();

    $query = $db->prepare($sql3);
    $query->execute();
    $brands = $query->fetchAll();

    $query = $db->prepare($sql4);
    $query->execute();
    $materials = $query->fetchAll();

    $smarty->assign('colours', $colours);
    $smarty->assign('category', $categories);
    $smarty->assign('brands', $brands);
    $smarty->assign('material', $materials);
    $smarty->display('Item_add.tpl');
}

function add_item() {
    global $db;
    $name = filter_input(INPUT_GET, 'name_prod', FILTER_SANITIZE_STRING);
    $brand = filter_input(INPUT_GET, 'brand', FILTER_SANITIZE_NUMBER_INT);
    $category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_NUMBER_INT);
    $colour = filter_input(INPUT_GET, 'colour', FILTER_SANITIZE_NUMBER_INT);
    $material = filter_input(INPUT_GET, 'material', FILTER_SANITIZE_NUMBER_INT);
    $price = filter_input(INPUT_GET, 'price', FILTER_SANITIZE_NUMBER_INT);
    $sql = 'INSERT INTO products (Name_prod, IDcolour, IDmaterials, Price, IDcat, IDbrand) VALUES (:name, :col, :mat, :pr, :cat, :br)';
    $query = $db->prepare($sql);
    $query->bindParam('name', $name);
    $query->bindParam('br', $brand);
    $query->bindParam('cat', $category);
    $query->bindParam('col', $colour);
    $query->bindParam('mat', $material);
    $query->bindParam('pr', $price);
    $query->execute();
    catalog();
}



