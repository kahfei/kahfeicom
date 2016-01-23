---
title: Rails collection_select helper
layout: post
permalink: /2009/06/03/rails-collection_select-helper/
comments: true
---
The explanation from api.rubyonrails.org is rather baffling for a newbie like me,
{% highlight ruby %}
collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})
{% endhighlight %}

Still managed to get the dropdown menu working for my application after searching through the web. There are already quite a few useful resources available in the net for helper method collection_select.

But I seem to lost in the code again looking back at it after a while. And am too lazy to look through all the stuff again. So I try to make a diagram to put down what I already understand from those resources. Might not be the best or complete explanation, but just try to help myself to be able to view it and quickly get a grasp of it.
  
![collection select](/images/collection_select_explain.jpg)
