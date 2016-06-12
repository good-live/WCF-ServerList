<?php
/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 15:12
 */

namespace wcf\acp\form;


use wcf\data\serverlist\ServerListAction;
use wcf\form\AbstractForm;
use wcf\system\WCF;

class ServerListServerAddForm extends AbstractForm
{
    /**
     * @see	\wcf\page\AbstractPage::$activeMenuItem
     */
    public $activeMenuItem = 'wcf.acp.menu.link.community.serverlist.add';
    public $templateName = 'serverlistServerAdd';

    // parameters
    public $serverID = '';
    public $name = '';
    public $host = '';
    public $port = 0;
    public $queryport = 0;
    public $game = '';


    /**
     * @see Form::readFormParameters()
     */
    public function readFormParameters() {
        parent::readFormParameters();

        if (isset($_POST['serverID'])) $this->serverID = $_POST['serverID'];
        if (isset($_POST['name'])) $this->name = $_POST['name'];
        if (isset($_POST['host'])) $this->host = $_POST['host'];
        if (isset($_POST['port'])) $this->port = $_POST['port'];
        if (isset($_POST['queryport'])) $this->queryport = $_POST['queryport'];
        if (isset($_POST['game'])) $this->game = $_POST['game'];
    }

    /**
     * @see	\wcf\form\IForm::validate()
     */
    public function validate() {
        parent::validate();
    }



    /**
     * @see Form::save()
     */
    public function save() {
        parent::save();

        $this->objectAction = new ServerListAction(array(), 'create', array('data' => array_merge($this->additionalFields, array(
            'name' => $this->name,
            'host' => $this->host,
            'port' => $this->port,
            'queryport' => $this->queryport,
            'game' => $this->game,
        ))));
        $this->objectAction->executeAction();

        $this->saved();

        // reset values
        $this->serverID = '';
        $this->name = "";
        $this->host = '';
        $this->port = 0;
        $this->queryport = 0;
        $this->game = '';

        // show success
        WCF::getTPL()->assign(array(
            'success' => true
        ));
    }

    /**
     * @see Page::assignVariables()
     */
    public function assignVariables() {
        parent::assignVariables();

        WCF::getTPL()->assign(array(
            'serverID' => $this->serverID,
            'name' => $this->name,
            'host' => $this->host,
            'port' => $this->port,
            'queryport' => $this->queryport,
            'game' => $this->game,
            'action' => 'add'
        ));
    }
}