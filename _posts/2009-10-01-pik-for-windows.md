---
title: Pik for windows
layout: post
permalink: /2009/10/01/pik-for-windows/
comments: true
---
So glad when I come across [rvm](http://rvm.beginrescueend.com/), but then I learned that it is only for Linux and OSX. I do work in Ubuntu sometimes, but other time I have to work in a Windows environment.

Then, I discover [pik](http://github.com/vertiginous/pik), hey, doing the same thing for you, but in Windows. So now even in XP, I can switch around with Ruby versions as well.

Installation is really easy, just gem install pik,
{% highlight ruby %}
gem install pik
{% endhighlight %}

then you can tell pik the additional ruby versions by adding the path to it.
{% highlight ruby %}
C:\pik add C:\ruby186\bin
{% endhighlight %}

To see all the versions you have
{% highlight ruby %}
C:\>pik list -v 
186: ruby 1.8.6 (2007-09-24 patchlevel 111) [i386-mswin32]
path: C:/ruby186/bin
191: ruby 1.9.1p129 (2009-05-12 revision 23412) [i386-mingw32] *
path: C:/Ruby19/bin
{% endhighlight %}
And do the switching,
{% highlight ruby %}
C:\pik switch 186
{% endhighlight %}
More commands can be found at the [pik](https://github.com/vertiginous/pik) site.

Rediculuosly simple yet so helpful&#8230;.thanks Gordon!