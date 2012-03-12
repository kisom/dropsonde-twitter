# dropsonde-twitter

This was a project designed to provide a gateway between SMS and twitter
direct messages.

Doesn't Twitter support this already? Yes - *if* you're in a country
supported by their service. While I was in Tanzania, I wanted to keep
in touch with some friends via Twitter. While out in the sticks, SMS
was the only means of communications that I had, so I wanted to find a
way to use Twitter that way. 

Why didn't it work? No one supports sending SMSes programmatically to
the carrier I had.

Was it worth it? I learned quite a bit about architecting web apps (or
rather, how not to). One of the successes I had was, I think, in properly
sticking to the MVC paradigm and not attempting to put logic in the views.
The codebase is still ugly.

Can I use this and make it work for me? Most likely. You'll need to store
your Twitter consumer keys as environment vars on Heroku - CONSUMER_TOKEN
and CONSUMER_KEY.

Also, there are no tests. I am deeply ashamed of this.

Yes, there's commented out code. Here's why:

0. I designed this service to be used really only by me, because 99.99% 
of people are covered by the current service.
0. The only way to test some of the code was to push to heroku and pull 
down the crash logs.
