---
title: Exception handling in python
layout: post
permalink: /2011/03/12/exception-handling-in-python/
comments: true
---
As I came across the exception handling chapter, both code below should work as stated in the book (The [Head First Python](http://oreilly.com/catalog/0636920003434), which is indented for Python 3.X, but I am running this code in Python 2.X),
{% highlight python %}
try:
  with open("man_data.txt") as man_file:
    print >>man_file, man
  with open("other_data") as other_file:
    print >>other_file, other
{% endhighlight %}
or
{% highlight python %}
try:
  with open("man_data.txt") as man_file, open("other_data") as other_file:
    print >>man_file, man
    print >>other_file, other
{% endhighlight %}
However it seems only the first one is working under Python 2.X, later code will in fact throw up a syntax error message.

Didn’t see anything on the net mentioning this has to do with changes in Python 3.x, so not sure if that is the case.

