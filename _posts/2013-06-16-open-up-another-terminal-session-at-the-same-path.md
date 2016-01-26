---
title: Open up another terminal session at the same path
layout: post
permalink: /2013/06/16/open-up-another-terminal-session-at-the-same-path/
comments: true
---
I often needs to open up multiple Terminal session on the same path, example, one to launch rails server, then another to actually working with it. There are a few tricks on the internet, but most involved writing some applescript to achieve that. 

I prefer a straightforward solution hence I keep on looking, finally found this piece in the trusted [stackoverflow](http://stackoverflow.com/questions/11676007/how-do-you-open-a-new-mac-os-x-terminal-from-terminal-and-have-it-be-in-the-same) as usual. 

Just need to type

{% highlight ruby %}
open -a Terminal "`pwd`"
{% endhighlight %}

Just take note that it is a backtick and not the single quote mark, then you should have another terminal session open up at the current path. 

Even easier in Windows Command Prompt, just type "start" at wherever you are, another cmd windows pop up at the same directory. Wow.