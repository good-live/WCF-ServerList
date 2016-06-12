<?php
/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 17:16
 */

namespace wcf\system\cache\builder;


use wcf\data\serverlist\ServerList;
use wcf\system\WCF;

class ServerListCacheBuilder extends AbstractCacheBuilder
{
    /**
     * @see	\wcf\system\cache\builder\AbstractCacheBuilder::$maxLifetime
     */
    protected $maxLifetime = SERVERLIST_REFRESH;

    /**
     * @see	\wcf\system\cache\builder\AbstractCacheBuilder::rebuild()
     */
    protected function rebuild(array $parameters) {
        $servers = $this->getActiveServers();
        foreach ($servers as $key => $server) {
            $server = (object) $server;
            $serverlist = new ServerList($server->serverID);
            $servers[$key] = $serverlist->getServerInfo();
        }
        return $servers;
    }

    /**
     * @return array
     * @throws \wcf\system\database\DatabaseException
     */
    public function getActiveServers() {
        $result = array();
        $sql = "SELECT	*
                FROM	wcf".WCF_N."_serverlist_servers";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        while($row = $statement->fetchArray()) {
            $result[$row['serverID']] = $row;
        }
        return $result;
    }
}