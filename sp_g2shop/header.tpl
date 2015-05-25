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
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"><![endif]-->
<!--[if chrome]> <html class="chrome" lang="{$lang_iso}"><![endif]-->
<html lang="{$lang_iso}">
	<head>
		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
{/if}
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes"/>
		<meta name="apple-mobile-web-app-capable" content="yes" /> 
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
	
		<link href="{$css_dir}bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
		<link href="{$css_dir}font-awesome/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
	{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
		
		<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
	{/foreach}
	
	{* Add custom css *}
		<link rel="stylesheet" href="{$css_dir}font-awesome/font-awesome.css" type="text/css" media="{$media}" />
		<link rel="stylesheet" href="{$css_dir}system_tool.css" type="text/css" media="{$media}" />
		<link rel="stylesheet" href="{$css_dir}responsive.css" type="text/css" media="{$media}" />
		<!--[if IE 9]><link rel="stylesheet" type="text/css" href="{$css_dir}ie9.css"><![endif]-->
		
		
	{/if}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
	{$js_def}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
	{/foreach}
	<!---->
	{* Add custom JQuery *}
	
	{if $scrolltop } <script type="text/javascript" src="{$js_dir}backtotop.js"></script>{/if}
	{if $keepmenu } <script type="text/javascript" src="{$js_dir}keepmenu.js"></script>{/if}
	{if $animate_scroll } <script type="text/javascript" src="{$js_dir}scrollReveal.js"></script>{/if}
	<script type="text/javascript" src="{$js_dir}jquery.prettyPhoto.js"></script>
	
{/if}
		{$HOOK_HEADER}
		<!--<link rel="stylesheet" href="http{if Tools::usingSecureMode()}s{/if}://fonts.googleapis.com/css?family=Open+Sans:300,600&amp;subset=latin,latin-ext" type="text/css" media="all" />-->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if}  itemscope itemtype="http://schema.org/WebPage" class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso}">
	
	{if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span></p>
			</div>
		{/if}
		
		<div id="page">
			
			<div class="header-container">
				<header id="header">
				<div class="header-bottom clearfix">
						<div class="container">
							<div class="row">
								{if isset($HOOK_TOP)}{$HOOK_TOP}{/if}
								
								<div id="topnav" class="col-md-8 col-sm-9 aright">
									{hook h="displayTop1"}
									{hook h="displayNav"}
								
									{hook h="displayTop3"}
									{hook h="displayTop2"}
								</div>
							</div>
						</div>
					</div> 
								
					
					
					{if $page_name == 'index'}  
					<div class="header-bottom2 clearfix">
						<div class="container">
							{hook h="displayTop4"}
						</div>
					</div>
					{/if}
				</header>
			</div>
			
			{if $page_name == 'index'} 
				{assign var='displaySlideShow' value={hook h='displaySlideShow'}}
				{if $displaySlideShow}
					<div class="slider-container">
						<div class="container">
							<div class="row">
								{hook h="displaySlideShow"}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name !='index' && $page_name !='pagenotfound'}  {/if}
				<div id="breadcrumb-container">
					<div class="container">
						<div class="row">
							<div id="ps_breadcrumb" class="col-sm-12">
								{include file="$tpl_dir./breadcrumb.tpl"}
							</div>
						</div>
					</div>
				</div>
			
			
			<div class="columns-container">
				<div id="columns" class="container">
					
					<div class="row">
						
						{if isset($left_column_size) && !empty($left_column_size)}
						<div id="left_column" class="column col-sm-{$left_column_size_sm|intval} col-md-{$left_column_size|intval}">{$HOOK_LEFT_COLUMN}</div>
						{/if}
						
						{if isset($left_column_size)}
							{assign var='cols' value=(12 - $left_column_size)}
							{assign var='cols_sm' value=(12 - $left_column_size_sm)}
						{else}
							{assign var='cols' value=12}
							{assign var='cols_sm' value=12}
						{/if}
						
						
						{if $page_name == 'index' || $page_name == 'category'}
						<div id="right_column" class="col-sm-{$cols_sm|intval} col-md-{$cols|intval} column ">{hook h="displayRightColumn"}</div>
						{/if}
						<div id="center_column" class="center_column col-sm-{$cols_sm|intval} col-md-{$cols|intval}">
							{if $page_name == 'index'}  
								{assign var='displayBottom1' value={hook h='displayBottom1'}}
								{if $displayBottom1}
								<div class="ps-spotlight1 clearfix">
										<div class="row">
											{hook h="displayBottom1"}	
										</div>
								</div>
								{/if}
								
								{assign var='displayBottom2' value={hook h='displayBottom2'}}
								{if $displayBottom2}
								<div class="ps-spotlight2 clearfix">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												{hook h="displayBottom2"}
											</div>
										</div>
								</div>
								{/if}
								
								{assign var='displayBottom3' value={hook h='displayBottom3'}}
								{if $displayBottom3}
								<div class="ps-spotlight3 clearfix">
										{hook h="displayBottom3"}	
								</div>
								{/if}
								
								
								
							{/if}
							
						{/if}