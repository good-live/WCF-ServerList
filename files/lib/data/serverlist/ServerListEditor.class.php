<?php

namespace wcf\data\serverlist;

use wcf\data\DatabaseObjectEditor;

/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 14:29
 */

class ServerListEditor extends DatabaseObjectEditor{
    /**
     * @see    \wcf\data\DatabaseObjectDecorator::$baseClass
     */
    protected static $baseClass = 'wcf\data\serverlist\ServerList';

}