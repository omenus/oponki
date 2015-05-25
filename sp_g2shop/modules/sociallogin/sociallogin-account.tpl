
{capture name=path}
	<a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}">
		{l s='My account' mod='sociallogin'}</a>
		<span class="navigation-pipe">{$navigationPipe}</span>{l s='Social Account Linking' mod='sociallogin'}
{/capture}

	{if $socialloginlrmessage}
<p class="warning">{$socialloginlrmessage}</p>
{/if}
<div id="favoriteproducts_block_account">
	<h2>{l s='Social Account Linking' mod='sociallogin'}</h2>
	{if $sociallogin}
		<div>
			<div class="favoriteproduct clearfix">
				{$sociallogin}
				
			</div>
		</div>
	{else}
		<p class="warning">{l s='Your Api Key is Wrong' mod='sociallogin'}</p>
	{/if}

	<ul class="footer_links">
		<li class="fleft">
			<a class="button" href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}"><i class="fa fa-chevron-left"></i> {l s='Back to Your Account' mod='sociallogin'}</a></li>
		<li class="f_right"><a  class="button"  href="{$base_dir}"><i class="fa fa-home"></i>{l s='Home' mod='sociallogin'}</a></li>
	</ul>
</div>