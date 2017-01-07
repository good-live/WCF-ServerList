{include file="documentHeader"}
<head>
    <title>{lang}wcf.page.serverlist.title{/lang} - {PAGE_TITLE|language}</title>
    {include file="headInclude"}
</head>

<body id="tpl{$templateName|ucfirst}">
{include file="header"}

<header class="boxHeadline">
    <h1>{lang}wcf.page.serverlist.title{/lang}</h1>
</header>

{include file="userNotice"}

<div class="container marginTop">
    <ul class="containerList serverlist">
        <div>
            <h3 class="block-title" style="background-color:rgba(0,0,0,0.7);">
                <strong>Last Scan:</strong> {$servers.infos.lastScan|date:"%Y-%m-%d"} | 
                <strong>Servers online:</strong> {$servers.infos.serversOnline}
                <strong>Servers:</strong> {$servers.infos.maxServers} | 
                <strong>Players online:</strong> {$servers.infos.actualPlayers}
                <strong>Max. Players:</strong> {$servers.infos.maxPlayers}
            </h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th style='text-align:center'><strong>Status</strong></th>
                    <th style='text-align:center'><strong>Location</strong></th>
                    <th style='text-align:center'><strong>Game</strong></th>
                    <th style='text-align:center'><strong>Name</strong></th>
                    <th style='text-align:center'><strong>Map</strong></th>
                    <th style='text-align:center'><strong>Players</strong></th>
                    <th style='text-align:center'><strong>IP:Port</strong></th>
                    <th style='text-align:center'><strong>Links</strong></th>
                </tr>
                </thead>
                <tbody>
                {foreach from=$servers.servers item="info"}
                    {foreach from=$info item="server" key="name"}
                        {if $server['gq_hostname'] != ""}
                            <tr style="border-color:red;">
                                <td style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);"><span style="display: inline;padding: .2em .6em .3em;font-size: 75%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;border-radius: .25em;background-color: #77b300;">Online</span></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white"><img src='{$__wcf->getPath()}images/serverlist/icons/de.png'/></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white"><img src='{$__wcf->getPath()}images/serverlist/servers/{$server['gq_type']}.png'/></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white">{$server['gq_hostname']}</td>
                                <td id="map" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;">{$server['gq_mapname']}</td>
                                <td id="players" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;">{$server['gq_numplayers']}/{$server['gq_maxplayers']}<br/><progress style="background-color: #77b300;" value="{$server['gq_numplayers']}" max="{$server['gq_maxplayers']}"></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;"><a href="{$server['gq_joinlink']}">{$name}</a></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;"><a href="{$server['gq_joinlink']}"><img src='{$__wcf->getPath()}images/serverlist/icons/steam.png'/></a></td>
                            </tr>
                        {else}
                            <tr style="border-color:red;">
                                <td style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);"><span style="display: inline;padding: .2em .6em .3em;font-size: 75%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;border-radius: .25em;background-color: red;">Offline</span></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white"><img src='{$__wcf->getPath()}images/serverlist/icons/de.png'/></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white"><img src='{$__wcf->getPath()}images/serverlist/servers/{$server['gq_type']}.png'/></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3); color:white">{$server['oname']}</td>
                                <td id="map" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;">{$server['gq_mapname']}</td>
                                <td id="players" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;">{$server['gq_numplayers']}/{$server['gq_maxplayers']}</td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;"><a href="{$server['gq_joinlink']}">{$name}</a></td>
                                <td id="address" class="loading last" style="vertical-align:middle;text-align:center;background-color:rgba(0,0,0,0.3);color:white;"><a href="{$server['gq_joinlink']}"><img src='{$__wcf->getPath()}images/serverlist/icons/steam.png'/></a></td>
                            </tr>
                        {/if}
                    {/foreach}
                {/foreach}
                </tbody>
            </table>
        </div>
    </ul>
</div>
{include file="footer"}
</body>
