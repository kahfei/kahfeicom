---
title: failing factorial
layout: post
permalink: /2010/07/09/failing-factorial/
comments: true
---
Hours ago I got a programming test question about factorial, which I didn’t do really well, only completed with the help of the interviewer. Damn.

The worst thing is that I have done this question before, and I know in the head I can use recursion for it, but I totally go blank on how to do it with recursion. Here go my chance…sigh…

Now, here is how factorial can be done.

With Recursion.
{% highlight ruby %}
def fact n
  if n == 
    1
  else
    n = n * fact(n-1)
  end
end
{% endhighlight %}
That simple.

Factorial without recursion, using inject instead
{% highlight ruby %}
def fact n
  if n == 
    1
  else
    (1..n).inject { |a,b| a*b } 
  end
end
{% endhighlight %}
Isn’t that difficult, huh? What was I thinking?!