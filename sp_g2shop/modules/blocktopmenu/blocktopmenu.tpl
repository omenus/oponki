{if $MENU != ''}
	<!-- Menu -->

	<div id="block_top_menu" class="sf-contener col-sm-5 clearfix ">
		<div class="cat-title"><i class="fa fa-bars"></i></div>
		<ul class="sf-menu clearfix menu-content">
			{include file="./home-menu.tpl"}
			<li><a href="/" class="menu-home-link"><i class="fa fa-dot-circle-o" style="font-size: 0.75em"></i>p<i class="fa fa-dot-circle-o" style="font-size: 0.75em"></i>nm<i class="fa fa-dot-circle-o" style="font-size: 0.75em"></i>t.pl</a></li>
			{$MENU}
			{if $MENU_SEARCH}
				<li class="sf-search noBack" style="float:right">
					<form id="searchbox" action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="get">
						<p>
							<input type="hidden" name="controller" value="search" />
							<input type="hidden" value="position" name="orderby"/>
							<input type="hidden" value="desc" name="orderway"/>
							<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'html':'UTF-8'}{/if}" />
						</p>
					</form>
				</li>
			{/if}
		</ul>
	</div>
	<!--/ Menu -->
{/if}