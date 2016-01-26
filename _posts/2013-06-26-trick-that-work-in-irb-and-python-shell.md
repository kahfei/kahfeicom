---
title: Trick that work in irb and python shell
layout: post
permalink: /2013/06/26/trick-that-work-in-irb-and-python-shell/
comments: true
---
This irb tip is from [Natasha the Robot](http://natashatherobot.com/amazing-rails-console-irb-trick/). Often we forgot to assign an expression to a variable, you could of course use up arrow to retrieve last command and then move all the way to the front, add a variable and equal sign to it, but that is a lot of troubles. 

An easy way is just assign a variable to underscore, like this

{% highlight ruby %}
text = _
{% endhighlight %}
Then you have your previous expression assigned to a variable called text. Magical. 

What is more surprising is that just found out that this magical trick works the same in python shell! Even more magical.