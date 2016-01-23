---
title: Sorting Array
layout: post
permalink: /2009/10/22/sorting-array/
comments: true
---
{% highlight ruby %}
a = [9,5,6,3,7]
a.sort { |x,y| x==5? 1:x<=>y }
[3, 6, 7, 9, 5]
{% endhighlight %}
So, I sort the array consisting 9,5,6,3,7, run it through a block, put the elements to x and y then sort it in ascending order, except for the number “5”, which will be stuck at the end of the order.

But why in the case below then the number “2” which should be at the end of the order is instead at the second last place?
{% highlight ruby %}
c = [22,77,88,55,44,11,2,8]
c.sort { |x,y| x==2? 1:x<=>y }
[8, 11, 22, 44, 55, 77, 2, 88]
{% endhighlight %}
I tried to sort a few different arrays, and sometimes the second case just pop up, which still puzzling me. Why the different?