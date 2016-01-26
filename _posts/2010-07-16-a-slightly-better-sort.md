---
title: A slightly better sort
layout: post
permalink: /2010/07/16/a-slightly-better-sort/
comments: true
---
Finally have the time to come back to the sorting exercise, here is a slightly better version of sort.

It still doesn’t take care of duplicate elements, but compare to the first sorting version, this one is shorter, as the whole finding smallest element left in the array is now done by inject and a ternary operator, a whole 7 lines of code cut to just 1. And now it no longer sort animals, it sort a list of hackers
{% highlight ruby %}
hackers = %w{matz ddh adrian guido gosling knuth linus}
i = hackers.length 
sorted = []
while i > 0 
  small = hackers.inject{ |a,b| a < b ? a : b}
  sorted.push small 
  hackers.delete small
  i -= 1
end
p sorted
{% endhighlight %}
And the result of the sort is
{% highlight ruby %}
["adrian", "ddh", "gosling", "guido", "knuth", "linus", "matz"]
{% endhighlight %}
So the next iteration will be to take care of duplicated elements…stay tuned.