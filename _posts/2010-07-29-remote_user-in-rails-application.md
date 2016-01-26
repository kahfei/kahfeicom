---
title: remote_user in rails application
layout: post
permalink: /2010/07/29/remote_user-in-rails-application/
comments: true
---
I am developing a little application within instantrails, suppose to work in an intranet environment.

The application let user book a part number, by filling some information. For better user experience, I plan to capture the username at the other end that make the booking, instead of creating another layer of login feature and require the user to login again. There is no complex authentication needed, just capture the username and store it together with other information. 

ENV[&#8216;user&#8217;] will give you the username that has the rails application running, which is not what we want.
  
ENV[&#8216;remote_user&#8217;] return nothing at all.
  
I read through quite [a](http://www.ruby-forum.com/topic/83067) [few](http://old.nabble.com/Forcing-a-proxied-host-to-generate-REMOTE_USER-to2911573.html#a2914465) [discussions](http://kbullock.ringworld.org/2010/06/05/apache-rails-and-remote_user/) on the net, it seems like apache didn&#8217;t actually pass the remote\_user value to mongrel, hence rails application couldn&#8217;t call out remote\_user. To fix that, we will need to modify on the apache configuration file, httpd.conf, and .htaccess. Admittedly, I really know close to nothing about the setup of these files, and have a hard time following the suggested steps, as to where to add the suggested line of codes, which file to modify, etc, etc. 

So I figure, if we forgo apache in the setup, will it be easier to fetch the remote_user value directly from mongrel? or from thin if it is the web server being used. 

But still, I just couldn&#8217;t get it working.
  
Is there any gem or plugin need to be installed before this remote_user tingy can be pass to rails application?