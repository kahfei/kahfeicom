---
title: Uploaded images go missing in heroku
layout: post
permalink: /2013/05/12/uploaded-images-go-missing-in-heroku/
comments: true
---
No doubt [heroku](http://www.heroku.com/) is the greatest thing since sliced bread, with easy deployment and stuff, and it is free to start with. Perfect for stingy developer like me. So I am working on a rails apps, deployed to heroku, with [paperclip](https://github.com/thoughtbot/paperclip) for image upload. Things work fine, except images I uploaded keep on missing. I thought heroku wouldn't store image for free user, ha. 

A quick search around internet, sure enough it is stackoverflow come with an [answer](http://stackoverflow.com/questions/10425843/everytime-push-to-heroku-images-is-not-showed-paperclip) top in the list. It turn out that only images in the commit and pushed to heroku are kept, example logo or icon used in the apps. Uploaded images will be removed with each push to heroku, clearly images uploaded via paperclip fall into the latter category. 

Solution is to use a 3rd party storage, like [Amazon Simple Storage Service](http://aws.amazon.com/s3/). Of course, aws is free to start with as well, a free account includes 5Gb storage, 20k Get requests, 2k put request, yada yada, another great thing for stingy developer, hurray!