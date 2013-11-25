<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
    <title>[{ oxmultilang ident="GENERAL_ADMIN_TITLE_1" }]</title>
</head>

<!-- frames -->
<frameset  rows="50%,*" border="0" onLoad="document.getElementById('edit').src='[{$oViewConf->getSelfLink()}]&[{ $editurl }]&oxid=[{$oViewConf->getActiveShopId()}]';">
    <frame src="[{$oViewConf->getSelfLink()}]&[{ $listurl }]&oxid=[{$oViewConf->getActiveShopId()}]" name="list" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0" />
    <frame src="" name="edit" id="edit" marginwidth="0" marginheight="0" scrolling="auto" frameborder="0"/>
</frameset>


</html>
