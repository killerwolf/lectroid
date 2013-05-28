---
title: Uninstall BlueStacks from Mac OSX
tags:
- cloud9
- git
- github
- nodejs
- nodejitsu
---

<img class="thumbnail pull-left" src="/img/personal/posts/2013-05-28-uninstall-bluestacks-from-your-mac/bluestacks-uninstall.png" />
###BlueStacks:###

For some reverse engineering needs, i installed a full featured android environement called **BlueStacks**. I decided to remove after playing with it a couple of hours. I crawled the web and found no up-to-date way of removing it. BlueStacks is a pretty intrusive app.
After browsing deep into `~/Library` I found out how.






###Here is how:###

1. Open a terminal 
2. go to `cd ~/Library/BlueStacks App Player/Uninstall/Clear BlueStacks User Data.app/Contents/MacOS`
3. then run `sh uHD-ClearUserData`
4. hit `Delete` in the confirm popup

You're all set now.