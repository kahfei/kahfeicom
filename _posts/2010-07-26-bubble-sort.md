---
title: bubble sort
layout: post
permalink: /2010/07/26/bubble-sort/
comments: true
---
Understanding sorting algorithm by just reading text or still illustration takes a lot of mind gymnastic. Apparently, there are lot of videos online, trying to explain the concept. But not all explain it as good though, some with really boring animation, some with crappy background music, and some even both . Here are two that I find did a great job in explaining bubble sort,

This one from [codegearguru](http://codegearguru.com/). Instead of creating graphic, or cutting out paper to represent data in the sorting process, just use the poker cards! That seems obvious now, but I didn't think about it when I try to illustrate sorting to myself initially. Ha. Think there is a series of video created for different type of sorting algorithm as well, so definitely a great tool to understand sorting algorithm. Bonus near the end of the video, another technique called shaker sort or cocktail sort is also explained, which is basically a bidirectional bubble sort which should speed up the sorting speed.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UnK5ueUgc88" frameborder="0" allowfullscreen></iframe>

Another one from [Miles Hauskaz](http://vimeo.com/user385283), just plain simple and succinct explanation and a video nicely done as well.

<iframe src="https://player.vimeo.com/video/4315697" width="560" height="315" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/4315697">Sorting Algorithms - Bubble Sort</a> from <a href="https://vimeo.com/user385283">Miles Hauskaz</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
[Sorting Algorithm - Bubble Sort](http://vimeo.com/4315697) from [Miles Hauskaz](http://vimeo.com/user385283) on [Vimeo](http://vimeo.com).

So, this is my implementation of bubble sort, admittedly not the best that you can find, but that will do for me now, until I have time to come back and do some refactoring.
{% highlight ruby %}
arr = %w{g a c b j e e}
i = arr.length - 1
count = 
n = arr.length - 1
def swap(m,n) 
  arr = []
  if m > n
    arr << n
    arr << m
  else
    arr << m
    arr << n   
  end 
end 
while n > 0 
  while count << i
    puts "comparing #{arr[count]} to #{arr[count+1]}"
    a = swap(arr[count],arr[count+1])
    arr[count..count+1] = a
    count += 1
  end
  n -= 1
  i -= 1
  count = 
end
p arr
{% endhighlight %}


