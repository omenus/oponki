{*
 * @package SP Bestseller Products
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author YouTech Company http://www.smartaddons.com
 *}

{$list = $spbestsellerproducts}
{if isset($list) && $list}
    {assign var="tag_id" value="sp_bestseller_products"}
    
    {assign var="cod_style" value=($params.ctr_pos == 'bottom')?'margin-bottom:40px;':''}
    <div id="{$tag_id}" class="sp-bestseller-products sp-preload" style="{$cod_style}">
        <div class="sp-loading"></div>
        <div class="page-title-slider"><h1>{$params.title_slider}</h1></div>
		{if $params.pretext != '' }
			<div class="pre-text">
				{$params.pretext}
			</div>
		{/if}
		
		
		
        {if $params.ctr_pos =="top"}
            {if $params.ctr_dis}
                <div class="page-button {$params.ctr_pos} {$params.ctr_type}">
                    <ul class="control-button">
                        <li class="preview"><i class="fa fa-angle-left"></i></li>
                        <li class="next"><i class="fa fa-angle-right"></i></li>
                    </ul>
                </div>
            {/if}
        {/if}
        {assign var="class_respl" value="preset01-"|cat:$params.nb_column1|cat:' preset02-'|cat:$params.nb_column2|cat:' preset03-'|cat:$params.nb_column3|cat:' preset04-'|cat:$params.nb_column4}
        <div class="slider not-js cols-6 {$class_respl}">
            <div class="vpo-wrap">
                <div class="vp">
                    <div class="vpi-wrap tt-effect-{$params.effect} tt-effect-delay">
                        {foreach $list as $product}
                            <div class="item">
                                <div class="item-wrap">
                                    {if $product.id_image}
                                        <div class="item-img item-height">
                                            <div class="item-img-info">
                                                <a href="{$product.link|escape:'html':'UTF-8'}"
                                                   title="{$product.name|escape:'html':'UTF-8'}" {$product._target} >
                                                    <img class="img_1" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')}"  alt="{$product.name|escape:html:'UTF-8'}" />
													{if isset($product._images.1)}
														<img  class="img_0" src="{$link->getImageLink($product.link_rewrite, $product._images.1, 'home_default')}"  alt="{$product.name|escape:html:'UTF-8'}" />
													{/if}
                                                </a>
                                            </div>
											{if isset($quick_view) && $quick_view}
												<div class="quick-view-wrapper-mobile">
													<a class="quick-view-mobile" href="{$product.link|escape:'html':'UTF-8'}"  title="{l s='Quick view' }"  rel="{$product.link|escape:'html':'UTF-8'}">
														<i class="fa fa-search"></i>
													</a>
												</div>
											{/if}
											<!--{if isset($product.new) && $product.new == 1}
												<span class="new-box">
												   {l s='New!'}
												</span>
											{/if}
											{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
												<span class="sale-box">
													{l s='Sale!'}
												</span>
											{/if}-->
											<div class="bg_hover"></div>
                                        </div>
                                    {/if}
                                    <div class="item-info {assign var='cls' value=($params.theme == 'theme2')?' item-spotlight':''}{$cls}">
                                        <div class="item-inner">
                                            {if $params.dis_name}
                                                <div class="item-title">
                                                    <a href="{$product.link|escape:'html':'UTF-8'}"
                                                       title="{$product.name|escape:'html':'UTF-8'}" {$product._target} >
                                                        {$product.title|escape:'html':'UTF-8'}
                                                    </a>
                                                </div>
                                            {/if}
                                            <div class="item-content">
                                                {if $params.dis_desc}
                                                    <div class="item-des">
                                                        {$product.desc}
                                                    </div>
                                                {/if}
                                                {if $params.dis_price}
                                                    {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
                                                        <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" class="content_price">
                                                            {if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
                                                                <div itemprop="price" class="price product-price">
														            {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
													            </div>
                                                                <meta itemprop="priceCurrency" content="{$currency->iso_code}"/>
                                                                {if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
                                                                    {hook h="displayProductPriceBlock" product=$product type="old_price"}
                                                                    <span class="old-price product-price">
															            {displayWtPrice p=$product.price_without_reduction}
														            </span>
                                                                    {hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
                                                                    {if $product.specific_prices.reduction_type == 'percentage'}
                                                                        <div class="price-percent-reduction">
																			<span class="txt-label">{l s='Save'} </span>
																			<span class="n-sale">{$product.specific_prices.reduction * 100}%</span>
																		</div>
                                                                    {/if}
                                                                {/if}
                                                                {hook h="displayProductPriceBlock" product=$product type="price"}
                                                                {hook h="displayProductPriceBlock" product=$product type="unit_price"}
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                {/if}
												
												{hook h='displayProductListReviews' product=$product}
												{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}
												
                                                {if $params.dis_addtocart || $params.dis_detail}
                                                <div class="button-container">
                                                    {if $params.dis_addtocart}
                                                        {if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
                                                            {if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
                                                                {if isset($static_token)}
                                                                    <a class="button ajax_add_to_cart_button cart_button btn btn-default"
                                                                       href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
                                                                       rel="nofollow" title="{l s='Add to cart'}"
                                                                       data-id-product="{$product.id_product|intval}">
																	   
                                                                        <span>{l s='Add to cart'}</span>
                                                                    </a>
                                                                {else}
                                                                    <a class="button ajax_add_to_cart_button btn btn-default"
                                                                       href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}"
                                                                       rel="nofollow" title="{l s='Add to cart'}"
                                                                       data-id-product="{$product.id_product|intval}">
                                                                        <span>{l s='Add to cart'}</span>
                                                                    </a>
                                                                {/if}
                                                            {else}
                                                                <span class="button ajax_add_to_cart_button btn btn-default disabled">
																	<span>{l s='Add to cart'}</span>
																</span>
                                                            {/if}
                                                        {/if}
                                                    {/if}
                                                    {if $params.dis_detail}
                                                        <a itemprop="url" class="button lnk_view btn btn-default" {$product._target}	href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
                                                            <span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='More'}{/if}</span>
                                                        </a>
                                                    {/if}
													

													{hook h='displayProductListFunctionalButtons' product=$product}
													{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
													{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
													{addJsDefL name=add_compare_item}{l s='You add  to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
													{addJsDef comparator_max_item=$comparator_max_item}
													{addJsDef comparedProductsIds=$compared_products}
													{if isset($comparator_max_item) && $comparator_max_item}
														<div class="compare">
															<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-toggle="tooltip" title="{l s='Add to compare'}" data-id-product="{$product.id_product}"></a>
														</div>
													{/if}
													
													
													

                                                </div>
												
											
                                            </div>
                                            {/if}
                                            {if $params.theme == 'theme2'}
                                                {if $params.dis_name}
                                                    <div class="item-bg"></div>
                                                {/if}
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        {if $params.ctr_pos !="top"}
            {if $params.ctr_dis}
                <div class="page-button {$params.ctr_pos} {$params.ctr_type}">
                    <ul class="control-button">
                        <li class="preview">{l s='Prev' mod='sp_bestseller_products'}</li>
                        <li class="next">{l s='Next' mod='sp_bestseller_products'}</li>
                    </ul>
                </div>
            {/if}
        {/if}
    </div>
    {if $params.posttext != '' }
        <div class="post-text">
            {$params.posttext}
        </div>
    {/if}
    <script type="text/javascript">
        //<![CDATA[
        jQuery(document).ready(function ($) {
            ;
            (function (element) {
                var $el = $(element);

                function runSlider() {
                    $('.slider', $el).responsiver({
                        interval: {$params.interval},
                        speed: {$params.speed},
                        start: {$params.start},
                        step: {$params.step},
                        circular: true,
                        preload: true,
                        pause: '{$params.stop}',
                        control: {
                            prev: '#{$tag_id} .control-button li[class="preview"]',
                            next: '#{$tag_id} .control-button li[class="next"]'
                        },
                        getColumns: function (_element) {
                            var match = $(_element).attr('class').match(/cols-(\d+)/);
                            if (match[1]) {
                                var column = parseInt(match[1]);
                            } else {
                                var column = 1;
                            }
                            if (!column) column = 1;
                            return column;
                        }
                    });
                }

                var _timer = 0;
                $(window).load(function () {
                    if (_timer) clearTimeout(_timer);
                    _timer = setTimeout(function () {
                        $el.removeClass('sp-preload');
                        $('.sp-loading', $el).remove();
                        runSlider();
                    }, 1000);
                });

                {if $params.swipe}
                $('.slider', $el).touchSwipeLeft(function () {
                            $('.slider', $el).responsiver('next');
                        }
                );
                $('.slider', $el).touchSwipeRight(function () {
                            $('.slider', $el).responsiver('prev');
                        }
                );
                {/if}

            })('#{$tag_id}')

        });
        //]]>
    </script>
{else}
    {l s='Has no content to show!' mod='sp_bestseller_products'}
{/if}	
 