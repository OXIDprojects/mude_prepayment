[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]

[{include file="email/html/header.tpl" title=$shop->oxshops__oxname->value}]

[{oxcontent ident="mudeprepaymentcustomeremail"}]

[{include file="email/html/footer.tpl"}]
