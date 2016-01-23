---
title: map and each
layout: post
permalink: /2010/07/25/map-and-each/
comments: true
---
It is a bit difficult for me to understand the difference between map and each, until I found out this in irb accidentally,

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;">irb<span style="color:#006600; font-weight:bold;">&#40;</span>main<span style="color:#006600; font-weight:bold;">&#41;</span>:001:<span style="color:#006666;"></span><span style="color:#006600; font-weight:bold;">&gt;</span> name = <span style="color:#006600; font-weight:bold;">%</span>w<span style="color:#006600; font-weight:bold;">&#123;</span>guido knuth adrian dhh pg<span style="color:#006600; font-weight:bold;">&#125;</span>
<span style="color:#006600; font-weight:bold;">=&gt;</span> <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#996600;">"guido"</span>, <span style="color:#996600;">"knuth"</span>, <span style="color:#996600;">"adrian"</span>, <span style="color:#996600;">"dhh"</span>, <span style="color:#996600;">"pg"</span><span style="color:#006600; font-weight:bold;">&#93;</span>
irb<span style="color:#006600; font-weight:bold;">&#40;</span>main<span style="color:#006600; font-weight:bold;">&#41;</span>:002:<span style="color:#006666;"></span><span style="color:#006600; font-weight:bold;">&gt;</span> name.<span style="color:#9900CC;">each</span> <span style="color:#006600; font-weight:bold;">&#123;</span><span style="color:#006600; font-weight:bold;">|</span>n<span style="color:#006600; font-weight:bold;">|</span> n.<span style="color:#9900CC;">upcase</span><span style="color:#006600; font-weight:bold;">&#125;</span>
<span style="color:#006600; font-weight:bold;">=&gt;</span> <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#996600;">"guido"</span>, <span style="color:#996600;">"knuth"</span>, <span style="color:#996600;">"adrian"</span>, <span style="color:#996600;">"dhh"</span>, <span style="color:#996600;">"pg"</span><span style="color:#006600; font-weight:bold;">&#93;</span>
irb<span style="color:#006600; font-weight:bold;">&#40;</span>main<span style="color:#006600; font-weight:bold;">&#41;</span>:003:<span style="color:#006666;"></span><span style="color:#006600; font-weight:bold;">&gt;</span> name.<span style="color:#9900CC;">map</span> <span style="color:#006600; font-weight:bold;">&#123;</span><span style="color:#006600; font-weight:bold;">|</span>n<span style="color:#006600; font-weight:bold;">|</span> n.<span style="color:#9900CC;">upcase</span><span style="color:#006600; font-weight:bold;">&#125;</span>
<span style="color:#006600; font-weight:bold;">=&gt;</span> <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#996600;">"GUIDO"</span>, <span style="color:#996600;">"KNUTH"</span>, <span style="color:#996600;">"ADRIAN"</span>, <span style="color:#996600;">"DHH"</span>, <span style="color:#996600;">"PG"</span><span style="color:#006600; font-weight:bold;">&#93;</span></pre>
      </td>
    </tr>
  </table>
</div>

map and each are suppose to do almost the same thing, but why _each_ didn&#8217;t return the correct result in uppercase like what _map_ did? 

The different is _each_ yield each element in the collection to the code block, in this case perform the upcase method, but return the receiver, which is the original array, hence an array of lower case names.

Whereas, _map_ return a new array, consists of elements already went through the code block, hence an array of upper case names.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;">irb<span style="color:#006600; font-weight:bold;">&#40;</span>main<span style="color:#006600; font-weight:bold;">&#41;</span>:007:<span style="color:#006666;"></span><span style="color:#006600; font-weight:bold;">&gt;</span> name.<span style="color:#9900CC;">each</span> <span style="color:#006600; font-weight:bold;">&#123;</span><span style="color:#006600; font-weight:bold;">|</span>n<span style="color:#006600; font-weight:bold;">|</span> <span style="color:#CC0066; font-weight:bold;">p</span> n.<span style="color:#9900CC;">upcase</span><span style="color:#006600; font-weight:bold;">&#125;</span>
<span style="color:#996600;">"GUIDO"</span>
<span style="color:#996600;">"KNUTH"</span>
<span style="color:#996600;">"ADRIAN"</span>
<span style="color:#996600;">"DHH"</span>
<span style="color:#996600;">"PG"</span>
<span style="color:#006600; font-weight:bold;">=&gt;</span> <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#996600;">"guido"</span>, <span style="color:#996600;">"knuth"</span>, <span style="color:#996600;">"adrian"</span>, <span style="color:#996600;">"dhh"</span>, <span style="color:#996600;">"pg"</span><span style="color:#006600; font-weight:bold;">&#93;</span>
irb<span style="color:#006600; font-weight:bold;">&#40;</span>main<span style="color:#006600; font-weight:bold;">&#41;</span>:006:<span style="color:#006666;"></span><span style="color:#006600; font-weight:bold;">&gt;</span> name.<span style="color:#9900CC;">map</span> <span style="color:#006600; font-weight:bold;">&#123;</span><span style="color:#006600; font-weight:bold;">|</span>n<span style="color:#006600; font-weight:bold;">|</span> <span style="color:#CC0066; font-weight:bold;">p</span> n.<span style="color:#9900CC;">upcase</span><span style="color:#006600; font-weight:bold;">&#125;</span>
<span style="color:#996600;">"GUIDO"</span>
<span style="color:#996600;">"KNUTH"</span>
<span style="color:#996600;">"ADRIAN"</span>
<span style="color:#996600;">"DHH"</span>
<span style="color:#996600;">"PG"</span>
<span style="color:#006600; font-weight:bold;">=&gt;</span> <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#0000FF; font-weight:bold;">nil</span>, <span style="color:#0000FF; font-weight:bold;">nil</span>, <span style="color:#0000FF; font-weight:bold;">nil</span>, <span style="color:#0000FF; font-weight:bold;">nil</span>, <span style="color:#0000FF; font-weight:bold;">nil</span><span style="color:#006600; font-weight:bold;">&#93;</span></pre>
      </td>
    </tr>
  </table>
</div>

So here you can see with p, both _map_ and _each_ output the uppercase names, but look more carefully, the return value of _each_, as expected, is the original array. _map_ however, return an array of nils! 

Why is that?