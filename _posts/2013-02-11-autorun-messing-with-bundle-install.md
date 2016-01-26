---
title: Autorun mess up bundle install
layout: post
permalink: /2013/02/11/autorun-messing-with-bundle-install/
comments: true
---
I still feel like working with rails in Linux feel easier and faster. What&#8217;s with all the homebrew thing in Mac, feel like you have to go through a lot of troubles just to complete something simple. But working with rails in Windows is another story altogether. Initiatives like [Railsinstaller](http://railsinstaller.org/) and [Devkit](https://github.com/oneclick/rubyinstaller/wiki/development-kit) help a lot to get Windows to be less of a pain, but still&#8230;

So I have install railsinstaller, and Devkit come installed with it. And I have things running pretty normal, till lately I try to create a new rails apps, doing a bundle install lead to error saying

{% highlight ruby %}
Gem files will remain installed in C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9 .1/gems/json-1.7.6 for inspection. 
Results logged to C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/json-1.7. 6/ext/json/ext/generator/gem_make.out An error occured while installing json (1.7.6), and Bundler cannot continue. Make sure that gem install json -v '1.7.6' succeeds before bundling.

{% endhighlight %}

I tried to reinstall railsinstaller, and manually install Devkit. No working. Then tried to uninstall railsinstaller, and have ruby installer manually, then Devkit, make sure Devkit path is under ruby root, still the problem persist. Finally I found the solution in [stackoverflow](http://stackoverflow.com/questions/3018166/failed-to-build-gem-native-extension-extconf-rb-not-found), from a link in [I still feel like working with rails in Linux feel easier and faster. What&#8217;s with all the homebrew thing in Mac, feel like you have to go through a lot of troubles just to complete something simple. But working with rails in Windows is another story altogether. Initiatives like [Railsinstaller](http://railsinstaller.org/) and [Devkit](https://github.com/oneclick/rubyinstaller/wiki/development-kit) help a lot to get Windows to be less of a pain, but still

Just type this into command prompt

{% highlight ruby %}
REG QUERY "HKCU\Software\Microsoft\Command Processor"
REG QUERY "HKLM\Software\Microsoft\Command Processor"
{% endhighlight %}


Should get something like below

{% highlight ruby %}
HKEY_CURRENT_USER\Software\Microsoft\Command Processor
    CompletionChar        REG_DWORD    0x9
    DefaultColor          REG_DWORD    0x0
    EnableExtensions      REG_DWORD    0x1
    PathCompletionChar    REG_DWORD    0x9
{% endhighlight %}

These columns actually stand for Key, Type and Value. If there is a Key named AutoRun, then this could be the root cause of the problem. In my case, I think the Autorun key was set when I setup [ansicon](https://github.com/adoxa/ansicon).
  
Run this to remove it,
{% highlight ruby %}
REG DELETE "HKCU\Software\Microsoft\Command Processor" /v AutoRun
{% endhighlight %}

Close command prompt, and bundle install again in a new command prompt session, things should work.