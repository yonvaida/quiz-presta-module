<?php
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
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class Quizmodule extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'Quizmodule';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Ionut Vaida';
        $this->need_instance = 1;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Block Quiz ');
        $this->description = $this->l('Create your own quiz');

        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
    }

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {
        Configuration::updateValue('QUIZMODULE_LIVE_MODE', false);

        include(dirname(__FILE__).'/sql/install.php');
            
        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayHomeTab') &&
            $this->registerHook('displayLeftColumn');
    }

    public function uninstall()
    {
        Configuration::deleteByName('QUIZMODULE_LIVE_MODE');

        include(dirname(__FILE__).'/sql/uninstall.php');

        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        if (Tools::isSubmit('submit'))
    {
        $questionsAndAnswers = [];
        for($i=1; $i <= Tools::getValue('questionsCount'); $i++){
            array_push($questionsAndAnswers,array(
                'question' => Tools::getValue('question_'.$i),
                'firstAnswer' => Tools::getValue('firstAnswer_'.$i),
                'secondAnswer' => Tools::getValue('secondAnswer_'.$i),
                'thirdAnswer' => Tools::getValue('thirdAnswer_'.$i),
                'fourthAnswer' => Tools::getValue('fourthAnswer_'.$i)
            ));
        };
        $this->updateDatabaseRecords($questionsAndAnswers);
    }
    $this->_displayForm();
    return $this->_html;
    }

    /**
     * Display form used to edit questions
     */
    private function _displayForm() {
        include(dirname(__FILE__).'/sql/questions.php');
        $this->_html .= '
        <form action="'.$_SERVER['REQUEST_URI'].'" method="post">';
        foreach($results as $row){
            $this->_html .=
            '<div class="panel">
                    <label>Question '.$row['id_Quizmodule'].'</label>
                    <input type="text" name="question_'.$row['id_Quizmodule'].'" value="'.$row['Question'].'" />
                    <label>Answer 1</label>
                    <input type="text" name="firstAnswer_'.$row['id_Quizmodule'].'" value="'.$row['Answer_1'].'" />
                    <label>Answer 2</label>
                    <input type="text" name="secondAnswer_'.$row['id_Quizmodule'].'" value="'.$row['Answer_2'].'" />
                    <label>Answer 3</label>
                    <input type="text" name="thirdAnswer_'.$row['id_Quizmodule'].'" value="'.$row['Answer_3'].'" />
                    <label>Answer 4</label>
                    <input type="text" name="fourthAnswer_'.$row['id_Quizmodule'].'" value="'.$row['Answer_4'].'" />
            </div>';
        };
        $this->_html .='
        <input type="hidden" name="questionsCount" value="'.count($results).'"/>
        <input type="submit" name="submit" value="'.$this->l('Update').'" class="button" />
        <input type="submit" name="new" value="'.$this->l('Add new').'" class="button" />
        </form>
        
        ';
    }
    
    private function updateDatabaseRecords($questions){
        echo '<script>console.log("'.$questions[0]['question'].'")</script>';
    }
    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }

    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }

    public function hookDisplayHomeTab()
    {
        include(dirname(__FILE__).'/sql/questions.php');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
        $this->context->smarty->assign(array(
            "Button" => "QUIZ",
            "results" =>  $results
        ));

        return $this->display(__FILE__,"views/templates/front/front.tpl");
    }

    public function hookDisplayLeftColumn()
    {
        return 'Hello world';
    }
}
