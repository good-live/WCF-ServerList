<?php

namespace wcf\data\serverlist;

use wcf\data\DatabaseObjectList;

/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 14:29
 */

class ServerListList extends DatabaseObjectList{
    /**
     * @see    \wcf\data\DatabaseObjectDecorator::$baseClass
     */
    public $className = 'wcf\data\serverlist\ServerList';
}