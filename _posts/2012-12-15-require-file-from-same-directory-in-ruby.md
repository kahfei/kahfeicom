---
title: require file from same directory in ruby
layout: post
permalink: /2012/12/15/require-file-from-same-directory-in-ruby/
comments: true
---
Requiring a file sitting in the same directory wouldn’t work with this
{% highlight ruby %}
require 'something'
{% endhighlight %}
Seems like Ruby 1.9 remove current directory from load path as I read from Stackoverflow

To make it work you could
{% highlight ruby %}
require './something'
{% endhighlight %}
or use require_relative,
{% highlight ruby %}
require_relative 'something'
{% endhighlight %}
The thing is,
{% highlight ruby %}
load 'something.rb'
{% endhighlight %}
still work. So does that mean load and require have different load path?