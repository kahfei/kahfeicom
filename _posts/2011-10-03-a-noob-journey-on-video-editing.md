---
title: A noob journey on video editing
layout: post
permalink: /2011/10/03/a-noob-journey-on-video-editing/
comments: true
---
Due to the really diversified nature of my job, somehow I ended up being assigned to create a video for someone in higher management for a presentation which gonna happen pretty soon, in 2 weeks time to be exact.

I do have some very basic experience with video editing stuff before, but nothing too complicated really. So what follow is more like a journey into searching for suitable video editing tool from the point of view of a noob.

### MovieMaker
![movie maker](/images/moviemaker.jpg)

Seeing that the only tools that I can use immediately within the office environment is movie maker, so I don’t really have much choice. Hey, it comes bundled with Windows, what can I do. The editing interface is easy enough to start with, dropping in simple effect like fade in fade out, sweeping from the left, fly out, fly in, almost make you feel like working in a PowerPoint environment (that might not necessary be a good thing for a lot of people though)

The problem arise when I try to publish the project into a proper video format after almost half a day of effort, it start to complain that it could not locate some of the source files!! Reason could be some of the files are moved, or renamed while I am working on the project file.

Strange thing is I can still view all my editing in Movie Maker, just couldn’t publish it. If I copy the project file and all the source file I am working with to another computer, it couldn’t even play out in Movie Maker, I think that is even stranger.

Worse is, as I search thru the net, most of the suggestion is that there is no way to fix it, other than redo everything.



### Lightwork Beta

![lightworkbeta](/images/lightworkbeta.jpg)

I tried the open source [Lightwork Beta](http://www.lightworksbeta.com/), the interface look really professional, it packed with lot of advance features, which of course means the interface is a lot more complex, and the learning curve is steeper. But the show stopper for me is the limited choice of video format, especially when it wouldn’t work with flv and mp4.

I am not sure if there are plugins or add-on or any other hacks around for the conversion, or I could actually use another conversion tools(video transcoder like [handbrake](http://handbrake.fr/) for example) before using Lightwork Beta to deal with the editing, but then again using yet another tools create another layer of complexity. And giving the short timeline I have for the work, I really don’t wish to spend my time doing that.

### After Effect
![after effect](/images/after_effect.jpg)

Then I think of trying out [Adobe After Effect](http://www.adobe.com/products/aftereffects.html), CS5.5 only work with a 64-bit machine, so I started to download the whooping 1G trial version of After Effect CS4 (for some reason I couldn’t find the download direct from Adobe site, and ended up download the trial from ProDesigntools, [here](http://prodesigntools.com/download-adobe-cs4-and-cs3-free-trials-here.html)). While I am sure After Effect will handle the tasks without any issues as it is a tool used by a lot of professionals, but eventually I have been turned off by the complexity of After Effect as well.

Looking at all the buttons and menus available, I just couldn’t stop feeling lost. I am still hugely interested in learning about After Effect, but then again this video editing thing, according to the higher management, “should not take up too much of your time”, but still “it has to be completed within week”, and with all the bells and whistles required.


### Avidemux and Openshot

![avidemux](/images/avidemux.jpg)

That leave me thinking, maybe I should do it at home in Ubuntu since I have some experience working with Avidemux before, a rather simple video editing task I must admit. So I come home and set out to look for good video editing tools.

I couldn’t remember why I didn’t use Avimux, maybe it seems too basic, I read through reviews in Ubuntu Software Center for video editing apps, it seems [Openshot](http://www.openshotvideo.com/) get quite some rave reviews. So I quickly installed Openshot, and the reviews are not too far off, pretty easy to use with some nice effect library. While I am busy editing the videos on hand, the higher management come with another order, to have all video in the same view size. So I try frantically looking for the option to adjust view size in Openshot, I am not sure if it is bad luck that all of a sudden Openshot just refuse to start.

I did a brief research on the net, seems that it [might be related to some package being updated that break Openshot](http://ubuntuforums.org/showthread.php?t=1475742). Uninstall and install may or may not help, or updating some packages. But then, I decide to try another apps instead.

update, as I wrote, I read that there is already a [newer version of Openshot 1.4 available](http://www.openshotvideo.com/2011/09/openshot-14-released-download-it-now.html), from the announcement video, it looks great, I will certainly give it a try soon.


### Pitivi

![pitivi](/images/pitivi.jpg)

Eventually, I tried [Pitivi](http://www.pitivi.org/). Pitivi come with even lesser features than Openshot, or MovieMaker. I couldn’t find any effect or transition library around, adding layer or fading in and out video depending on adding in keyframe and adjusting the opacity accordingly, which is surprisingly easy to use after you get the hang of it.

One neat feature in Pitivi is the mini preview sort of thumbnail picture along the timeline, so it give user a better hints on what scene is on which part.

But still, I am looking for way to adjust view size, and then I found in the net that there is an update version of Pitivi around, and there are tons of new features added in, re-sizing viewer being one of them.

To get the updated version, just do this

{% highlight ruby %}
sudo add-apt-repository ppa:pitivi/stable
sudo apt-get update
sudo apt-get install pitivi
{% endhighlight %}


Then you should get the latest stable version, 0.15. So far I only encountered very few problems with editing, and rendering in Pitivi. I got this useful tips for getting the optimal setup for video rendering in Pitivi, from the ubuntuforum, [comment from theSuperman](http://ubuntuforums.org/showpost.php?p=10101477&postcount=4)

 * _Set Container to MP4_
 * _Audio Codec set to Ffmpeg ALAC encoder_
 * _Video Codec to Ffmpeg MPEG-4 part 2 encoder_
 * _Change the video codec bit rate to &#8220;10300000&#8221;_

I try similar setup with container change to AVI, and overall quite satisfied with the quality.

## Summary

For a lighter and simpler, and of course free video editing tools, so far my experience favor Pitivi, it is easy to use, stable, and in the latest version, it come with quite a lot of useful features. I will definitely try out Openshot latest version 1.4 when I have time, hope it is even better than Pitivi, healthy competition will benefit everyone.