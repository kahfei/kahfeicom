---
title: A much better sort
layout: post
permalink: /2010/07/21/a-much-better-sort/
comments: true
---
Okay, much better only in a relative term, comparing to my earlier sorting which didn’t take care of duplicate elements.

Two major changes here.

I do away with the temporary variable for holding on the smallest number result from each round of the comparison, instead elements are now passed over directly to the sorted array.

Those elements that get passed to the sorted array, will be deleted from the original array, but one items at one round of comparison, which mean if there are duplicated elements, only one of the instance will be removed.
{% highlight ruby %}
 hackers.delete_at(hackers.index(sorted[count]))
{% endhighlight %}
It look a lot more wordy than a shorter
{% highlight ruby %}
hackers.delete(sorted[count])
{% endhighlight %}
but this is deleting ONLY the first element that match the value, compare to the shorter version where it will remove all elements. So it preserve the other element for next round of comparison, and eventually make it to the sorted array.

Complete code as below,
{% highlight ruby %}
hackers = %w{ gosling matz dhh adrian guido matz knuth dhh adrian guido }
i = hackers.length
count = 
sorted = []
 
while count < i
  sorted[count] = hackers.inject{ |a,b| a < b ? a : b }
  p sorted[count]
  hackers.delete_at(hackers.index(sorted[count]))
  count += 1
end
p sorted
{% endhighlight %}
And the result….
{% highlight ruby %}
["adrian", "adrian", "dhh", "dhh", "gosling", "guido", "guido", "knuth", "matz", "matz"]
{% endhighlight %}