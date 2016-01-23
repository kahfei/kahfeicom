---
title: Array rediscovered
layout: post
permalink: /2009/10/21/array-rediscovered/
comments: true
---
And so I always understand it wrongly,

{% highlight ruby %}
  s = "hello"
  s[,2] = "He"
{% endhighlight %}
That I thought the second operand is the ending index, and that somehow it works like range, where
{% highlight ruby %}
  a = [1,2,3]
  a[...2] = [1,2]
{% endhighlight %}

So, the last index is excluded from the result, it ranged from index 0 up till index 2, but index 2 itself is not included.

Only now I know that the second operand in retrieving substring from an array is actually the length that we specified for the substring, and the first operand is the starting index.

So, it now make more sense for me.
