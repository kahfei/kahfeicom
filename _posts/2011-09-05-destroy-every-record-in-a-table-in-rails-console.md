---
title: destroy every record in a table in rails console
layout: post
permalink: /2011/09/05/destroy-every-record-in-a-table-in-rails-console/
comments: true
---
This is really useful, as I keep googling it everytime I wanna do this with the rails console…
{% highlight ruby %}
Part.find(:all).each{|p|p.destroy}
{% endhighlight %}
Got it from the comment section from this post

A much shorter way of doing so, as comment by skim,
{% highlight ruby %}
Part.destroy_all
{% endhighlight %}
