<?php
/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 17:25
 */

namespace wcf\page;

use wcf\system\cache\builder\ServerListCacheBuilder;
use wcf\system\WCF;

class ServerListPage extends AbstractPage
{

    /**
     * @see	\wcf\page\AbstractPage::$activeMenuItem
     */
    public $activeMenuItem = 'wcf.page.serverlist';
    public $neededPermissions = array('user.board.serverlist.canView');

    /**
     * @see	\wcf\page\IPage::assignVariables()
     */
    public function assignVariables() {
        parent::assignVariables();

        $servers = ServerListCacheBuilder::getInstance()->getData();
        $servers = $this->fixObject($servers);

        WCF::getTPL()->assign('servers', $servers);
    }

    public function fixObject(&$object)
    {
        if (!is_object($object) && gettype($object) == 'object') {
            return ($object = unserialize(serialize($object)));
        }
        return $object;
    }
}