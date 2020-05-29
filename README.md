# EndCycle VS Battle Server
This is the repository for the EndCycle VS server!

## Windows Setup

To start a server with a minimal GUI on windows, simply start the server.bat file. In order to let others join your server through the internet, make sure that you have the game's ports forwarded (17778, 17779).

## Headless Setup (Debian virtual server)

* First create an debian server on a platform of your choice (DigitalOcean, Vultr, etc.)
  * You can also select any other linux variant, as long as it supports Java 8. But beware of this option as you will have to adapt the install script manually
* Login to your server via SSH
* Create a directory anywhere you'd like
* Update repositories (`sudo apt update`) and install git (`sudo apt install git`)
* Inside that directory execute `git clone https://github.com/redmatters/endcycle-vs-server.git .`
  * Before proceeding double check the install scripts content to make sure you didn't download any malicious copy of this software.
  * You can do this by executing `nano install.sh` and reading through the commands it does
* Now, execute `sudo source install.sh` and input the information the script asks of you
  * The script should only ask you for the Server IP and Server Name
* If everything went well, your EndCycle VS server should now be up-and-running!
* To update the server run `sudo source update.sh`. Beware, as this will disconnect all users from the server!

### Mods

If you want to configure/download mods for the server from the in-game mod browser, you can do so with the following commands:
* `mod list`
  * Lists all installed mods and if they're enabled or not.
* `mod search [keyword]`
  * Searches the mod repository for mods.
* `mod install id` or `mod uninstall id`
  * Installs or uninstalls the mod with the given ID
* `mod enable id` or `mod disable id`
  * Enables or disables the mod with the given ID
  
If you installed/uninstalled or enabled/disabled mods, you'll have to restart the server to apply the changes. You can do so by running `systemctl restart EndCycleServer.service`.

## Additional Properties

Add these to a file under the assets/ folder called  server.properties to enable/disable certain functionality.
Here is an example of how you could configure your server:
```
Discord.Enabled=true
Discord.Token=YOUR_DISCORD_TOKEN_HERE
Discord.Server=5134350573369524244
Discord.Channel.Battle=1235353747254018058
Client.UDP=17780
Client.TCP=17781
```

### Connection Properties

| Property | Description
| --- | --- |
| Client.UDP | The UDP port of your server (default is 17778) |
| Client.TCP | The TCP port of your server (default is 17779) |
| Server.Name | The name of your server that will be visible for others in the server browser |

### Discord

To enable a discord bot that will send notifications to your discord server, you first need to create one. Here's instructions on how to do that: https://discordpy.readthedocs.io/en/rewrite/discord.html

| Property | Description
| --- | --- |
| Discord.Enabled | `true` or `false` to enable or disable discord functionality |
| Discord.Token | Your discord bot token |
| Discord.Server | The ID of the discord server |
| Discord.Channel.Battle | The channel ID for Battle Notifications |
