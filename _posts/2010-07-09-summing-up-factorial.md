---
title: Summing up factorial
layout: post
permalink: /2010/07/09/summing-up-factorial/
comments: true
---
Another way for factorial, extending the integer class, so the function will feel more natural, instead of fact 6 for example, you just call it by 6.fact.

Also, added a function to sum up the factorial value, counting down. Example, for 6!, it will be 6! + 5! + 4! + 3! + 2! + 1!

Here go,
{% highlight ruby %}
class Integer
  def fact
    if self == 
      return 1
    else
      n = self * (self - 1).fact
    end
  end
  def sum_fact
    (1..self).inject{|a,b| a + self.fact}
  end
end
puts 4.fact
puts 4.sum_fact
{% endhighlight %}
