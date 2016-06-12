<?php

namespace wcf\data\serverlist;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\system\exception\UserInputException;

/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 14:29
 */

class ServerListAction extends AbstractDatabaseObjectAction {

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$className
     */
    protected $className = 'wcf\data\serverlist\ServerListEditor';

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsDelete
     */
    protected $permissionsDelete = array('admin.community.serverlist.canDelete');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsUpdate
     */
    protected $permissionsUpdate = array('admin.community.serverlist.canEdit');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$requireACP
     */
    protected $requireACP = array('delete', 'create', 'update');

    /**
     * @throws UserInputException
     */
    public function validateServerStatus(){
        if (empty($this->objects)) {
            $this->readObjects();

            if (empty($this->objects)) {
                throw new UserInputException('objectIDs');
            }
        }
    }
}