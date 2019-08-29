+++
title = "Marketing and Design"
description = "Marketing and Design"
keywords = ["marketing", "dog fooding"]
+++

<!--html_preserve-->
<div class="container">

<div class="row">
<div class="col-xs-8">
<p>This page is a dumping ground for all of the tools and workflows that we use for marketing, branding, teaching and more. We've collected these tools together because we're indebited to others for sharing them, and hope that other folks will find them useful. Note: We almost exclusively use macOS, so these solutions might not work for you.</p>
<p>We want to give back to the useR community as much as possible.</p>

</div>

<div class="col-xs-4">

<img src="../img/love-users.png" style="width:100%"></img>
    
</div>

</div>

<hr>

### Screenshots and screen recording

It's a complicated business taking good looking screenshots and/or screen recording. macOS does have built-in tools for grabbing screenshots and recording the screen but there are many areas where these fall short.

#### Code Screenshots: [carbon.now.sh](https://carbon.now.sh)

<div class="row">

<div class="col-sm-6">
<p>It's particularly hard to screenshot code well. Carbon is a free tool we use to solve this problem; <a href="https://carbon.now.sh/" target="_blank">carbon.now.sh</a>.</p>

<p>Carbon is used by many useRs on Twitter, for instance <a href="https://twitter.com/kearneymw" target="_blank">@kearneymw</a> and <a href="https://twitter.com/dataandme" target="_blank">@dataand</a>. Here's an example of it being <a href="https://twitter.com/kearneymw/status/1163965713280671745" target="_blank">used in the wild</a>.</p>
    
</div>
<div class="col-sm-6">
<center><img src="../img/carbon-screenshot-example_3.png" style="max-width:350px;width:100%;"></img></center>
</div>

</div>

#### Coding GIF (macOS): [GIFBrewery](https://gfycat.com/gifbrewery)

We use macOS' built-in screen recording tool - sometimes alongside keycatr - to create .mov files which we then convert to GIF using [GIFBrewery](https://gfycat.com/gifbrewery).

#### Keyboard tracking: [keycastr](https://github.com/keycastr/keycastr)

<div class="row">

<div class="col-sm-6">
    
<p>Keyboard shortcuts are awesome. But macOS doesn't have built-in tools for displaying key presses in screen recordings.

<p><a href="https://github.com/keycastr/keycastr" target="_blank">keycastr</a> is an excellent tool for adding key presses to screenshots in macOS, which I discovered from the phenomenal <a href="https://twitter.com/dataandme/status/1163821213334102016?s=20" target="_blank">Mara Averick on Twitter</a> </p>

</div>
<div class="col-sm-6">
<center><img src="../img/keycastr-screen-recording_1.gif" style="max-width:350px;width:100%;"></img></center>
</div>

</div>

<hr>

### Social Media

#### Twitter Scheduling: [buffer.com](https://buffer.com)

We first discovered Buffer through Mara Averick ([@dataandme](https://twitter.com/dataandme)) on Twitter and now use it to schedule daily tweets. Instead of linking you to normal marketing, here's a link to a [collection of user stories](https://buffer.com/resources/buffer-ios-9-mobile-social-media) (including Mara's).

<hr>

### This website

#### blogdown

We use the incredible [{blogdown}](https://bookdown.org/yihui/blogdown/) R package to build our company website. [@xieyihui](https://twitter.com/xieyihui) is the author of the package, and recommends hosting <code>{blogdown}</code> websites on Github.com and using Netlify.com for continuous deployment testing - which is exactly what we do here. We've done quite a bit of customisation to the [Hugo Universal Theme](https://themes.gohugo.io/hugo-universal-theme/), including:

- <strong>Hard-coded index.html</strong> <br>most Hugo templates come with a pre-designed home page defined in <code>layouts/index.html</code> which pulls in parameters from the <code>config.toml</code> file. Some <code>{blogdown}</code> users might be confused that making edits to <code>index.Rmd</code> does nothing to modify the homepage. We have therefore completely hard-coded our <code>index.html</code>, which you can <a href="https://github.com/visibledata/rfindingyourway/blob/master/layouts/index.html" target="_blank">find on Github</a>.

- <strong>\<!--html_preserve-->\ and \<!--/html_preserve--></strong> <br>We use a <strong>lot</strong> of custom HTML and CSS in this website, which is much easier to work with when properly indented. However, indentation in RMarkdown is interpreted. Thankfully, [@xieyihui](https://twitter.com/xieyihui) gives us a way to [preserve HTML](https://rmarkdown.rstudio.com/authoring_migrating_from_v1.html) and prevent the <code>{knitr}</code> parser from styling indented content according RMarkdown rules.<br>It's reasonable to ask, "why use <code>{blogdown}</code> if you're writing so much custom HTML?". We're intending to use R heavily in the blog and other articles, and we know <a href="https://yihui.name/en/2013/10/markdown-or-latex/" target="_blank">not to ask too much from Markdown directly</a>.


- 

</div>
<!--/html_preserve-->