<?php
/**
 *    This file is part of Musterdenker Prepayment Module for OXID eShop.
 *
 *    Musterdenker Prepayment Module for OXID eShop is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    Musterdenker Prepayment Module for OXID eShop is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with Musterdenker Prepayment Module for OXID eShop.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link http://www.musterdenker.de
 */


class mude_prepayment_Order_List extends Order_List
{
     /**
     * Executes parent method parent::render() and returns name of template
     * file "order_list.tpl".
     *
     * @return string
     */
    public function render()
    {
        parent::render();

        $aFolders = $this->getConfig()->getConfigParam( 'aOrderfolder' );
        $sFolder  = oxConfig::getParameter( "folder" );
        // first display new orders
        if ( !$sFolder && is_array( $aFolders )) {
            $aNames = array_keys( $aFolders );
            $sFolder = $aNames[0];
        }

        $aSearch    = array( 'oxorderarticles' => 'ARTID', 'oxpayments' => 'PAYMENT');
        $sSearch    = oxConfig::getParameter( "addsearch" );
        $sSearchfld = oxConfig::getParameter( "addsearchfld" );

        $this->_aViewData["folder"]       = $sFolder ? $sFolder : -1;
        $this->_aViewData["addsearchfld"] = $sSearchfld ? $sSearchfld : -1;
        $this->_aViewData["asearch"]      = $aSearch;
        $this->_aViewData["addsearch"]    = $sSearch;
        $this->_aViewData["afolder"]      = $aFolders;

        return "mude_prepayment_order_list.tpl";
    }

    /**
     * Adding folder check
     *
     * @param array  $aWhere  SQL condition array
     * @param string $sqlFull SQL query string
     *
     * @return $sQ
     */
    protected function _prepareWhereQuery( $aWhere, $sqlFull )
    {
        $sSql = parent::_prepareWhereQuery( $aWhere, $sqlFull );
        
        $sSql .= " AND oxpaymenttype = 'oxidpayadvance' AND oxpaid = '0000-00-00 00:00:00' AND OXSTORNO = 0";
                
        return $sSql;
    }

    public function sendReminder()
    {
        $soxId  = oxConfig::getParameter( "oxid");
        
        $oOrder = oxNew( "oxorder" );
        if ( $oOrder->load( $soxId ) ) {
           
           $oOrder->oxorder__mudeprepaymentreminded = new oxField( date('Y-m-d'));

           if (  $this->_sendReminderMail( $oOrder)) {
              $oOrder->save();
        
            }
        }
        
        $this->init();  
    }
      
    protected function _sendReminderMail( $oOrder)
    {

        // Send Email
        $oShop = oxNew( "oxshop" );
        $oShop->load( $oOrder->oxorder__oxshopid->value );

        //arranging user email
        $oEmail = oxNew( "oxemail" );
        $oEmail->setFrom( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );
        $oEmail->setSmtp( $oShop );

     /*   $aParams = oxConfig::getParameter( "editval" );
        $sContent = isset( $aParams['mudereorder__oxlongdesc'] ) ? stripslashes( $aParams['mudereorder__oxlongdesc'] ) : '';
        if ( $sContent ) {
            $sContent = oxUtilsView::getInstance()->parseThroughSmarty( $sContent, $oMudeReorder->getId() );
        }
		*/
		
		$oLang = oxLang::getInstance();
		$oCur = $this->getConfig()->getActShopCurrencyObject();
		 
		
		if ($oOrder->oxorder__oxbillemail->value){
			$sMail = $oOrder->oxorder__oxbillemail->value;
		} else {
			$oUser = oxnew('oxuser');
			$oUser->load($oOrder->oxorder__userid->value);
			$sMail = $oUser->oxuser__oxusername->value;
		}
		
    		$sSalutaion = $oOrder->oxorder__oxbillsal->value;
    		
    		$sSurName = $oOrder->oxorder__oxbilllname->value;
    		
    		$sSum = $oLang->formatCurrency( $oOrder->oxorder__oxtotalbrutsum->value, $oCur );
		
        
        $oSmarty = oxUtilsView::getInstance()->getSmarty();
        $oSmarty->assign( "charset", $oLang->translateString("charset"));
        $oSmarty->assign( "shop", $oShop );
        $oSmarty->assign( "oViewConf", oxNew( 'oxViewConfig' ) );
        $oSmarty->assign( "order", $oOrder );
        $oSmarty->assign( "currency", $this->getConfig()->getActShopCurrencyObject() );
        $oSmarty->assign( "salutaion", $sSalutaion);
        $oSmarty->assign( "surname", $sSurName);
        $oSmarty->assign( "sum", $sSum);

 	   
        //$oEmail->setBody( $sContent );
        $oEmail->setBody( $oSmarty->fetch( $this->getConfig()->getTemplatePath("email/html/email_mudeprepayment_customer.tpl", false)));
        $sSubject = oxLang::getInstance()->translateString("EMAIL_MUDEPREPAYMENT_SUBJECT");
        $oEmail->setSubject( $sSubject);
        $oEmail->setRecipient( $sMail, $sMail );
        $oEmail->setReplyTo( $oShop->oxshops__oxorderemail->value, $oShop->oxshops__oxname->getRawValue() );

        // setting result message
        if ( $oEmail->send() ) {
            $this->_aViewData["mail_succ"] = 1;
            return true;
            
        } else {
            $this->_aViewData["mail_err"] = 1;
            return false;
        }
    }

}
