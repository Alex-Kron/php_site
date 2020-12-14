<?php
require_once('ActionList.php');
require_once('Config.php');
global $db;
global $smarty;
$action_function = 'main';
$action_file = 'ActionList.php';
$action_tpl = 'Main.tpl';

function action_chooser()
{
    global $db;
    global $smarty;
    global $action_function;
    global $action_file;
    global $action_tpl;
    $action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRIPPED);
    $sql = 'SELECT Function, File, Template FROM pages WHERE Name_action = :name_function;';
    try {
        $query = $db->prepare($sql);
        $query->bindParam('name_function', $action);
        $query->execute();
        $db_action = $query->fetch();
        if (is_array($db_action)) {
            $action_function = $db_action[0];
            $action_file = $db_action[1];
            $action_tpl = $db_action[2];
        }
        if (file_exists('../include/' . $action_file) & file_exists('../web/templates/' . $action_tpl) & is_callable($action_function)) {
            $action_function();
        } else {
            throw new PDOException();
        }
    } catch
    (PDOException $e) {
        $smarty->display('Error.tpl');
    }
}
