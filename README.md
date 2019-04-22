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
* Now, execute `source install.sh` and input the information the script asks of you
  * The script should only ask you for the Server IP and Server Name
* If everything went well, your EndCycle VS server should now be up-and-running!
* To update the server run `source updater.sh`. Beware, as this will disconnect all users from the server!

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
