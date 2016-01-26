---
title: Print without newline in Python
layout: post
permalink: /2011/03/11/print-without-newline-in-python/
comments: true
---
Going thru the [Head First Python](http://oreilly.com/catalog/0636920003434), which is intended for Python 3.X, although majority of the content work just as well in Python 2.X.

First encountered with some variations between version 3.X and 2.X at the chapter about printing out nested lists, with tab indicating different nested level.

To print a tab without a newline, you could do this in Python 3.X,
{% highlight python %}
print("\t",end='')
{% endhighlight %}
However, the same code will throw you a syntax error in Python 2.X.

So to do the same in Python 2.X,
{% highlight python %}
print "\t",
{% endhighlight %}
Note the final comma, which actually make sure the line will print out with space instead of a newline.

In Python 3.X, print is an actual function but in Python 2.X, print is still a statement.

I found out this from the ever helpful [stackoverflow](http://stackoverflow.com/questions/2456148/python-print-end)