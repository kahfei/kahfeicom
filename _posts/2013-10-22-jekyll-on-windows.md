---
title: Jekyll on Windows
layout: post
permalink: /2013/10/22/jekyll-on-windows/
comments: true
---
There are [already guide](http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html) out there to get Jekyll installed on Windows machine.

I have problem to start it after installation though, a long list of errors follow,
{% highlight ruby %}
D:\ruby_projects\olla\jekyll serve
Configuration file: D:/ruby_projects/olla/_config.yml
Source: D:/ruby_projects/olla
Destination: D:/ruby_projects/olla/_site
Generating... Liquid Exception: cannot load such file -- 
yajl/2.0/yajl in _posts/2013-10-22-welcome-to-jekyll.markdown
{% endhighlight %}


And of course, solution is out there as well <https://github.com/brianmario/yajl-ruby/issues/116>, make sure to read till the very end of the thread. Pre-compiled gem is not Ruby 2.0 compatible, if there is already x86-mingw32 version of yajl installed, make sure to uninstall it then follow these steps
{% highlight ruby %}
D:\ruby_projects\olla>gem install yajl-ruby --platform=ruby      
Fetching: yajl-ruby-1.1.0.gem (100%)                             
Temporarily enhancing PATH to include DevKit...                  
Building native extensions.  This could take a while...          
Successfully installed yajl-ruby-1.1.0                           
Parsing documentation for yajl-ruby-1.1.0                        
Installing ri documentation for yajl-ruby-1.1.0                  
Done installing documentation for yajl-ruby after 2 seconds      
1 gem installed
{% endhighlight %}
If one decided to do development works in a windows machine, by faith you have to jumped over lot of hoops to make thing happen. Latest pygments gem just refuse to work
{% highlight ruby %}
D:\ruby_projects\olla\jekyll serve                                                                                     
Configuration file: D:/ruby_projects/olla/_config.yml                                                                              
            Source: D:/ruby_projects/olla                                                                                          
       Destination: D:/ruby_projects/olla/_site                                                                                    
      Generating... C:/RailsInstaller/Ruby2.0.0/lib/ruby/gems/2.0.0/gems/posix-spawn-0.3.6/lib/posix/spawn.rb:162: warning: cannot 
  Liquid Exception: No such file or directory - /bin/sh in _posts/2013-10-22-welcome-to-jekyll.markdown
{% endhighlight %}
A little search show the solution in [StackOverflow](http://stackoverflow.com/questions/17364028/jekyll-on-windows-pygments-not-working), just uninstall the latest pygments gem, and install version 0.5.0 as suggested. Tada, you can jekyll serve and point to localhost:4000 finally.

Now compare all those steps with this one
  
![](/images/jekyll_quick_start.png)

Can&#8217;t help but feel like developing in Windows environment waaaay more fascinating. Ha.