{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- MODULE Block contact infos -->
<section id="block_contact_infos" class="contact-infos block  col-sm-4 last">
	<div>
        <h4 class="title_block">{l s='Shop Info' mod='blockcontactinfos'}</h4>
        <ul class="list-contact">
            {if $blockcontactinfos_company != ''}
            	<li>
            		<label class="label"><i class="fa fa-map-marker"></i></label><b>{l s='Address: ' mod='blockcontactinfos'}</b>{$blockcontactinfos_company|escape:'html':'UTF-8'}{if $blockcontactinfos_address != ''}, {$blockcontactinfos_address|escape:'html':'UTF-8'}{/if}
            	</li>
            {/if}
            {if $blockcontactinfos_phone != ''}
            	<li>
            		<label class="label"><i class="fa fa-phone"></i></label>
					<b>{l s='Phone number: ' mod='blockcontactinfos'} </b>
            		<span>{$blockcontactinfos_phone|escape:'html':'UTF-8'}</span>
            	</li>
            {/if}
            {if $blockcontactinfos_email != ''}
            	<li>
            		<label class="label"><i class="fa fa-envelope-o"></i></label>
					<b>{l s='Email: ' mod='blockcontactinfos'} </b>
            		<span>{mailto address=$blockcontactinfos_email|escape:'html':'UTF-8' encode="hex"}</span>
            	</li>
            {/if}
			<li>
				<label class="label"><i class="fa fa-clock-o"></i></label><b>{l s='Open hours: ' mod='blockcontactinfos'}</b>
				{l s='Monday - Friday: 8 am - 9 pm' mod='blockcontactinfos'} 
			</li>
        </ul>
    </div>
	
	
</section>
<!-- /MODULE Block contact infos -->


