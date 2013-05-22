<?php

$db = Zend_Db_Table::getDefaultAdapter();
$dbProfiler = $db->getProfiler();
$dbQuery = $dbProfiler->getLastQueryProfile();
$dbSQL = $dbQuery->getQuery();

Zend_Debug::dump($dbSQL);
?>
