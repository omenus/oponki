{*
* 2007-2012 PrestaShop
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
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 7077 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block manufacturers  slider module -->
{if $manufacturers}

<section id="manufacturers_slider" class=" ">
 <div id="manufacturers_logo_slider"  class="flexslider_carousel">
          <ul class="slides">
	{foreach from=$manufacturers item=manufacturer name=manufacturer_lists}
    {if $smarty.foreach.manufacturer_lists.iteration <= 20}
    <li>
	<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)}">
      {assign var="myfile" value="img/m/{$manufacturer.id_manufacturer|escape:'htmlall':'UTF-8'}-mf_image.jpg"}
{if file_exists($myfile)}
    <img src="{$img_manu_dir}{$manufacturer.id_manufacturer|escape:'htmlall':'UTF-8'}-mf_image.jpg" class="logo_manufacturer" title="{$manufacturer.name}" alt="{$manufacturer.name}" />{/if}
    
    </a>
    </li>
    	{/if}
	{/foreach}
</ul>
        </div>
    </section>
{/if}

<!-- /Block manufacturers slider module -->
