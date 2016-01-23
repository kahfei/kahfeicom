---
title: map and each
layout: post
permalink: /2010/07/25/map-and-each/
comments: true
---
It is a bit difficult for me to understand the difference between map and each, until I found out this in irb accidentally,
{% highlight ruby %}
irb(main):001:> name = %w{guido knuth adrian dhh pg}
=> ["guido", "knuth", "adrian", "dhh", "pg"]
irb(main):002:> name.each {|n| n.upcase}
=> ["guido", "knuth", "adrian", "dhh", "pg"]
irb(main):003:> name.map {|n| n.upcase}
=> ["GUIDO", "KNUTH", "ADRIAN", "DHH", "PG"]
{% endhighlight %}

map and each are suppose to do almost the same thing, but why each didn’t return the correct result in uppercase like what map did?

The different is each yield each element in the collection to the code block, in this case perform the upcase method, but return the receiver, which is the original array, hence an array of lower case names.

Whereas, map return a new array, consists of elements already went through the code block, hence an array of upper case names.
{% highlight ruby %}
irb(main):007:> name.each {|n| p n.upcase}
"GUIDO"
"KNUTH"
"ADRIAN"
"DHH"
"PG"
=> ["guido", "knuth", "adrian", "dhh", "pg"]
irb(main):006:> name.map {|n| p n.upcase}
"GUIDO"
"KNUTH"
"ADRIAN"
"DHH"
"PG"
=> [nil, nil, nil, nil, nil]
{% endhighlight %}
So here you can see with p, both map and each output the uppercase names, but look more carefully, the return value of each, as expected, is the original array. map however, return an array of nils!

Why is that?