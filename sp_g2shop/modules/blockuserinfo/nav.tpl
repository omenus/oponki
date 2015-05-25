<!-- Block user information module NAV  -->

<div class="header_user_info">
	<ul class="links">
		{if $is_logged}
			<li class="first" > 
				<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
					<i class="fa fa-user"></i> {l s='Sign out' mod='blockuserinfo'} <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-link-account">
					<li><a href="#">Zamówienia</a></li>
					<li><a href="#">Account Information</a></li>
					<li><a href="#">Address Book</a></li>
					<li><a href="#">Tagi</a></li>
					<li><a href="#">Billing Agreements</a></li>
					<li><a href="#">Recurring Profiles</a></li>
				</ul>
			</li>
		{else}
			<li class="first" >
				<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
					<i class="fa fa-user"></i>{l s='Moje konto' mod='blockuserinfo'} <i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-link-account">
					<li><a href="#">Zamówienia</a></li>
					<li><a href="#">Account Information</a></li>
					<li><a href="#">Address Book</a></li>
					<li><a href="#">Tagi</a></li>
					<li><a href="#">Billing Agreements</a></li>
					<li><a href="#">Recurring Profiles</a></li>
				</ul>
			</li>
		{/if}
	
		<li> <a href="{$link->getModuleLink('blockwishlist', 'mywishlist')}" title="{l s='My Wishlist' mod='blockuserinfo'}" ><i class="fa fa-heart"></i> {l s='My Wishlist' mod='blockuserinfo'}</a></li>

		<li class="last" > <a href="{$link->getPageLink('order', true)}"  title="{l s='Check out' mod='blockcart'}" rel="nofollow"><i class="fa fa-share"></i> {l s='Checkout' mod='blockuserinfo'}</a></li>
	
	</ul>
</div>
<!-- /Block usmodule NAV -->
