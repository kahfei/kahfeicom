---
title: 'Futnotes &#8211; setting up the repo'
layout: post
permalink: /2013/02/03/futnotes-the-beginning/
comments: true
---
Cloning the repo

{% highlight ruby %}
git clone https://github.com/Futnotes/dev_test-2.git devtest
{% endhighlight %}

Mixtures of errors doing bundle install though
  
First it is capybara

{% highlight ruby %}
Using capybara (1.1.2) 
Installing capybara-webkit (0.12.1) with native extensions 
Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.
{% endhighlight %}

According to these sources [thoughtbot](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) and [stackoverflow](http://stackoverflow.com/questions/11642971/unable-to-install-capybara-webkit) qt need to be installed first, before install capybara.
  
To install qt, you must link to libpng, simply link to linpng will fail due to permission,
{% highlight ruby %}
Error: Could not symlink file: /usr/local/Cellar/libpng/1.5.13/lib/pkgconfig/libpng15.pc
/usr/local/lib/pkgconfig is not writable. You should change its permissions.
{% endhighlight %}

To fix that
{% highlight ruby %}
sudo chown -R kahfei /usr/local/lib/pkgconfig
{% endhighlight %}

then only follow by command below
{% highlight ruby %}
brew update
brew link libpng
brew install qt
{% endhighlight %}

bundle install still fail though
{% highlight ruby %}
An error occurred while installing rmagick (2.13.1), and Bundler cannot continue.
Make sure that `gem install rmagick -v '2.13.1'` succeeds before bundling.
{% endhighlight %}

It seems that lot of people [having](https://coderwall.com/p/wnomjg) [this](https://github.com/mxcl/homebrew/issues/16625) [same](http://flaviomuniz.com/blog/how-to-fix-rmagick-2-13-1-cant-find-magickwand-h.html) [problem](http://stackoverflow.com/questions/11676844/issue-with-installing-imagemagick-and-rmagick-on-mountain-lion). Some of the suggestion work for some people, but none of it fixed my problem. Apparently this is a rmagick bug, as it does not support the newer version of ImageMagick. rmagick has not been updated for two years, so if there is an option, change to other gem to work with image, like [minimagick](https://github.com/minimagick/minimagick)

After hours of scouring the internet, and trying a few different approaches, using the [magick-installer](https://github.com/maddox/magick-installer) to install ImageMagick, then

{% highlight ruby %}
bundle install
{% endhighlight %}

work again. No actually I lie,  bundle install yield another error
{% highlight ruby %}
ERROR: While executing gem … (ArgumentError) marshal data too short
{% endhighlight %}

There are suggestions to remove ~./gem folder altogether and reinstall all the gem. But in my case, bundle install work on other rails apps, just not this one. So I clone again the repo to a new folder, now bundle install work!

Now creating development, testing and production environment. I already have postgresql installed locally, so I will use postgresql, my database.yml looks something like this
{% highlight ruby %}
development:
adapter: postgresql
encoding: unicode
database: futnotes_development
pool: 5
username: kahfei
password: 
test:
adapter: postgresql
encoding: unicode
database: futnotes_test
pool: 5
username: kahfei
password: 
 
production:
adapter: postgresql
encoding: unicode
database: futnotes_production
pool: 5
username: kahfei
password:

{% endhighlight %}

now to create them
{% highlight ruby %}rake db:create:all{% endhighlight %}

All three database created
{% highlight ruby %}
rake db:migrate
{% endhighlight %}

with a long list of errors, it start with something like this
{% highlight ruby %}
PG::Error: ERROR:  column "position" does not exist
LINE 1: ...RE "competitions"."name" = 'Premiership' ORDER BY position, ...
{% endhighlight %}
