<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TITLE" }][{ $shop->oxshops__oxname->value }]</title>
<meta http-equiv="Content-Type" content="text/html; charset=[{$charset}]">
</head>
  <body bgcolor="#ffffff" link="#355222" alink="#18778E" vlink="#389CB4" style="font-family: Arial, Helvetica, sans-serif; font-size: 12px;">

    <div width="600" style="width: 600px">
[{*
        <div style="padding: 10px 0;">
            <img src="[{$oViewConf->getImageUrl('logo_email.png', false)}]" border="0" hspace="0" vspace="0" alt="[{ $shop->oxshops__oxname->value }]" align="texttop">
        </div>
*}]
[{*
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TOP1" }]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TOP2" }]
<br>
<br> 
*}]
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_HELLO" }] [{if $salutaion == "MR"}][{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_MR" }][{else}][{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_MRS" }][{/if}] [{$surname}], <br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT1" }] [{$order->oxorder__oxorderdate->value}] [{oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT2"}]
[{ $shop->oxshops__oxname->value }] [{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT3" }]
<br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT4" }]
<br>
<br>
<b>[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_BILLAMOUNT" }] [{ $order->oxorder__oxtotalordersum->value|number_format:2:",":"."}] [{ $currency->sign}]</b>
<br>
<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_BANK" }] [{$shop->oxshops__oxbankname->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_OWNER"}] [{$shop->oxshops__oxfname->value}] [{$shop->oxshops__oxlname->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_ROUTINGNOMBER" }] [{$shop->oxshops__oxbankcode->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_ACCOUNTNOMBER" }] [{$shop->oxshops__oxbanknumber->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_BIC" }] [{$shop->oxshops__oxbiccode->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_IBAN" }] [{$shop->oxshops__oxibannumber->value}]<br>
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_PURPOSE" }] [{$order->oxorder__oxordernr->value}]<br>

<br> 
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_TEXT5"}]
<br>
<br>
 
[{*oxcontent ident="mude_prepayment_mailfooter"*}]
[{ oxmultilang ident="EMAIL_MUDEPREPAYMENT_BYE"}]<br><br>
[{$shop->oxshops__oxname->value}]<br>


        <div style="border: 1px solid #3799B1; margin: 30px 0 15px 0; padding: 12px 20px; background-color: #eee; border-radius: 4px 4px 4px 4px; linear-gradient(center top , #FFFFFF, #D1D8DB) repeat scroll 0 0 transparent;">
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; margin: 0; padding: 0;">
                [{ oxcontent ident="oxemailfooter" }]
            </p>
        </div>

    </div>

  </body>
</html>



