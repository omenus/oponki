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
{if !isset($content_only) || !$content_only}
</div><!-- #center_column -->
{if isset($right_column_size) && !empty($right_column_size)}


{/if}

</div><!-- .row -->
</div><!-- #columns -->
{if $page_name == 'index'}
	{assign var='displayBottom4' value={hook h='displayBottom4'}}
	{if $displayBottom4}
		<div class="ps-spotlight4 clearfix">
			<div class="container">
				<div class="row clearfix">
					{hook h="displayBottom5"}
				</div>
			</div>
		</div>
	{/if}
{/if}

{assign var='displayBottom5' value={hook h='displayBottom5'}}
{if $displayBottom5}
	<div class="ps-spotlight5 clearfix">
		<div class="container">
			{hook h="displayBottom4"}
		</div>
	</div>
{/if}

</div><!-- .columns-container -->
{if isset($HOOK_FOOTER)}
	<!-- Footer -->
	<div class="footer-container">
		<div id="footer1">
			<div  class="container">
				{hook h="displayFooter1"}
			</div>
		</div>
		<footer id="footer"  class="container">
			<div class="row">{$HOOK_FOOTER}</div>
		</footer>

		<div id="copyright">
			<div  class="container">
				<div class="copy-right col-md-12 clear">
					&copy; 2014 {l s='[1]Ecommerce software by %s[/1]' mod='blockcms' sprintf=['PrestaShop'] tags=['<a class="_blank" href="http://www.prestashop.com">']}. Designed By <a class="_blank" href="http://www.magentech.com">MagenTech.Com</a>
				</div>
			</div>

		</div>
	</div><!-- #footer -->
{/if}
</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
</body>
</html>