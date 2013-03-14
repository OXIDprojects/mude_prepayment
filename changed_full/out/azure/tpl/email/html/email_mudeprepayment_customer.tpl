<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TITLE" }][{ $shop->oxshops__oxname->value }]</title>
<meta http-equiv="Content-Type" content="text/html; charset=[{$charset}]">
</head>
<body bgcolor="#FFFFFF" link="#355222" alink="#355222" vlink="#355222" style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;">
<br>
<img src="[{$oViewConf->getImageUrl()}]logo_white.gif" border="0" hspace="0" vspace="0" alt="[{ $shop->oxshops__oxname->value }]" align="texttop"><br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TOP1" }]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TOP2" }]
<br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_HELLO" }] [{if $salutaion == "MR"}][{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_MR" }][{else}][{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_MRS" }][{/if}] [{$surname}], <br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT1" }] [{$order->oxorder__oxorderdate->value}] [{oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT2"}]
[{ $shop->oxshops__oxname->value }] [{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT3" }]
<br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT4" }]
<br>
<br>
<b>[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_BILLAMOUNT" }] [{ $order->oxorder__oxtotalordersum->value|number_format:2:",":"."}] [{ $currency->sign}] </b>
<br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_ROUTINGNOMBER" }] [{$shop->oxshops__oxbankcode->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_ACCOUNTNOMBER" }] [{$shop->oxshops__oxbanknumber->value}]<br>

[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_PURPOSE" }] [{$order->oxorder__oxordernr->value}]<br>

[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_OWNER"}] [{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_OWNER2" }]
 
 
 <br>
 <br>
 
[{oxcontent ident="mude_prepayment_mailfooter"}]

</body>
</html>



