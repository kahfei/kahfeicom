---
title: Regex hammer time
layout: post
permalink: /2012/05/28/regex-hammer-time/
comments: true
---
When you have a hammer, you see everything as nails.
  
A very true message from [Dive into Python 3](http://getpython3.com/diveintopython3/regular-expressions.html),

> Regular expressions are extremely powerful, but they are not the correct solution for every problem. You should learn enough about them to know when they are appropriate, when they will solve your problems, and when they will cause more problems than they solve.

But it is easy to fall into the trap of using regex for everything.
  
I need to find the last string from a path, where
{% highlight ruby %}
path = "d:/some/directory-with dash-and space"
{% endhighlight %}


So here is how I try to get the last string in a path, with regex
{% highlight ruby %}
path.match(/\w*$/)
{% endhighlight %}


trying to capture any word characters at the end of the string with \w*$, but only captured the last word “space”, not good.
{% highlight ruby %}
path.match(/(\s|\w)*$/)[]
{% endhighlight %}
to match either whitespace (\s) or word characters (\w) at the end of the string, the result is &#8220;and space&#8221;, dashed is not captured, not good.

{% highlight ruby %}
path.match(/[^\/]*$/)
{% endhighlight %}

[^\/] to take in everything except “/”, result is “directory-with dash-and space”, it works!

Only later I found out there is a really simple way to do this

{% highlight ruby %}
File.basename(path)
{% endhighlight %}

will actually give you “directory-with dash-and space”. Plus, it will ignore ending slash if there is any.

Duh!
  
Duh!