{include file='header' pageTitle='wcf.acp.serverlist.'|concat:$action}

<header class="boxHeadline">
    <h1>{lang}wcf.acp.serverlist.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
    <p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
    <nav>
        <ul>
            <li><a href="{link controller='ServerListServerList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.community.serverlist.list{/lang}</span></a></li>

            {event name='contentNavigationButtons'}
        </ul>
    </nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='ServerListServerAdd'}{/link}{else}{link controller='ServerListServerEdit' id=$server->serverID}{/link}{/if}">
    <div class="container containerPadding marginTop">
        <fieldset>
            <legend>{lang}wcf.global.form.data{/lang}</legend>

            <dl{if $errorField == 'name'} class="formError"{/if}>
                <dt><label for="name">{lang}wcf.acp.serverlist.name{/lang}</label></dt>
                <dd>
                    <input type="text" id="name" name="name" value="{$name}" class="" required="required" />
                    {if $errorField == 'name'}
                        <small class="innerError">{lang}wcf.acp.serverlist.name.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'host'} class="formError"{/if}>
                <dt><label for="host">{lang}wcf.acp.serverlist.host{/lang}</label></dt>
                <dd>
                    <input type="text" id="host" name="host" value="{$host}" class="" required="required" />
                    {if $errorField == 'host'}
                        <small class="innerError">{lang}wcf.acp.serverlist.host.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'port'} class="formError"{/if}>
                <dt><label for="port">{lang}wcf.acp.serverlist.port{/lang}</label></dt>
                <dd>
                    <input type="number" id="port" name="port" value="{$port}" class="short" pattern="^[1-9][0-9]?[0-9]?[0-9]?[0-9]$|^65535$" required="required" />
                    {if $errorField == 'port'}
                        <small class="innerError">{lang}wcf.acp.serverlist.port.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'queryport'} class="formError"{/if}>
                <dt><label for="queryport">{lang}wcf.acp.serverlist.queryport{/lang}</label></dt>
                <dd>
                    <input type="number" id="queryport" name="queryport" value="{$queryport}" class="short" pattern="^[1-9][0-9]?[0-9]?[0-9]?[0-9]$|^65535$" required="required" />
                    {if $errorField == 'queryport'}
                        <small class="innerError">{lang}wcf.acp.serverlist.queryport.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>
            <dl{if $errorField == 'game'} class="formError"{/if}>
                <dt><label for="game">{lang}wcf.acp.serverlist.game{/lang}</label></dt>
                <dd>
                    <input type="text" id="game" name="game" value="{$game}" class="" required="required" />
                    {if $errorField == 'name'}
                        <small class="innerError">{lang}wcf.acp.serverlist.game.error.{$errorType}{/lang}</small>
                    {/if}
                </dd>
            </dl>

            {event name='dataFields'}
        </fieldset>

    </div>

    <div class="formSubmit">
        <input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
        {@SECURITY_TOKEN_INPUT_TAG}
    </div>
</form>

{include file='footer'}