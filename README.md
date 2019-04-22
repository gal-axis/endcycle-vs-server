# EndCycle VS Battle Server
This is the repository for the EndCycle VS server!

## Headless Setup (Debian virtual server)

* First create an debian server on a platform of your choice (DigitalOcean, Vultr, etc.)
  * You can also select any other linux variant, as long as it supports Java 8. But beware of this option as you will have to adapt the install script
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

If you want to install mods for the server, you can do so with the following commands:
* `mod list`
  * Lists all installed mods and if they're enabled or not.
* `mod search [keyword]`
  * Searches the mod repository for mods.
* `mod install id` or `mod uninstall id`
  * Installs or uninstalls the mod with the given ID
* `mod enable id` or `mod disable id`
  * Enables or disables the mod with the given ID
  
If you installed/uninstalled or enabled/disabled mods, you'll have to restart the server to apply the changes. You can do so by running `systemctl restart EndCycleServer.service`.

### Additional Properties

Add these to the game.properties file under the assets/ folder to enable/disable certain functionality.

#### Discord

To enable a discord bot that will send notifications to your discord server, you first need to create one. Here's instructions on how to do that: https://discordpy.readthedocs.io/en/rewrite/discord.html

| Property | Description
| --- | --- |
| Discord.Enabled | `true` or `false` to enable or disable discord functionality |
| Discord.Token | Your discord bot token |
| Discord.Server | The ID of the discord server |
| Discord.Channel.Battle | The channel ID for Battle Notifications |
