<?php
/**
* Changelog:
* 19.11.2013 - eComStyle.de | Josef Andreas Puckl - Alle Dateien im Modulordner, Kompatibilität zu Shopversion 4.7 und 4.8, optische und inhaltliche Anpassungen.
* 16.02.2015 - Volker Lange (domino) und eComStyle.de | Josef Andreas Puckl - Kompatibilität zu Shopversion 4.9.
* Module information
*/
$sMetadataVersion = '1.1';
$aModule = array(
    'id'           => 'mudeprepay',
    'title'        => 'Vorkasseerinnerung',
    'description'  => 'Senden Sie mit nur einen Mausklick eine Vorkasseerinnerung',
    'version'      => '2.1',
    'thumbnail'    => '',
    'author'       => 'OXID Community',
    'email'        => '',
    'url'          => '',
	'extend'       => array(
	),
    'templates' => array(
        'mude_prepayment_order.tpl'           => 'mudeprepayment/views/admin/tpl/mude_prepayment_order.tpl',
        'mude_prepayment_order_list.tpl'      => 'mudeprepayment/views/admin/tpl/mude_prepayment_order_list.tpl',
        'email_mudeprepayment_customer.tpl'   => 'mudeprepayment/views/azure/tpl/email_mudeprepayment_customer.tpl',
    ),
    'files' => array(
        'mude_prepayment_admin_order'         => 'mudeprepayment/controllers/admin/mude_prepayment_admin_order.php',
        'mude_prepayment_order_list'          => 'mudeprepayment/controllers/admin/mude_prepayment_order_list.php',
    ),
    'blocks' => array(

 ), 
     'settings' => array(

    ),
);