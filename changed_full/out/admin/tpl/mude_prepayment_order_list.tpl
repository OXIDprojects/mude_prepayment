[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign box="list"}]

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<script type="text/javascript">
<!--
function Mude_RemindCustomer(sID)
{
    blCheck = confirm("[{ oxmultilang ident="MUDE_ORDER_LIST_YOUWANTREMIND" }]");
    if( blCheck == true)
    {
        var oSearch = document.getElementById("search");
        oSearch.oxid.value=sID;
        oSearch.fnc.value='sendReminder';

        var oTransfer = parent.edit.document.getElementById("transfer");
        oTransfer.oxid.value=sID;
        oTransfer.cl.value='[{ $default_edit }]';

       //forcing edit frame to reload after submit
       top.forceReloadingEditFrame();

       oSearch.submit();
    }
}
window.onload = function ()
{
    top.reloadEditFrame();
    [{ if $updatelist == 1}]
        top.oxid.admin.updateList('[{ $oxid }]');
    [{ /if}]
}
//-->
</script>

<div id="liste">

<form name="search" id="search" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="mude_prepayment_order_list">
    <input type="hidden" name="lstrt" value="[{ $lstrt }]">
    <input type="hidden" name="sort" value="[{ $sort }]">
    <input type="hidden" name="actedit" value="[{ $actedit }]">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="fnc" value="">

<table cellspacing="0" cellpadding="0" border="0" width="100%">
    <colgroup><col width="25%"><col width="25%"><col width="10%"><col width="28%"><col width="10%"><col width="1%"><col width="1%"></colgroup>
    <tr class="listitem">
    <td valign="top" class="listfilter first" height="20">
        <div class="r1"><div class="b1">
        <select name="folder" class="folderselect" onChange="document.search.submit();">
            <option value="-1" style="color: #000000;">[{ oxmultilang ident="ORDER_LIST_FOLDER_ALL" }]</option>
            [{foreach from=$afolder key=field item=color}]
            <option value="[{ $field }]" [{ if $folder == $field }]SELECTED[{/if}] style="color: [{ $color }];">[{ oxmultilang ident=$field noerror=true }]</option>
            [{/foreach}]
        </select>
        <input class="listedit" type="text" size="15" maxlength="128" name="where[oxorder.oxorderdate]" value="[{ $where->oxorder__oxorderdate|oxformdate }]" [{include file="help.tpl" helpid=order_date}]>
        </div></div>
    </td>
        <td valign="top" class="listfilter" height="20">
        <div class="r1"><div class="b1">
        <input class="listedit" type="text" size="7" maxlength="128" name="where[oxorder.oxordernr]" value="[{ $where->oxorder__oxordernr }]">
        </div></div>
    </td>
    <td valign="top" class="listfilter" height="20" colspan="1" nowrap>
        <div class="r1"><div class="b1">
        <div class="find"><input class="listedit" type="submit" name="submitit" value="[{ oxmultilang ident="GENERAL_SEARCH" }]"></div>
        <input class="listedit" type="text" size="50" maxlength="128" name="where[oxorder.oxbilllname]" value="[{ $where->oxorder__oxbilllname }]">
        </div></div>
    </td>
    
    <td valign="top" class="listfilter" height="20" colspan="3" nowrap>
        <div class="r1"><div class="b1">
        <div class="find"></div>
        </div></div>
    </td>
    
</tr>
<tr>
    <td class="listheader first" height="15">&nbsp;<a href="Javascript:document.search.sort.value='oxorder.oxorderdate';document.search.submit();" class="listheader">[{ oxmultilang ident="ORDER_LIST_ORDERTIME" }]</a></td>
    <td class="listheader" height="15"><a href="Javascript:document.search.sort.value='oxorder.oxordernr';document.search.submit();" class="listheader">[{ oxmultilang ident="GENERAL_ORDERNUM" }]</a></td>
    <td class="listheader" height="15"  colspan="1"><a href="Javascript:document.search.sort.value='oxorder.oxbilllname';document.search.submit();" class="listheader">[{ oxmultilang ident="ORDER_LIST_CUSTOMER" }]</a></td>
    
     <td class="listheader" height="15"  colspan="3"><a href="Javascript:document.search.sort.value='oxorder.oxbilllname';document.search.submit();" class="listheader">[{ oxmultilang ident="MUDE_PREPAYMENT_HEADLINE" }]</a></td>
    
</tr>

[{assign var="blWhite" value=""}]
[{assign var="_cnt" value=0}]
[{foreach from=$mylist item=listitem}]
    [{assign var="_cnt" value=$_cnt+1}]
    <tr id="row.[{$_cnt}]">

    [{ if $listitem->oxorder__oxstorno->value == 1 }]
        [{assign var="listclass" value=listitem3 }]
    [{else}]
        [{ if $listitem->blacklist == 1}]
            [{assign var="listclass" value=listitem3 }]
        [{ else}]
            [{assign var="listclass" value=listitem$blWhite }]
        [{ /if}]
    [{/if}]
    [{ if $listitem->getId() == $oxid }]
        [{assign var="listclass" value=listitem4 }]
    [{ /if}]
    <td valign="top" class="[{ $listclass}]" height="15"><div class="listitemfloating">&nbsp;<a href="Javascript:top.oxid.admin.editThis('[{ $listitem->oxorder__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxorder__oxorderdate|oxformdate:'datetime':true }]</a></div></td>
        <td valign="top" class="[{ $listclass}]" height="15"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{ $listitem->oxorder__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxorder__oxordernr->value }]</a></div></td>
    <td valign="top" class="[{ $listclass}]" height="15"><div class="listitemfloating"><a href="Javascript:top.oxid.admin.editThis('[{ $listitem->oxorder__oxid->value}]');" class="[{ $listclass}]">[{ $listitem->oxorder__oxbilllname->value }] [{ $listitem->oxorder__oxbillfname->value }]</a></div></td>
    <td class="[{ $listclass}]">
        [{ $listitem->oxorder__mudeprepaymentreminded->value }]
        </td>

    <td class="[{ $listclass}]" colspan="2">
        [{if !$readonly}]
            <a href="Javascript:Mude_RemindCustomer('[{ $listitem->oxorder__oxid->value }]');" id="pau.[{$_cnt}]" class="pause"></a>
        [{/if}]</td>
    </td>
</tr>
[{if $blWhite == "2"}]
[{assign var="blWhite" value=""}]
[{else}]
[{assign var="blWhite" value="2"}]
[{/if}]
[{/foreach}]
[{include file="pagenavisnippet.tpl" colspan="6"}]
</table>
</form>
</div>

[{include file="pagetabsnippet.tpl"}]

<script type="text/javascript">
if (parent.parent)
{   parent.parent.sShopTitle   = "[{$actshopobj->oxshops__oxname->getRawValue()|oxaddslashes}]";
    parent.parent.sMenuItem    = "[{ oxmultilang ident="ORDER_LIST_MENUITEM" }]";
    parent.parent.sMenuSubItem = "[{ oxmultilang ident="ORDER_LIST_MENUSUBITEM" }]";
    parent.parent.sWorkArea    = "[{$_act}]";
    parent.parent.setTitle();
}
</script>
</body>
</html>

