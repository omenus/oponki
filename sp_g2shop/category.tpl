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

{include file="$tpl_dir./errors.tpl"}

{if isset($category)}
	{if $category->id AND $category->active}

			<div class="content_scene_cat ">
            	 {if $scenes}
                 	<div class="content_scene">
                        <!-- Scenes -->
                        {include file="$tpl_dir./scenes.tpl" scenes=$scenes}
                        {if $category->description}
                            <div class="cat_desc rte">
                            {if Tools::strlen($category->description) > 350}
                                <div id="category_description_short">{$description_short}</div>
                                <div id="category_description_full" class="unvisible">{$category->description}</div>
                                <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
                            {else}
                                <div>{$category->description}</div>
                            {/if}
                            </div>
                        {/if}
                    </div>
				{else}

				<!-- Category name #-->
				
					
					<div class="content_scene">
						<h1 class="category-name">
							{strip}
								{$category->name|escape:'html':'UTF-8'}
								{if isset($categoryNameComplement)}
									{$categoryNameComplement|escape:'html':'UTF-8'}
								{/if}
							{/strip}
						</h1>
						{if $category->description}
						{if Tools::strlen($category->description) > 350}
							<div id="category_description_short" class="rte">{$description_short}</div>
							<div id="category_description_full" class="unvisible rte">{$category->description}</div>
							<a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
						{else}
							<div class="rte">{$category->description}</div>
						{/if}
						{/if}
					</div>
				
				
				<!-- Category image 
					<div class="category-image">
						<img src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')|escape:'html':'UTF-8'}" />
						
					</div>
				-->
                  {/if}
            </div>


		{if isset($subcategories)}
        {if (isset($display_subcategories) ) || !isset($display_subcategories) }
		<!-- Subcategories 
		<div id="subcategories">
			<h3 class="subcategory-heading">{l s='Subcategories'}</h3>
			<div class="row">
			{assign var='i' value='0'}
			{foreach from=$subcategories item=subcategory}
				{$i=$i+1}
				<div class="col-md-4 col-xs-6 col-sp-12 ">
                	<div class="subcategories-box">
						<!--<div class="subcategory-image">
							<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
							{if $subcategory.id_image}
							
								<img class="replace-2x" src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image)}" alt="" />
							{else}
								<img class="replace-2x" src="{$img_cat_dir}default-medium_default.jpg" alt=""  />
							{/if}
						</a>
						</div>
						<h4><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'|truncate:350}</a></h4>
						{if $subcategory.description}
							<div class="cat_desc">{$subcategory.description}</div>
						{/if}
					</div>
				</div>
			{/foreach}
			</div>
		</div>-->
        {/if}
		{/if}
		{if $products}
			<div class="content_sortPagiBar clearfix">
            	<div class="sortPagiBar  clearfix">
					<div class="row">
						<div class="col-md-9 col-sm-12 col-xs-9">	
							{include file="./product-sort.tpl"}
							{include file="./nbr-product-page.tpl"}
						</div>
						<div class="product-compare col-md-3 col-sm-12 col-xs-3 ">
							{include file="./product-compare.tpl"}
						</div>
					</div>
				</div>
                
			</div>
			{include file="./product-list.tpl" products=$products}
			
			<div class="content_sortPagiBar">
				<div class="bottom-pagination-content row clearfix">
					<div class="col-md-12 col-sm-12 col-xs-12 ">
						{include file="./pagination.tpl" paginationId='bottom'}
					</div>
					
				</div>
			</div>
		{/if}
	{elseif $category->id}
		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}
