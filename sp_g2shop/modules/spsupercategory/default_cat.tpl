{*
 * @package SP Super Category
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author MagenTech http://www.magentech.com
 *}

<div class="category-wrap-cat">
    {if (!empty($items->products.category_parent))}
        <div class="sp-cat-title-parent"
             data-catids="{$items->products.category_parent.cat_array}">
            <a title="{$items->products.category_parent.name}"
               href="{$items->products.category_parent.link}"
                    {$items->products.category_parent._target}>
                {$items->products.category_parent.name}
            </a>
        </div>
    {/if}

    {if !empty($items->products.category_tree)}
        <div class="slider">
            <div class="cat_slider_inner">
                {foreach from=$items->products.category_tree item=cat}
                    <div class="item">
                        <div class="item-inner">
                            {if $cat.image}
                                <div class="cat_slider_image">
                                    <a href="{$cat.link|escape:'html':'UTF-8'}"
                                       title="{$cat.name|escape:'html':'UTF-8'}" {$cat._target} >
                                        {assign var="src" value=($items->params.cat_image_size != 'none')?{$link->getCatImageLink($cat.link_rewrite, $cat.id_category, $items->params.cat_image_size)|escape:'html'}:{$link->getCatImageLink($cat.link_rewrite, $cat.id_category)|escape:'html'}}
                                        <img src="{$src}" alt="{$cat.name|escape:html:'UTF-8'}"/>
                                    </a>
                                </div>
                            {/if}

                            {if $items->params.cat_sub_name_display == 1}
                                <div class="cat_slider_title">
                                    <a href="{$cat.link}"
                                       title="{$cat.name}" {$cat._target}>
                                        {$cat.name}
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}
</div>
