---
title: Testing in Sublime
layout: post
permalink: /2013/08/14/testing-in-sublime/
comments: true
---
Following [railstutorial](http://ruby.railstutorial.org/) again, to strengthen my rails basic and pick up new shiny things in rails 4.

[Getting sublime to run test](http://ruby.railstutorial.org/chapters/static-pages#sec-tests_inside_sublime_text) directly is quite awesome, I mean you just need to highlight part of the test you wish to run, cmd + shift + R, boom you got your test result, all without needing to leave the comfort of sublime. Sweet.

On the next day though, suddenly it refuse to run, complaining
{% highlight ruby %}
/bin/sh: rspec: command not found
{% endhighlight %}

Stackoverflow answer here go for this [one](http://stackoverflow.com/a/13559146/2384725). But a simpler solution below work for me, just go to ~/.config/sublime-text-2/Packages/RubyTest/RubyTest.sublime-settings file and set configuration option “check_for_rvm” to true and you have your mojo back.


![test in sublime](/images/testing_in_sublime.png)