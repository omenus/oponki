{*
 * @package SP Super Category
 * @version 1.0.0
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 * @copyright (c) 2014 YouTech Company. All Rights Reserved.
 * @author MagenTech http://www.magentech.com
 *}

<script type="text/javascript">
//<![CDATA[
jQuery(document).ready(function ($) {
    ;
    (function (element) {
        var $element = $(element),
                $tab = $('.spcat-tab', $element),
                $tab_label = $('.spcat-tab-label', $tab),
                $tabs = $('.spcat-tabs', $element),
                ajax_url = $tabs.parents('.spcat-tabs-container').attr('data-ajaxurl'),
                effect = $tabs.parents('.spcat-tabs-container').attr('data-effect'),
                delay = $tabs.parents('.spcat-tabs-container').attr('data-delay'),
                duration = $tabs.parents('.spcat-tabs-container').attr('data-duration'),
                rl_moduleid = $tabs.parents('.spcat-tabs-container').attr('data-modid'),
                $items_content = $('.spcat-items', $element),
                $items_inner = $('.spcat-items-inner', $items_content),
                $items_first_active = $('.spcat-items-selected', $element),
                $load_more = $('.spcat-loadmore', $element),
                $btn_loadmore = $('.spcat-loadmore-btn', $load_more),
                $select_box = $('.spcat-selectbox', $element),
                $id_cate = $('.spcat-tab', $element).attr('data-id-cate'),
                $tab_label_select = $('.spcat-tab-selected', $element),
                category_id = $('.sp-cat-title-parent', $element).attr('data-catids');

        enableSelectBoxes();
        function enableSelectBoxes() {
            $tab_wrap = $('.spcat-tabs-wrap', $element);
            $tab_label_select.html($('.spcat-tab', $element).filter('.tab-sel').children('.spcat-tab-label').html());
            if ($(window).innerWidth() <= 479) {
                $tab_wrap.addClass('spcat-selectbox');
            } else {
                $tab_wrap.removeClass('spcat-selectbox');
            }
        }

        $('span.spcat-tab-selected, span.spcat-tab-arrow', $element).click(function () {
            if ($('.spcat-tabs', $element).hasClass('spcat-open')) {
                $('.spcat-tabs', $element).removeClass('spcat-open');
            } else {
                $('.spcat-tabs', $element).addClass('spcat-open');
            }
        });

        $(window).resize(function () {
            if ($(window).innerWidth() <= 479) {
                $('.spcat-tabs-wrap', $element).addClass('spcat-selectbox');
            } else {
                $('.spcat-tabs-wrap', $element).removeClass('spcat-selectbox');
            }
        });

        function showAnimateItems(el) {
            var $_items = $('.new-spcat-item', el), nub = 0;
            $('.spcat-loadmore-btn', el).fadeOut('fast');
            $_items.each(function (i) {
                nub++;
                switch (effect) {
                        {literal}
                    case 'none' :
                        $(this).css({'opacity': '1', 'filter': 'alpha(opacity = 100)'});
                        break;
                        {/literal}
                    default:
                        animatesItems($(this), nub * delay, i, el);
                }
                if (i == $_items.length - 1) {
                    $('.spcat-loadmore-btn', el).fadeIn(delay);
                }
                $(this).removeClass('new-spcat-item');
            });
        }

        function animatesItems($this, fdelay, i, el) {
            var $_items = $('.spcat-item', el);
            $this.attr("style",
                    "-webkit-animation:" + effect + " " + duration + "ms;"
                    + "-moz-animation:" + effect + " " + duration + "ms;"
                    + "-o-animation:" + effect + " " + duration + "ms;"
                    + "-moz-animation-delay:" + fdelay + "ms;"
                    + "-webkit-animation-delay:" + fdelay + "ms;"
                    + "-o-animation-delay:" + fdelay + "ms;"
                    + "animation-delay:" + fdelay + "ms;").delay(fdelay).animate({
                        opacity: 1,
                        filter: 'alpha(opacity = 100)'
                    }, {
                        delay: 100
                    });
            if (i == ($_items.length - 1)) {
                $(".spcat-items-inner").addClass("play");
            }
        }

        showAnimateItems($items_first_active);
        $tab.on('click.tab', function () {
            var $this = $(this);
            if ($this.hasClass('tab-sel')) return false;
            if ($this.parents('.spcat-tabs').hasClass('spcat-open')) {
                $this.parents('.spcat-tabs').removeClass('spcat-open');
            }
            $tab.removeClass('tab-sel');
            $this.addClass('tab-sel');
            var items_active = $this.attr('data-active-content');

            var _items_active = $(items_active, $element);
            $items_content.removeClass('spcat-items-selected');
            _items_active.addClass('spcat-items-selected');
            $tab_label_select.html($tab.filter('.tab-sel').children('.spcat-tab-label').html());
            var $loading = $('.spcat-loading', _items_active);
            var loaded = _items_active.hasClass('spcat-items-loaded');
            if (!loaded && !_items_active.hasClass('spcat-process')) {
                _items_active.addClass('spcat-process');
                var field_order = $this.attr('data-field_order');
                $loading.show();
                $.ajax({
                    type: 'POST',
                    url: ajax_url,
                    data: {
                        spcat_module_id: rl_moduleid,
                        is_ajax_super_category: 1,
                        ajax_limit_start: 0,
                        categoryid: category_id,
                        fieldorder: field_order
                    },
                    success: function (data) {
                        if (data.items_markup != '') {
                            $('.spcat-items-inner', _items_active).html(data.items_markup);
                            _items_active.addClass('spcat-items-loaded').removeClass('spcat-process');
                            $loading.remove();
                            showAnimateItems(_items_active);
                            updateStatus(_items_active);
                        }
                    },
                    dataType: 'json'
                });

            } else {
                $('.spcat-item', $items_content).removeAttr('style').addClass('new-spcat-item').css('opacity', 0);
                showAnimateItems(_items_active);
            }
        });

        function updateStatus($el) {
            $('.spcat-loadmore-btn', $el).removeClass('loading');
            var countitem = $('.spcat-item', $el).length;
            {literal}
            $('.spcat-image-loading', $el).css({display: 'none'});
            {/literal}
            $('.spcat-loadmore-btn', $el).parent().attr('data-rl_start', countitem);
            var rl_total = $('.spcat-loadmore-btn', $el).parent().attr('data-rl_total');
            var rl_load = $('.spcat-loadmore-btn', $el).parent().attr('data-rl_load');
            var rl_allready = $('.spcat-loadmore-btn', $el).parent().attr('data-rl_allready');

            if (countitem >= rl_total) {
                $('.spcat-loadmore-btn', $el).addClass('loaded');
                {literal}
                $('.spcat-image-loading', $el).css({display: 'none'});
                {/literal}
                $('.spcat-loadmore-btn', $el).attr('data-label', rl_allready);
                $('.spcat-loadmore-btn', $el).removeClass('loading');
            }
        }

        $btn_loadmore.on('click.loadmore', function () {
            var $this = $(this);
            if ($this.hasClass('loaded') || $this.hasClass('loading')) {
                return false;
            } else {
                $this.addClass('loading');
                {literal}
                $('.spcat-image-loading', $this).css({display: 'inline-block'});
                {/literal}
                var rl_start = $this.parent().attr('data-rl_start'),
                        rl_moduleid = $this.parent().attr('data-modid'),
                        rl_ajaxurl = $this.parent().attr('data-ajaxurl'),
                        effect = $this.parent().attr('data-effect'),
                        field_order = $this.parent().attr('data-field_order'),
                        items_active = $this.parent().attr('data-active-content');
                var _items_active = $(items_active, $element);
                $.ajax({
                    type: 'POST',
                    url: rl_ajaxurl,
                    data: {
                        spcat_module_id: rl_moduleid,
                        is_ajax_super_category: 1,
                        ajax_limit_start: rl_start,
                        categoryid: category_id,
                        fieldorder: field_order
                    },
                    success: function (data) {
                        if (data.items_markup != '') {
                            $(data.items_markup).insertAfter($('.spcat-item', _items_active).nextAll().last());
                            {literal}
                            $('.spcat-image-loading', $this).css({display: 'none'});
                            {/literal}
                            showAnimateItems(_items_active);
                            updateStatus(_items_active);
                        }
                    }, dataType: 'json'
                });
            }
            return false;
        });
		{assign var="nb__column4" value=($items->params.nb__column4)?$items->params.nb__column4:1}
		{assign var="nb__column3" value=($items->params.nb__column3)?$items->params.nb__column3:2}
		{assign var="nb__column2" value=($items->params.nb__column2)?$items->params.nb__column2:4}
		{assign var="nb__column1" value=($items->params.nb__column1)?$items->params.nb__column1:6}  
        var $cat_slider_inner = $('.cat_slider_inner', element);
        $cat_slider_inner.owlCarousel({
            center: {$center},
            nav: {$nav},
            loop: {$loop},
            margin: {$margin},
            navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
            slideBy: {$slideBy},
            autoplay: {$autoplay},
            autoplayHoverPause: {$autoplayHoverPause},
            autoplayTimeout: {$autoplayTimeout},
            autoplaySpeed: {$autoplaySpeed},
            navSpeed: {$navSpeed},
            smartSpeed: {$smartSpeed},
            startPosition: {$startPosition},
            mouseDrag: {$mouseDrag},
            touchDrag:{$touchDrag},
            pullDrag:{$pullDrag},
            dots: false,
            autoWidth: false,
            navClass: ['owl-prev', 'owl-next'],
            responsive: {
                0: {literal}{{/literal} items:{$nb__column4}{literal}}{/literal},
                480: {literal}{{/literal}items:{$nb__column3}{literal}}{/literal},
                768: {literal}{{/literal}items:{$nb__column2}{literal}}{/literal},
                1200: {literal}{{/literal}items:{$nb__column1}{literal}}{/literal}
            }
        });

    })('#{$tag_id}');
});
//]]>
</script>