{*
* 2007-2018 PrestaShop
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2018 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{foreach from=$result item=row}
	<div class="panel">
	<div id="content" class="form-wrapper" >
  <div class="form-content">
		Question {$row['id_Quizmodule']}:
		<input type="text" value="{$row['Question']}">
		First answer:
		<input type="text" value="{$row['Answer_1']}">
		Second answer:
		<input type="text" value="{$row['Answer_2']}">
		Third answer:
		<input type="text" value="{$row['Answer_3']}">
		Fourth answer:
		<input type="text" value="{$row['Answer_4']}">
		<input type="submit" name="submit-query" id="submit-enquiry" value="Update" class="btn btn-primary" style="margin-top:15px;">
		</div>
		</div>
	</div>
{/foreach}


