<?php
/**
* Changelog:
* 19.11.2013 - eComStyle.de | Josef Andreas Puckl - Alle Dateien im Modulordner, Kompatibilität zu Shopversion 4.7 und 4.8, optische und inhaltliche Anpassungen.
* Module information
*/
$aModule = array(
    'id'           => 'mudeprepay',
    'title'        => 'Vorkasseerinnerung',
    'description'  => 'Senden Sie mit nur einen Mausklick eine Vorkasseerinnerung',
    'version'      => '2.0',
    'thumbnail'    => '',
    'author'       => 'OXID Community',
    'email'        => '',
    'url'          => '',
	'extend'       => array(
	),
    'templates' => array(
        'mude_prepayment_order.tpl'           => 'mudeprepayment/out/admin/tpl/mude_prepayment_order.tpl',
        'mude_prepayment_order_list.tpl'      => 'mudeprepayment/out/admin/tpl/mude_prepayment_order_list.tpl',
        'email_mudeprepayment_customer.tpl'   => 'mudeprepayment/out/azure/tpl/email_mudeprepayment_customer.tpl',           
    ),
    'files' => array(
        'mude_prepayment_admin_order'         => 'mudeprepayment/admin/mude_prepayment_admin_order.php',
        'mude_prepayment_order_list'          => 'mudeprepayment/admin/mude_prepayment_order_list.php',
    ),
    'blocks' => array(
           
 ), 
     'settings' => array(

    ),
);