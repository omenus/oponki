{*
 * @package SP Super Category
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author MagenTech http://www.magentech.com
 *}

<div class="spcat-tabs-wrap">
    <span class='spcat-tab-selected'></span>
    <span class='spcat-tab-arrow'>&#9660;</span>
    <ul class="spcat-tabs cf">
        {foreach from=$items->products.tab item=items2}
            {assign var="tab_sel" value=(isset($items2.sel))?'  tab-sel tab-loaded' : ''}
            {assign var="id" value=$items2.id}
            <li class="spcat-tab {$tab_sel}"
                data-active-content=".items-category-{$id}"
                data-field_order="{$id}">
					<span class="spcat-tab-label">
                        {$items2.title}
					</span>
            </li>
        {/foreach}
    </ul>
</div>
