There are so many Javascript frameworks at the moment. As of this writing React, Browserify and Gulp seem to be poised to overtake the current stack of choice AngularJS, RequireJS, Grunt (Obviously there are many combinations of this along with preprocessors that compile to JS). But why do we care so much about these? "This is better because streams" someone will scream. "Angular teaches bad practices" another will say. Honestly I am left unimpressed and a little ashamed that so much effort is being invested into tools that have such short lifespans.

So I have decided to embark on a journey to produce some code that will demonstrate the views I have on software from my studying the work of Kent Beck, Bob Martin, Martin Fowler, Steve Freeman, Nat Pryce and the list goes on. These people are focused on structuring code to be maintainable, readable and generally separated from third-party frameworks. This is something I have yet to see anyone do in Javascript, and lately in any code at all. I always see code that is tightly coupled, pseudo-procedural w/ some OO sprinkled in, and frameworks enjoying a long life in the center of the design.

I have chosen the standard Todo app as an example. I will take Uncle Bob's view that "The web is a detail" and blissfully ignore it until I am ready to use some framework as a plugin into either the gateway or presenter for a feature. Once the foundation is laid I will then attempt to plugin all of the major frameworks as presenters and write about the experience. I expect to not be able to use most of the shiny parts of these frameworks as their only job will be to display my view. An "opinionated" framework like Angular feels like it will be the hardest to work with in this regard, but I will cross that bridge when I get there.

I will periodically write mini-posts in the architectures directory as well as record the state of any UML diagrams I work on.