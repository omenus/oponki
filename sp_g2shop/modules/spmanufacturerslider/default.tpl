{*
 * @package SP Manufacturer Slider
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author YouTech Company http://www.smartaddons.com
 *}

{$list = $spmanufacturerslider}
{if isset($list) && $list}
    {assign var="tag_id" value="sp_manu_slider"}
    {if $params.pretext != '' }
        <div class="pre-text">
            {$params.pretext}
        </div>
    {/if}
    {assign var="cod_style" value=($params.ctr_pos == 'bottom')?'margin-bottom:40px;':''}
    <div id="{$tag_id}" class="sp-manu-slider sp-preload col-sm-12" style="{$cod_style}">
        <div class="sp-loading"></div>
        <div class="page-title-slider">{$params.title_slider}</div>
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
                        {foreach from=$spmanufacturerslider item=manufacturer name=manufacturer_lists}
                            <div class="item">
                                <div class="item-wrap">
                                    {if $smarty.foreach.manufacturer_lists.iteration <= 20}
                                        <div class="item-img item-height">
                                            <div class="item-img-info">
                                                    <a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)}"
                                                       title="{$manufacturer.name}">
                                                        {assign var="myfile" value="img/m/{$manufacturer.id_manufacturer|escape:'htmlall':'UTF-8'}-mf_image.jpg"}
                                                        {if file_exists($myfile)}
                                                            <img
                                                                    src="{$img_manu_dir}{$manufacturer.id_manufacturer|escape:'htmlall':'UTF-8'}-mf_image.jpg"
                                                                    class="logo_manufacturer"
                                                                    title="{$manufacturer.name}"
                                                                    alt="{$manufacturer.name}"/>
                                                        {/if}
                                                    </a>
                                            </div>
                                        </div>
                                    {/if}

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
                        <li class="preview">{l s='Prev' mod='spmanufacturerslider'}</li>
                        <li class="next">{l s='Next' mod='spmanufacturerslider'}</li>
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
                        //fx: 'fade',
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
    {l s='Has no content to show!' mod='spmanufacturerslider'}
{/if}
