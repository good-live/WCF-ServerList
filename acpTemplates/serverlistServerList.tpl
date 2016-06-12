{include file='header' pageTitle='wcf.acp.serverlist.list'}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.serverlist.list{/lang}</h1>
    <script data-relocate="true">
        //<![CDATA[
        $(function() {
            new WCF.Action.Delete('wcf\\data\\serverlist\\ServerListAction', '.jsServerListRow');
        });
        //]]>
    </script>
</header>

<div class="contentNavigation">
    {pages print=true assign=pagesLinks controller="ServerListServerList" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}

    <nav>
        <ul>
            <li><a href="{link controller='ServerListServerAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.serverlist.add{/lang}</span></a></li>

            {event name='contentNavigationButtonsTop'}
        </ul>
    </nav>
</div>

{if $objects|count}
    <div class="tabularBox tabularBoxTitle marginTop">
        <header>
            <h2>{lang}wcf.acp.serverlist.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
        </header>

        <table class="table">
            <thead>
            <tr>
                <th class="columnID columnServerID{if $sortField == 'serverID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='ServerListServerList'}pageNo={@$pageNo}&sortField=serverID&sortOrder={if $sortField == 'serverID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.objectID{/lang}</a></th>
                <th class="columnText columnName{if $sortField == 'name'} active {@$sortOrder}{/if}"><a href="{link controller='ServerListServerList'}pageNo={@$pageNo}&sortField=descr&sortOrder={if $sortField == 'name' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.serverlist.name{/lang}</a></th>
                <th class="columnTitle columnHost{if $sortField == 'host'} active {@$sortOrder}{/if}"><a href="{link controller='ServerListServerList'}pageNo={@$pageNo}&sortField=serverVersion&sortOrder={if $sortField == 'host' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.serverlist.host{/lang}</a></th>
                <th class="columnText columnPort{if $sortField == 'port'} active {@$sortOrder}{/if}"><a href="{link controller='ServerListServerList'}pageNo={@$pageNo}&sortField=descr&sortOrder={if $sortField == 'port' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.serverlist.port{/lang}</a></th>

                {event name='columnHeads'}
            </tr>
            </thead>

            <tbody>
            {foreach from=$objects item=server}
                <tr class="jsServerListRow">
                    <td class="columnIcon">
                        <a href="{link controller='ServerListServerEdit' id=$server->serverID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
                        <span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$server->serverID}" data-confirm-message="{lang}wcf.acp.serverlist.delete.sure{/lang}"></span>

                        {event name='rowButtons'}
                    </td>
                    <td class="columnID">{@$server->serverID}</td>
                    <td class="columnTitle columnName">{$server->name}</td>
                    <td class="columnTitle columnServerAddress">{$server->host}</td>
                    <td class="columnTitle columnServerPort">{$server->port}</td>

                    {event name='columns'}
                </tr>
            {/foreach}
            </tbody>
        </table>

    </div>

    <div class="contentNavigation">
        {@$pagesLinks}

        <nav>
            <ul>
                {event name='contentNavigationButtonsBottom'}
            </ul>
        </nav>
    </div>
{else}
    <p class="info">{lang}wcf.global.noItems{/lang}</p>
{/if}

{include file='footer'}
