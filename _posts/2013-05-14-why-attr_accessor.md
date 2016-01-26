---
title: why attr_accessor
layout: post
permalink: /2013/05/14/why-attr_accessor/
comments: true
---
I keep bump into this problem, where I pick up some basic long ago, after a while, get too used to it and forgot the reason why something is done in a particular way.

If I have written about it, then I have a better understanding and longer memory. Like the [collection_select](http://www.kahfei.com/?p=23) method which I drawn a illustration and post about it sometimes ago, it stuck in my memory till now.

This idea is not really new, [you learn by teaching](http://ninjasandrobots.com/those-who-teach), or at least write or blog about it. All that help to clarify your thought.

And so, to help me internalized the reason behind attr_accessor, I quickly googled and read thru this from [stackoverflow](http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby), yet, am gonna write about it as a process of internalization. Ha.

You keep writing attr_accessor, one day you totally forgot why we did attr_accessor at the first place. Why attr_accessor?
{% highlight ruby %}
class Human
  def name=(str)
    @name = str
  end
 
  def name
    @name
  end
end
{% endhighlight %}
You do that to assign variable to a value, then call the value. This is common repetitive task. Programming is all about eliminating repetitive tasks. So you can do this in ruby
{% highlight ruby %}
class Human
  attr_reader :name
  attr_writer :name
end
{% endhighlight %}
where attr_reader replace name method part, and attr_writer replace the name=(str) method. Still, often attr_writer and attr_reader often come in pair, why not just do it in one step.
{% highlight ruby %}
class Human
  attr_accessor :name
end
{% endhighlight %}
I created a diagram hopefully could better illustrate this in one glance.


![](/images/attr_accessor.png)


That is it. Already felt that now this tie deeper into my memory.