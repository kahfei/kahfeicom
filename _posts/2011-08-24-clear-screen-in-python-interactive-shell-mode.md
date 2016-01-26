---
title: Clear screen in python interactive shell mode
layout: post
permalink: /2011/08/24/clear-screen-in-python-interactive-shell-mode/
comments: true
---
Here is how to clear screen when you are working in the python interactive shell mode,
{% highlight python %}
import os
os.system('cls')
{% endhighlight %}
A quick google actually yields a few solutions, I find this work best for me.