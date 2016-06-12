<?php
namespace wcf\acp\page;
use wcf\page\SortablePage;

/**
 * Shows information about minecraft servers.
 *
 * @author        Olaf Braun
 * @copyright     2016 Olaf Braun - Software Development
 *
 * @package       wcf\acp\page
 */
class ServerListServerListPage extends SortablePage{
    public $templateName = 'serverlistServerList';
    public $defaultSortField = 'serverID';
    public $objectListClassName = 'wcf\data\serverlist\ServerListList';
    public $activeMenuItem = 'wcf.acp.menu.link.community.serverlist.list';
}