{*
 * @package SP Super Category
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author MagenTech http://www.magentech.com
 *}
{if isset($list) && !empty($list)}
    {if isset($list) && !empty($list)}
        {foreach from=$list item=items}
            {$_list = $items->products}
            {assign var="moduleclass_sfx" value=( isset( $items->params.moduleclass_sfx ) ) ?  $items->params.moduleclass_sfx : ''}
            {assign var="tag_id" value="sp_super_category_{$items->id_module}"}

            {*//effect*}
			
            {assign var="center" value=($items->params.center == 1)?'true':'false'}
            {assign var="nav" value=($items->params.nav == 1)?'true':'false'}
            {assign var="loop" value=($items->params.loop == 1)?'true':'false'}
            {assign var="margin" value=($items->params.margin)?$items->params.margin:'5'}
            {assign var="slideBy" value=($items->params.slideBy)?$items->params.slideBy:'1'}
            {assign var="autoplay" value=($items->params.autoplay == 1)?'true':'false'}
            {assign var="autoplayTimeout" value=($items->params.autoplayTimeout > 0)?$items->params.autoplayTimeout:2000}
            {assign var="autoplayHoverPause" value=($items->params.autoplayHoverPause == 1)?'true':'false'}
            {assign var="autoplaySpeed" value=($items->params.autoplaySpeed >0)?$items->params.autoplaySpeed:2000}
            {assign var="navSpeed" value=($items->params.navSpeed >0)?$items->params.navSpeed:2000}
            {assign var="smartSpeed" value=($items->params.smartSpeed > 0)?$items->params.smartSpeed:2000}
            {assign var="startPosition" value=($items->params.startPosition)?$items->params.startPosition:0}
            {assign var="mouseDrag" value=($items->params.mouseDrag == 1)?'true':'false'}
            {assign var="touchDrag" value=($items->params.touchDrag == 1)?'true':'false'}
            {assign var="pullDrag" value=($items->params.pullDrag == 1)?'true':'false'}
            <div class="moduletable  {$moduleclass_sfx}">
                {if $items->params.display_title_module}
                    <h3>
                        {$items->title_module[$cookie->id_lang]}
                    </h3>
                {/if}

                {if $items->params.pretext[$cookie->id_lang]}
                    <div class="pretext">
                        {$items->params.pretext[$cookie->id_lang]}
                    </div>
                {/if}

                <!--[if lt IE 9]>
                <div id="{$tag_id}" class="sp-sp-cat msie lt-ie9 first-load"><![endif]-->
                <!--[if IE 9]>
                <div id="{$tag_id}" class="sp-sp-cat msie first-load"><![endif]-->
                <!--[if gt IE 9]><!-->
                <div id="{$tag_id}" class="sp-sp-cat first-load"><!--<![endif]-->
                    <div class="spcat-wrap ">
                        {include file="./default_cat.tpl"}

                        <div class="spcat-tabs-container"
                             data-delay="{$items->params.interval}"
                             data-duration="{$items->params.duration}"
                             data-effect="{$items->params.effect}"
                             data-ajaxurl="{$base_dir}"
                             data-modid="{$items->id_module}">
                            {include file="./default_tabs.tpl"}
                        </div>
                        {if $items->products.tab != ''}
                            <!--Begin Items-->
                            <div class="spcat-items-container">
                                {foreach from=$items->products.tab item=items2}
                                    {assign var="child_items" value=(isset($items2.child))?$items2.child:''}
                                    {assign var="cls_device" value="spcat01-"|cat:$items->params.nb_column1|cat:' spcat02-'|cat:$items->params.nb_column2|cat:' spcat03-'|cat:$items->params.nb_column3|cat:' spcat04-'|cat:$items->params.nb_column4}
                                    {assign var="cls_animate" value=$items->params.effect}
                                    {assign var="cls1" value=(isset($items2.sel) && $items2.sel == 'sel')?' spcat-items-selected spcat-items-loaded':''}
                                    {assign var="cls2" value=" items-category-{$items2.id}"}
                                    <div class="spcat-items {$cls1} {$cls2}">
                                        <div class="spcat-items-inner {$cls_device} {$cls_animate}">
                                            {if !empty($child_items)}
                                                {include file="./default_items.tpl"}
                                            {else}
                                                <div class="spcat-loading"></div>
                                            {/if}
                                        </div>
                                        {assign var="classloaded" value=($items->params.count_number >= $items2.count || $items->params.count_number == 0)?' loaded':'' }
                                        {assign var="classloaded_2" value=($classloaded)?'All Ready':'Load More'}
                                        {assign var="id" value=$items2.id}
                                        <div class="load-clear"></div>
                                        <div class="spcat-loadmore"
                                             data-active-content=".items-category-{$id}"
                                             data-field_order="{$items2.id}"
                                             data-rl_start="{$items->params.count_number}"
                                             data-rl_total="{$items2.count}"
                                             data-rl_allready="All Ready"
                                             data-ajaxurl="{$base_dir}"
                                             data-modid="{$items->id_module}"
                                             data-rl_load="{$items->params.count_number}">
                                            <div class="spcat-loadmore-btn {$classloaded}"
                                                 data-label="{$classloaded_2}">
                                                <span class="spcat-image-loading"></span>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        {else}
                            {l s='Has no content to show! In Module Sp Super Category' mod='spsupercategory'}
                        {/if}
                        <!--End Items-->
                    </div>
                </div>
                {if $items->params.postext[$cookie->id_lang]}
                    <div class="postext">
                        {$items->params.postext[$cookie->id_lang]}
                    </div>
                {/if}

                {include file="./default_js.tpl"}
            </div>
        {/foreach}
    {else}
        {l s='Has no content to show! In Module Sp Super Category' mod='spsupercategory'}
    {/if}
{/if}


