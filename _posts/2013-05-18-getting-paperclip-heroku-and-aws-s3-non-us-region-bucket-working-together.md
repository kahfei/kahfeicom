---
title: Getting paperclip, heroku and aws s3 non-us region bucket working together
layout: post
permalink: /2013/05/18/getting-paperclip-heroku-and-aws-s3-non-us-region-bucket-working-together/
comments: true
---
As I have found out [earlier](http://www.kahfei.com/?p=363), images uploaded via paperclip to heroku will go missing after each push of code to heroku. 

One way to keep images uploaded via paperclip permanent is to use a 3rd party storage service like s3 or keep it on a ftp server. I went for s3, mainly want to learn dealing with Amazon Web Services, might turn to ftp server later on if needed. If you would like to go the ftp server way, there are gem like [FTP Storage for Paperclip](https://github.com/xing/paperclip-storage-ftp) and [PaperclipFTP](https://github.com/cdamian/paperclipftp) to make life easier.

 * Add paperclip and aws-sdk to your gemfile 
  {% highlight ruby %}
  gem 'paperclip'
  gem 'aws-sdk'
  {% endhighlight %}
  follow by the usual
  {% highlight ruby %}
  bundle install
  {% endhighlight %}
  * To start working with s3, first you need to [signup for an aws account](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html).
  * Once you have an account, login then go to My Account/Console > AWS Management Console
    ![](/images/aws_mgt.png)
  * Select s3 from a host of services
  * Create a bucket. 
    "A bucket is a container for objects stored in Amazon S3. When creating a bucket, you can choose a Region to optimize for latency", that is what mentioned in the guide, so I chose Singapore as it is closest to my location.
  
    ![region](/images/region.png)

  Now if you have chosen “US standard” region, things will work out much straightforward, any non-us region will need some tweaks in the configuration. [The documentation in heroku](https://devcenter.heroku.com/articles/paperclip-s3) did mentioned that some international users may need to override the default URL structure and place the bucket’s name “domain-style” in the URL. Following that guide didn't solve my problem though. I googled around, found a few more useful guides.

* [Stackoverflow](http://stackoverflow.com/questions/4956583/ruby-on-rails-paperclip-heroku-github-and-aws-securing-keys) on setting env variables
* [Techspry](http://techspry.com/ruby_and_rails/amazons-s3-european-buckets-and-paperclip-in-rails-3/) on s3 configuation
* [DCChua](http://dchua.com/2011/12/27/how-to-get-paperclip-and-aws-s3-singapore-and-european-buckets-working/) on how to get Paperclip and AWS-S3 Singapore (and European) buckets working.

Coupled with the heroku documentation, I finally get my setup working combining them and change a bit here and there.
    
  * Get your aws access key and secret access key from the Security Credential option
  * In ./config/production.rb, defined this environment variables 

      {% highlight ruby %}
      config.paperclip_defaults = {
          :storage => :s3,
          :s3_credentials => {
            :bucket => ENV['AWS_BUCKET'],
            :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
            :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
          },
          :path => ":class/:id/:basename_:style.:extension",
          :url => ":s3_sg_url"
      }
      {% endhighlight %}    

  * Then set them by doing these in terminal from your apps 
    {% highlight ruby %}
    heroku config:set AWS_BUCKET=your_bucket_name
    heroku config:set AWS_ACCESS_KEY_ID=your_access_key_id
    heroku config:set AWS_SECRET_ACCESS_KEY=your_secret_access_key
    {% endhighlight %}

You can of course set these values in the ./config/production.rb file, but then it is not protected if your repo is not private.
        
  * In ./config/initializer, create paperclip.rb, and add these lines 
    {% highlight ruby %}
      Paperclip.interpolates(:s3_sg_url) do |att, style| 
        "#{att.s3_protocol}://s3-ap-southeast-1.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
      end
    {% endhighlight %}     


* git commit, push and then push to heroku, images uploaded from your apps should now store in s3.
    