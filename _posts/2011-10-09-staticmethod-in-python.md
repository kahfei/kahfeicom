---
title: staticmethod in python
layout: post
permalink: /2011/10/09/staticmethod-in-python/
comments: true
---
Going through [byte of python 3](http://www.swaroopch.com/notes/Python_en:Table_of_Contents), I tried to make sense of staticmethod in the section talking about class and Object variables.

In the Robot class, there is a howMany class method, declared as below

{% highlight python %}
def howMany():
  print("we have {0:d} robots".format(Robot.population))
howMany = staticmethod(howMany)
{% endhighlight %}

or using decorator, it will be
{% highlight python %}
@staticmethod
def howMany():
  print("we have {0:d} robots".format(Robot.population))
howMany = staticmethod(howMany)
{% endhighlight %}

It was then called by the Robot class,
{% highlight python %}
Robot.howMany()
{% endhighlight %}

I couldn't really understand what is the staticmethod role here though.
  
According to the [Python documentation](http://docs.python.org/library/functions.html#staticmethod),

> A static method does not receive an implicit first argument.
> It can be called either on the class (such as C.f()) or on an instance (such as C().f()). The instance is ignored except for its class.

That explain a little bit more, seems a staticmethod can be called either by class or instance.
  
Then I try something like this,
{% highlight python %}
class Human:
  def communicate():
    print("I talk")
  def move():
    print("I walk")
  move = staticmethod(move)
{% endhighlight %}

So a Human class have two class methods, communicate and move, but move is a staticmethod.

{% highlight python %}
Steve = Human()
Steve.communicate()
Traceback (most recent call last):
  File "", line 1, in 
TypeError: communicate() takes no arguments (1 given)
#communicate() is a class method, when object Steve try to call it, 
#an error message is saying communicate take no arguments, but 1 is given. 
#I guess that is object Steve trying to pass self to communicate()?

Steve.walk()
#It duly print out "I walk"
{% endhighlight %}

Seems to me, staticmethod is a way for object to access class method that otherwise wouldn't be available to them. Is that the correct perception?