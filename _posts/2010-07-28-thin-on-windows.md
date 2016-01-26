---
title: thin on windows
layout: post
permalink: /2010/07/28/thin-on-windows/
comments: true
---
Read about [thin](http://code.macournoyer.com/thin/) for a while (faster than webrick, faster than mongrel), but didn't really get the chance to try it out, until recently.

As I am looking for moving my little rails application out of instantrails to a proper production environment, decided to give thin a spin, too bad [Passenger](http://www.modrails.com/) isn't supporting Windows platform, heard a lot of good thing about it too.

Installing thin server on Windows isn't quite straightforward though. Thin actually consist of mongrel parser, EventMachine, and rack, but the latest EventMachine gem is not win32 binary release, that pose a lot of problem for the installation.

There are a few workarounds suggested on the net,
  
from [Winston](http://www.winstonyw.com/2008/03/23/ruby-thin-server-on-windows/)

  * install rack with the usual gem install
  * install EventMachine gem 0.8.1 as local gem
  * install thin gem install thin &#8211;ignore-dependencie

But this didn't quite workout for me, some suggested to install [MinGW](http://www.mingw.org/) and [MSYS](http://www.mingw.org/wiki/MSYS), then the normal path of gem install thin should just work. Tried that, but fail as well.

Then found out that EventMachine has a binary release at 0.12.6, and with that it works right away for me, here are the steps that did it for me,

  * gem install rack
  * gem install eventmachine-0.12.6-x86-mswin32-60.gem ([download](http://rubyforge.org/frs/download.php/52982/eventmachine-0.12.6-x86-mswin32-60.gem) gem to local, and install locally)
  * gem install thin

Only after a full circle of searching around the net, that I found out these steps are actually mentioned in the comments by Marty McGee in winston's original post. Duh.