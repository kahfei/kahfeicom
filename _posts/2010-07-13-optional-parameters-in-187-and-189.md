---
title: optional parameters in 1.8.7 and 1.9
layout: post
permalink: /2010/07/13/optional-parameters-in-187-and-189/
comments: true
---
Apparently you can have optional parameter listed in the middle for your method in Ruby version 1.9
{% highlight ruby %}
C:\>pik switch 191
C:\>irb
irb(main):001:> def talk(a,*b,c)
irb(main):002:1>   p a,b,c
irb(main):003:1> end
=> nil
irb(main):004:> talk 'a','b','c'
"a"
["b"]
"c"
=> ["a", ["b"], "c"]
{% endhighlight %}
but not Ruby version 1.8.7
{% highlight ruby %}
C:\>pik switch 187
C:\>irb
irb(main):001:> def talk(a,*b,c)
irb(main):002:1>   p a,b,c
irb(main):003:1> end
SyntaxError: compile error
(irb):1: syntax error, unexpected tIDENTIFIER, expecting tAMPER or '&'
def talk(a,*b,c)
               ^
        from (irb):1
irb(main):004:> quit
{% endhighlight %}