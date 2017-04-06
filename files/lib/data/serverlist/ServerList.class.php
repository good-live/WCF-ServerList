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
        if($this->game == "discord") {
            $response = file_get_contents("https://discordapp.com/api/guilds/" . $this->host . "/embed.json");
            $response = json_decode($response);
            $results = array(
                $response['name'] => array(
                    "gq_type" => "discord",
                    "gq_hostname" => $response['name'],
                    "gq_mapname" => "",
                    "gq_numplayers" => count($response['members']),
                    "gq_maxplayers" => 0,
                    "gq_joinlink" => $response['instant_invite'],
                ),
            );
        }else{
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
        }
        return $results;
    }
}
