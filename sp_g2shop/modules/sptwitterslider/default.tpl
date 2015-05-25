{*
 * @package SP Twitter Slider
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author YouTech Company http://www.smartaddons.com
*}

{assign var="tag_id" value="sp_twitter_slider"}
{assign var="list" value=$sptwitterslider.list}
{assign var="params" value=$sptwitterslider.config}
{*assign var="y" value="2"}
{assign var=x value=($y==2)?'buon':'qua'}
{assign var=x value=0|rand:100} 
{$x|var_dump} 
{$smarty.datetime|date_format:"%h %M %s %d %m %y" *}
{if $params.pretext != '' }
<div class="sc-pretext">
	{$params.pretext}
</div>
{/if}
{if isset($list)}
<!--Begin sp-twitter-slider-->
	<div id="{$tag_id}" class="sp-twitter-slider">
		<script src="//platform.twitter.com/widgets.js" type="text/javascript"></script>
		<!--Begin ts-wrap-->
		<div class="ts-wrap">

			{assign var="screen_label" value=""}	
			{foreach from=$list item=_item}
				{assign var="item" value=$_item}	
				{break}
			{/foreach}
			{assign var="screen_label" value=$item->_username}	
			{if $params.display_avatar }
				<!--Begin ts-header-->
				<div class="ts-header">
					<a title="{$item->_full_name}" target="_blank" class="ts-avatar"
					   href="{$item->_twitter_link|escape:'html':'UTF-8'}">
					<span class="ts-mask">
						<span class="ts-mask-logo">Open in Twitter</span>
					</span>
						<img src="{$item->_image}" alt="{$item->_full_name}"
							 title="{$item->_full_name}">
					</a>

					<div class="ts-userinfo">
						<h2>{$item->_full_name}</h2>
						<a target="_blank" href="{$item->_twitter_link|escape:'html':'UTF-8'}">
							{$item->_username}
						</a>
					</div>
				</div>
				<!--End ts-header-->
			{/if}
			
			{assign var="slider_id" value="ts_slider_wap"}
			<!--Begin ts-slider-wrap-->
			<div class="ts-slider-wrap {$params.effect}" id="{$slider_id}"
			     data-interval="{$params.interval}" data-pause="{$params.pause_hover}"
				>
				<div class="ts-items">
					{counter start=-1 skip=1 print=false name=_count assign="_count"}
					{foreach $list as  $item}
						{counter name=_count}
						{assign var="active_cls"  value=($_count == $params.start_slide)?' active ':''}
						<div class="ts-item item  {$active_cls}">
							<div class="ts-text">
								{$item->_text}
							</div>
							<div class="ts-btn">
								<a href="https://twitter.com/intent/tweet?in_reply_to={$item->id_str}"
								   target="_blank" class="reply-tweet" title="{$item->_full_name}">
									<i class="fa fa-reply"></i>
									{l s='Reply' mod='sptwitterslider'}
								</a>
								<a href="https://twitter.com/intent/retweet?tweet_id={$item->id_str}"
								   class="retweet" title="{$item->_full_name}">
									<i class="fa fa-retweet"></i>
									{l s='Retweet' mod='sptwitterslider'}
								</a>
								<a href="https://twitter.com/intent/favorite?tweet_id={$item->id_str}"
								   class="favorite-tweet" title="{$item->_full_name}">
									<i class="fa fa-star"></i>
									{l s='Favorite' mod='sptwitterslider'}
								</a>
							</div>
							<div class="ts-created">
								<a href="https://twitter.com/smartaddons/status/{$item->id_str}"
								   target="_blank" title="{$item->_full_name}">
								 {$item->created_at|date_format:"j F Y"}
								</a>
							</div>
						</div>
					{/foreach}
				</div>
				<!--Begin ts-control-->
				<div class="ts-control">
					{if $params.display_direction_button}
						<a class="ts-ctr-prev ts-ctr" href="#{$slider_id}" data-jslide="prev"></a>
					{/if}
					<!-- <ul class="ts-ctr-pages">
						{counter name=k  start=-1 skip=1 print=false assign="k"}
						{assign var="pags" value=$list|@count}
						{for $i=0 to $pags-1}
							{counter name=k}
							{assign var="sel_class"  value=($k == $params.start_slide)?' sel ':''}
							<li class="ts-ctr-page {$sel_class}" href="#{$slider_id}"
							    data-jslide="{$k}">
							</li>
							
						{/for}	
					</ul>
					-->
					{if $params.display_direction_button}
						<a class="ts-ctr-next ts-ctr" href="#{$slider_id}" data-jslide="next"></a>
					{/if}
				</div>
				<!--End ts-control-->
			</div>
			<!--End ts-slider-wrap-->
		
			{if $params.display_follow_button}
				
				<!--Begin ts-btn-follow-->
				<div class="ts-btn-follow">
					<a href="https://twitter.com/{$screen_label}" class="twitter-follow-button"
					   data-show-count="false">Follow @{$screen_label}</a>
					<script>!function (d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (!d.getElementById(id)) {
								js = d.createElement(s);
								js.id = id;
								js.src = "https://platform.twitter.com/widgets.js";
								fjs.parentNode.insertBefore(js, fjs);
							}
						}(document, "script", "twitter-wjs");</script>
				</div>
				<!--End ts-btn-follow-->
			{/if}
		</div>
		<!--End ts-wrap-->
	</div>
	<!--End sp-twitter-slider-->
	<script type="text/javascript">
		//<![CDATA[
		jQuery(document).ready(function ($) {
			;
			(function (element) {
				var $element = $(element);
				var $_slider = $('#{$slider_id}', $element);
				$_slider.each(function () {
					var $this = $(this), options = options = !$this.data('modal') && $.extend({}, $this.data());
					$this.jcarousel(options);
					$this.bind('jslide', function (e) {
						var index = $(this).find(e.relatedTarget).index();
						$('[data-jslide]').each(function () {
							var $nav = $(this), $navData = $nav.data(), href, $target = $($nav.attr('data-target') || (href = $nav.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, ''));
							if (!$target.is($this)) return;
							if (typeof $navData.jslide == 'number' && $navData.jslide == index) {
								$nav.addClass('sel');
							} else {
								$nav.removeClass('sel');
							}
						});
					});
					{if $params.swipe}
						$this.touchSwipeLeft(function () {
							$this.jcarousel('next');
						}
					);
						$this.touchSwipeRight(function () {
							$this.jcarousel('prev');
						}
					);
					{/if}
					return;
				});

			})('#{$tag_id}');
		});
		//]]>
	</script>
{else}
	{l s='Has no content to show!' mod='sptwitterslider'}
{/if}	
{if $params.posttext != '' }
<div class="sc-posttext">
	{$params.posttext}
</div>
{/if}
