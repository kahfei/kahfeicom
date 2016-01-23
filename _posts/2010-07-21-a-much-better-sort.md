---
title: A much better sort
layout: post
permalink: /2010/07/21/a-much-better-sort/
comments: true
---
Okay, much better only in a relative term, comparing to my earlier sorting which didn&#8217;t take care of duplicate elements.
  
Two major changes here.

1. I do away with the temporary variable for holding on the smallest number result from each round of the comparison, instead elements are now passed over directly to the sorted array.

2. Those elements that get passed to the sorted array, will be deleted from the original array, but one items at one round of comparison, which mean if there are duplicated elements, only one of the instance will be removed.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;"> hackers.<span style="color:#9900CC;">delete_at</span><span style="color:#006600; font-weight:bold;">&#40;</span>hackers.<span style="color:#9900CC;">index</span><span style="color:#006600; font-weight:bold;">&#40;</span>sorted<span style="color:#006600; font-weight:bold;">&#91;</span>count<span style="color:#006600; font-weight:bold;">&#93;</span><span style="color:#006600; font-weight:bold;">&#41;</span><span style="color:#006600; font-weight:bold;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

It look a lot more wordy than a shorter

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;">hackers.<span style="color:#9900CC;">delete</span><span style="color:#006600; font-weight:bold;">&#40;</span>sorted<span style="color:#006600; font-weight:bold;">&#91;</span>count<span style="color:#006600; font-weight:bold;">&#93;</span><span style="color:#006600; font-weight:bold;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

but this is deleting ONLY the first element that match the value, compare to the shorter version where it will remove all elements. So it preserve the other element for next round of comparison, and eventually make it to the sorted array.
  
Complete code as below,

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;">hackers = <span style="color:#006600; font-weight:bold;">%</span>w<span style="color:#006600; font-weight:bold;">&#123;</span> gosling matz dhh adrian guido matz knuth dhh adrian guido <span style="color:#006600; font-weight:bold;">&#125;</span>
i = hackers.<span style="color:#9900CC;">length</span>
count = <span style="color:#006666;"></span>
sorted = <span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#006600; font-weight:bold;">&#93;</span>
&nbsp;
<span style="color:#9966CC; font-weight:bold;">while</span> count <span style="color:#006600; font-weight:bold;">&</span>lt; i
  sorted<span style="color:#006600; font-weight:bold;">&#91;</span>count<span style="color:#006600; font-weight:bold;">&#93;</span> = hackers.<span style="color:#9900CC;">inject</span><span style="color:#006600; font-weight:bold;">&#123;</span> <span style="color:#006600; font-weight:bold;">|</span>a,b<span style="color:#006600; font-weight:bold;">|</span> a <span style="color:#006600; font-weight:bold;">&</span>lt; b ? a : b <span style="color:#006600; font-weight:bold;">&#125;</span>
  <span style="color:#CC0066; font-weight:bold;">p</span> sorted<span style="color:#006600; font-weight:bold;">&#91;</span>count<span style="color:#006600; font-weight:bold;">&#93;</span>
  hackers.<span style="color:#9900CC;">delete_at</span><span style="color:#006600; font-weight:bold;">&#40;</span>hackers.<span style="color:#9900CC;">index</span><span style="color:#006600; font-weight:bold;">&#40;</span>sorted<span style="color:#006600; font-weight:bold;">&#91;</span>count<span style="color:#006600; font-weight:bold;">&#93;</span><span style="color:#006600; font-weight:bold;">&#41;</span><span style="color:#006600; font-weight:bold;">&#41;</span>
  count <span style="color:#006600; font-weight:bold;">+</span>= <span style="color:#006666;">1</span>
<span style="color:#9966CC; font-weight:bold;">end</span>
<span style="color:#CC0066; font-weight:bold;">p</span> sorted</pre>
      </td>
    </tr>
  </table>
</div>

And the result&#8230;.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="ruby" style="font-family:monospace;"><span style="color:#006600; font-weight:bold;">&#91;</span><span style="color:#996600;">"adrian"</span>, <span style="color:#996600;">"adrian"</span>, <span style="color:#996600;">"dhh"</span>, <span style="color:#996600;">"dhh"</span>, <span style="color:#996600;">"gosling"</span>, <span style="color:#996600;">"guido"</span>, <span style="color:#996600;">"guido"</span>, <span style="color:#996600;">"knuth"</span>, <span style="color:#996600;">"matz"</span>, <span style="color:#996600;">"matz"</span><span style="color:#006600; font-weight:bold;">&#93;</span></pre>
      </td>
    </tr>
  </table>
</div>