Agar.io Clone [![Build Status](https://travis-ci.com/aspriddell/jel.ly.svg?branch=master)](https://travis-ci.com/aspriddell/jel.ly) [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://www.heroku.com/deploy?template=https://github.com/aspriddell/jel.ly)
=============

>This is a clone of [huytd's agar.io server](https://github.com/huytd/agar.io-clone) with bug fixes and better logic:
'A simple but powerful Agar.IO clone built with socket.IO and HTML5 canvas on top of NodeJS.'

## Latest Changes
- Login doesn't crash on guessing incorrect password
- The game won't crash when people split
- Scrollbar bug fixed
- Eating others is easier (able to do so if split)
- Setup created
- Changed title from `Open Agar` to `Jelly`
- Nginx Reverse proxy and Let's Encrypt SSL intergrations
- Install Script created
- Settings and Spectate buttons set to `visible` but `disabled` due to settings not taking effect in game and the `spectate` button causing unnecessary lag and server load

---

#### Requirements
To run / install this game, you'll need: 
- A server with at least 1GB RAM
- 4GB HDD/SSD Space
- Ubuntu Based system (Debian will NOT work, you must do it manually)


#### Installing & Setup
This command will automatically download and install all required files:

```
wget https://aspriddell.github.io/jel.ly/installer-src/install_server_reverseproxy.sh && sudo bash install_server_reverseproxy.sh
```

#### Running the Server

>If you run the server without using the screen, on closing the Terminal window that contained the process the server will halt.
After downloading all the dependencies, you can run the server with the following command:

```
screen -t jelly
cd 
sudo startserver.sh
```

The game will then be accessible at `http://server_ip:3000` or port 80 if you installed Nginx (http only) and Let's Encrypt (https enabled). The default port for the base server (not nginx) is `3000`, however this can be changed in config `jel.ly/config.json`. 
To kill the server either turn it off or press Ctrl+Z on the window/screen running the process.

>Error 502 Bad Gateway means that the backend server (jelly) is not running

>Err_Connection_Refused means that Nginx or your reverse proxy is not working. Nothing is listening on that address, to fix this restart your web server service

If you are on the terminal window, but is not the screen then run:

```
screen -r #reattach the screen to the SSH console
```

>Killing the server with Ctrl+Z requires you to restart the server before it can work again.

## License
>You can check out the full license [here](https://github.com/aspriddell/jel.ly/blob/master/LICENSE).

This project is licensed under the terms of the **MIT** license.
