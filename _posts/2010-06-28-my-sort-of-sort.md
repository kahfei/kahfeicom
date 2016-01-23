---
title: My sort of sort
layout: post
permalink: /2010/06/28/my-sort-of-sort/
comments: true
---
Am running through ["Learn to Program"](http://pine.fm/LearnToProgram/)from Chris Pine, again.

I have been cracking my head on the exercise to write a sort method instead of just using the array#sort come with ruby.

As the exercise actually came at the stage of the tutorial that more advanced techniques like ternary operator is yet to be introduced, so I figure I might want to limit myself to use only the basic while and if.There are some blog posts, discussion in forums on the solution to this question.

Someone suggest to read about [sorting algorithm](http://en.wikipedia.org/wiki/Sorting_algorithm) before attempting to solve the question, a brief search yields all sorts of sort (ha!), insertion, selection, bubble, shell, merge, heap, quick, just for sorting. As sorting always require brain gymnastic trying to imagine the on going process (at least for me), there are [animations](http://www.sorting-algorithms.com/) available for all these different type of sort. Although, frankly I still couldn’t really get a grasp after watching those animations.

As I read from [Renae’s blog](http://www.renaebair.com/2008/11/23/ruby-sort/) that they are using paper cutouts, while I have been sketching and sketching and sketching trying to illustrate the flow.

And so, here is my attempt to the problem, it is rather coarse, it didn’t use method, it can’t deal with duplicate elements in the array, so, there are still a lot of be improve on, when I have time on it. Nevertheless, here it is
{% highlight ruby %}
animals = ['cat','bird','a','mouse','bull','elephant','dog']
unsorted = animals.dup
sorted= []
i = animals.length - 1
smaller = animals[i]
 
while unsorted.length != 
   while i >= 
    if smaller < animals[i]
      smaller
    else
      smaller = animals[i]
    end
    i = i - 1
 
  end
 
    sorted.push smaller
    unsorted.delete smaller
    animals.delete smaller
    smaller = unsorted[i] 
    i = unsorted.length - 1   
end
    puts sorted.inspect
{% endhighlight %}

