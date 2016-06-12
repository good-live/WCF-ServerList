<?php
/**
 * Created by PhpStorm.
 * User: Lars
 * Date: 11.06.2016
 * Time: 14:29
 */
namespace wcf\data\serverlist;

use GameQ\GameQ;
use wcf\data\DatabaseObject;

require_once(WCF_DIR . 'lib/data/serverlist/GameQ/Autoloader.php');

class ServerList extends DatabaseObject {
    protected static $databaseTableName = 'serverlist_servers';
    protected static $databaseTableIndexName = 'serverID';

    /**
     * @return array
     */
    public function getServerInfo(){
        $GameQ = new GameQ();
        $GameQ->addFilter("normalize");
        $GameQ->addServer(array(
            'type'    => $this->game,
            'host'    => $this->host . ":" . $this->port,
            'options' => [
                'query_port' => $this->queryport,
            ],
        ));

        $results = $GameQ->process();
        if(!array_key_exists("gq_mapname", $results[$this->host . ":" . $this->port])){
            $results[$this->host . ":" . $this->port]["gq_mapname"] = "";
        }
        $results[$this->host . ":" . $this->port]["oname"] = $this->name;
        return $results;
    }
}