# JQuery UI Widget with Gon Gem #

## History:
Recently I did a __code challenge__ that was almost exclusively JQuery. Which would have been great if I'd known JQuery, but I was only familiar with it. In a whirlwind session I learned quite a bit in the less than 12 hours I had to hand in the challenge.  
I did a poor job in the challenge but I learned a lot. I essentially taught myself the following concepts in a very short time:

1. JSONP and why it's important in cross-browser communication
2. How to get a Rails application to generate a JSONP object instead of pure JSON. 
3. How the $.ajax() function call in JQuery works 
4. How to debug a JavaScript program using the console, Firebug and the web-tools form Firefox (superior) and Chrome (shockingly weaker); something I'd never explored before since all my JS had been on Node on the back-end only.

I was left with a question on how to dynamically generate a JS value or object at run-time. In the code challenge I simply hard-coded the server's URL but it would've been great to have it determined at run-time and have it do a different thing in development and in production. 
That's how I found out about the Gon Gem.

Now I'm only left with how to write a good effective Jasmine test in coffee-script that loads JQuery. 

## Usage:

This is an example project on how to use the Gon Gem on a Sinatra App, thought it also works with a rails app to dynamically generate content for the JS running on the page. The page creates a modal window that loads some information form the sample server or any server coded in the Sinatra app.  
The Gon Gem only requires: 

> `require 'gon-sinatra' #allows me to pass @variables to js.
Sinatra::register Gon::Sinatra`

And then you have access to it inside your Ruby/Sinatra/Rails:

> `@jsonp_url = 'http://localhost:3000/articles.json'
gon.jsonp_url = @jsonp_url`

and in JavaScript/CoffeeScript:

> `url: gon.jsonp_url #url for Rail App sending jsonp`

*Isn't that awesome??*

## Why JSONP?
Because JSON can be evaluated directly by a JS program, browsers don't allow you to load a JSON object that doesn't come from the same site. This is a great security feature and while you can create a CrossSite.XML thingy, I didn't want to do that. There are alternate solutions involving a XHTML request function but I didn't want that either; I wanted this strange thing called a JSONP which I'd never heard of before. 

JSONP is JSON package and it took me a while to figure out what it is; it's a JQuery object that wraps around the JSON object you want. Because the 'server' must give back the JSONP object you send it, it prevents attacks where JSON is sent to your server unrequested. It's a great work around and once you get it, it's pretty awesome, I think.

To generate a JSONP object instead of JSON from a Rails server all you need is change a line in the appropriate controller from this:

>`format.json { render json: @articles }`  

to this:

> `format.json { render json: @articles, :callback => params[:callback] }`

## Blog post
I wrote a blog post about this, check out my website at: www.rabbitmoon.org/blogs