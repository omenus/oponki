{*
 * @package SP Super Category
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author MagenTech http://www.magentech.com
 *}

{if !isset($items_params)}
    {assign var="items_params" value=$items->params}
{/if}

{if !empty($child_items)}
    {if !isset($kk)}
        {assign var="kk" value="0"}
    {/if}
    {counter start=$kk skip=1 print=false name=count assign="count"}
    {foreach from=$child_items item=product}
        {counter name=count}
        <div class="spcat-item new-spcat-item">
            <div class="item-inner">
                

                <div class="item-image">
                    <a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}"
                       title="{$product.name|escape:'html':'UTF-8'}" {$product._target} >
                        {assign var="src" value=($items_params['image_size'] != 'none') ? {$link->getImageLink($product.link_rewrite, $product.id_image, $items_params['image_size'])|escape:'html'} :  {$link->getImageLink($product.link_rewrite, $product.id_image)|escape:'html'}}
                        <img src="{$src}" alt="{$product.legend|escape:html:'UTF-8'}"/>
						
						{if isset($product._images.1)}
							<img  class="img_0" src="{$link->getImageLink($product.link_rewrite, $product._images.1, 'home_default')}"  alt="{$product.name|escape:html:'UTF-8'}" />
						{/if}
                    </a>
                    {if isset($quick_view) && $quick_view}
						<div class="quick-view-wrapper-mobile">
							<a class="quick-view-mobile" href="{$product.link|escape:'html':'UTF-8'}"  title="{l s='Quick view' }"  rel="{$product.link|escape:'html':'UTF-8'}">
								<i class="fa fa-search"></i>
							</a>
						</div>
					{/if}
					<!--{if isset($product.new) && $product.new == 1}
						<span class="new-box">
						   {l s='New!' mod='spsupercategory'}
						</span>
					{/if}
					{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
						<span class="sale-box">
						   {l s='Sale!' mod='spsupercategory'}
						</span>
					{/if}-->
					{if $product.specific_prices.reduction_type == 'percentage'}
						<div class="price-percent-reduction">
							<span class="txt-label">{l s='Save'} </span>
							<span class="n-sale">{$product.specific_prices.reduction * 100}%</span>
						</div>
					{/if}
					<div class="bg_hover"></div>
                </div>
				
				<div class="item-info">
					<div class="item-inner">

						{if $items_params['display_name'] == 1}
							<div class="item-title ">
								<a href="{$product.link|escape:'html':'UTF-8'}"
								   title="{$product.name|escape:'html':'UTF-8'}" {$product._target}  >
									{$product.title|escape:'html':'UTF-8'}
								</a>
							</div>
						{/if}

						{if $items_params['display_price']}
							<div class="item-price">
								{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
									{if !isset($paginationId) || $paginationId == ''}
										{addJsDefL name=min_item} {l s='Please select at least one product' js=1 mod='spsupercategory'} {/addJsDefL}
										{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1 mod='spsupercategory'}{/addJsDefL}
										{addJsDef comparator_max_item=$comparator_max_item}
										{addJsDef comparedProductsIds=$compared_products}
									{/if}
									<div itemprop="offers" itemscope
										 itemtype="http://schema.org/Offer" class="content_price">
										{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
											<span itemprop="price" class="price product-price">
																		{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
																	</span>
											<meta itemprop="priceCurrency"
												  content="{$currency->iso_code}"/>
											{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
												{hook h="displayProductPriceBlock" product=$product type="old_price"}
												<span class="old-price product-price">
																			{displayWtPrice p=$product.price_without_reduction}
																		</span>
												{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
												
											{/if}
											{hook h="displayProductPriceBlock" product=$product type="price"}
											{hook h="displayProductPriceBlock" product=$product type="unit_price"}
										{/if}
									</div>
								{/if}
							</div>
						{/if}
						
						{hook h='displayProductListReviews' product=$product}
						{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}

						{if $items_params['display_description']}
							<div class="item-des">
								{$product.desc}
							</div>
						{/if}

						{if $items_params['display_addtocart'] || $items_params['display_detail']}
							<div class="button-container">
								{if $items_params['display_addtocart']}
									{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
										{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
											{if isset($static_token)}
												<a class="button ajax_add_to_cart_button cart_button btn btn-default"
												   href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
												   rel="nofollow" title="{l s='Add to cart' mod='spsupercategory'}"
												   data-id-product="{$product.id_product|intval}">
													<span>{l s='Add to cart' mod='spsupercategory'}</span>
												</a>
											{else}
												<a class="button ajax_add_to_cart_button cart_button btn btn-default"
												   href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}"
												   rel="nofollow" title="{l s='Add to cart' mod='spsupercategory'}"
												   data-id-product="{$product.id_product|intval}">
													<span>{l s='Add to cart' mod='spsupercategory'}</span>
												</a>
											{/if}
										{else}
											<span class="button ajax_add_to_cart_button cart_button btn btn-default disabled">
																				<span>{l s='Add to cart' mod='spsupercategory'}</span>
																			</span>
										{/if}
									{/if}
								{/if}
								{if $items_params['display_detail']}
									<a  {$product._target} itemprop="url"
														   class="button lnk_view btn btn-default"
														   href="{$product.link|escape:'html':'UTF-8'}"
														   title="{l s='View' mod='spsupercategory'}" {$product._target}>
										<span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize' mod='spsupercategory'}{else}{l s='More' mod='spsupercategory'}{/if}</span>
									</a>
								{/if}
								
								{if $items_params['display_wishlist'] || $items_params['display_compare']}

									{if !isset($paginationId) || $paginationId == ''}
										{addJsDefL name=min_item}{l s='Please select at least one product' js=1 mod='spsupercategory'}{/addJsDefL}
										{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1 mod='spsupercategory'}{/addJsDefL}
										{addJsDef comparator_max_item=$comparator_max_item}
										{addJsDef comparedProductsIds=$compared_products}
									{/if}
									{if $items_params['display_wishlist']}
										{hook h='displayProductListFunctionalButtons' product=$product}
									{/if}
									{if $items_params['display_compare'] && isset($comparator_max_item) && $comparator_max_item}
										<div class="compare">
											<a class="add_to_compare " title="Add to compare"
											   href="{$product.link|escape:'html':'UTF-8'}"
											   data-id-product="{$product.id_product}"></a>
										</div>
									{/if}

						{/if}
								
							</div>
						{/if}
				
						
				
					</div>
				</div>
            </div>
        </div>
        
    {/foreach}
{/if}



