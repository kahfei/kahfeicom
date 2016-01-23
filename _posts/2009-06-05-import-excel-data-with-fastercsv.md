---
title: Import Excel data with FasterCSV
layout: post
permalink: /2009/06/05/import-excel-data-with-fastercsv/
comments: true
---
So I have a whole list of data which is already in excel and need to put into the Rails application. I could either manually type them into the database, or there must be some plugin out there dealing with this.

Just a quick google bring me to [Unixmonkey blog](http://unixmonkey.net/?tag=ruby-rails-gems-plugins-csv-database) talking about [fastercsv](http://fastercsv.rubyforge.org/).

All you need to do is just

{% highlight ruby %}
gem install fastercsv
{% endhighlight %}

Then copy the excel file(oh, convert it to .csv file first) to the root of your application.

Now as the target table is &#8220;Bcode&#8221; with fields, term\_no, standard\_term  at the root, ruby script/console

{% highlight ruby %}
require 'fastercsv'
FasterCSV.foreach("#{RAILS_ROOT}/file.csv") do |row|
  record = Bcode.new(
  :term_no => row[],
  :standard_term => row[1]
  )
  record.save
end
{% endhighlight %}


That is just a few simple line of codes, but believe me, it got me almost 5 times of trying before I got everything right in the console. It is just so frustrated. And only after all that suffering that I find the line saying we can actually put this into data migration script. Arghhh&#8230;..

It did take a while (almost 10 minutes, I think) to load in all the 17K rows of cvs data though.