<?php
/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 15:12
 */

namespace wcf\acp\form;


use wcf\data\serverlist\ServerList;
use wcf\data\serverlist\ServerListAction;
use wcf\form\AbstractForm;
use wcf\system\WCF;

class ServerListServerEditForm extends ServerListServerAddForm
{
    /**
     * @see    \wcf\page\AbstractPage::$activeMenuItem
     */
    public $activeMenuItem = 'wcf.acp.menu.link.serverlist';
    public $serverID = 0;
    public $server = null;



    /**
     * @see	\wcf\page\IPage::readParameters()
     */
    public function readParameters() {
        AbstractForm::readParameters();

        if (isset($_REQUEST['id'])) $this->serverID = intval($_REQUEST['id']);
        $this->server = new ServerList($this->serverID);
        if (!$this->server->serverID) {
            throw new IllegalLinkException();
        }
    }



    /**
     * @see Form::validate()
     */
    public function save() {
        AbstractForm::save();

        $this->objectAction = new ServerListAction(array(), 'update', array('data' => array_merge($this->additionalFields, array(
            'name' => $this->name,
            'host' => $this->host,
            'port' => $this->port,
            'queryPort' => $this->queryport,
            'game' => $this->game,
        ))));

        $this->objectAction->executeAction();

        $this->saved();

        // show success message
        WCF::getTPL()->assign(array(
            'success' => true
        ));

    }

    /**
     * @see Page::readData()
     */
    public function readData() {
        parent::readData();

        if (empty($_POST)) {
            // default value
            $this->serverID = $this->server->serverID;
            $this->name = $this->server->name;
            $this->host = $this->server->host;
            $this->port = $this->server->port;
            $this->queryport = $this->server->queryport;
            $this->game = $this->server->game;

        }
    }


    /**
     * @see Page::assignVariables()
     */
    public function assignVariables() {
        parent::assignVariables();
        WCF::getTPL()->assign(array(
            'server' => $this->server,
            'action'    => 'edit'
        ));
    }
}