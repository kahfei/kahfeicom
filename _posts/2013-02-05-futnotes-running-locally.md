---
title: Futnotes running locally
layout: post
permalink: /2013/02/05/futnotes-running-locally/
comments: true
---
Redo the whole process. Clone repo again, bundle install now work right away, as all the prerequisites are there.

Instead of running rake tasks separately, which fail previously with long list of errors
{% highlight ruby %}
rake db:create:all
rake db:migrate
rake db:seed
{% endhighlight %}

I will just do this, which is a [shortcut](http://help.codeschool.com/discussions/rails-for-zombies-2/304-rake-dbmigrate-vs-rake-dbsetup) for rake db:create; rake db:schema:load, and rake db:seed
{% highlight ruby %}
rake db:setup
{% endhighlight %}
And it work!

Precompile Assets,
{% highlight ruby %}
rake assets:precompile
{% endhighlight %}

lead to an error saying &#8220;Segmentation fault while running &#8216;rake assets procompile'&#8221;. A [suggestion in stackoverflow](http://stackoverflow.com/questions/13569890/rails-s-return-bug-segmentation-fault) saying that the rootcause might be execjs, change to therubyracer gem should solve the problem. Even though there is no execjs gem dependency in the gemfile, I still add in therubyracer gem, bundle install again, now rake assets:precompile just work, and I have futnotes running locally. Now off to get the test done