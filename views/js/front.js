/**
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
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/
let currentQuestion = 0;
let answers = [];
let numberOfQuestions = 0;

let nextQuestion = (question) => {
  if(currentQuestion !== 0 ) getAnswer();
  $(`#header_${currentQuestion}`)
    .addClass("animated fadeOut")
    .removeClass("fadeIn")
    .css({ 'display' : 'none'});
  $(`#body_${currentQuestion}`)
    .addClass('animated fadeOut')
    .removeClass("fadeIn")
    .css({ 'display' : 'none'});
    if(question === 0){
      currentQuestion = 1;
      answers = [0];
      numberOfQuestions = $('#questionsCount').val(); 
    } else {
      currentQuestion++;
    }
  $(`#header_${currentQuestion}`)
    .css({ 'display' : ''})
    .removeClass("fadeOut")
    .addClass("animated fadeIn");
  $(`#body_${currentQuestion}`)
    .css({ 'display' : ''})
    .removeClass("fadeOut")
    .addClass("animated fadeIn");
  disable();
}

let getAnswer = () => {
  var radios = $("input[type='radio']");
  answers[currentQuestion] = parseInt(radios.filter(":checked").val());
  if(parseInt(numberOfQuestions) === currentQuestion + 1){
    $('#nextButton').css({'display':'none'});
    $('#finishButton').css({'display':''});
  }
}

let enable = () => {
  $('#nextButton, #finishButton').removeAttr('disabled');
};

let disable = () => {
  $('#nextButton, #finishButton').attr({'disabled':'disabled'});
};

let finishQuiz = () => {
  /*custom function */
}