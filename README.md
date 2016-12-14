# lablinkfix
Due to changes in the archive and library catalogues at the Swedish [Labour
Movement Archives and Library](http://www.arbark.se/en/), there is widespread
link rot on web pages linking to these catalogues.

This program is intended to be used as a [Pandoc
filter](http://pandoc.org/scripting.html) to update source code which contains
such links.

Assuming the Pandoc libraries and the GHC compiler are available, the filter
can be compiled with `ghc --make lablinkfix`.

I include the body content for [my article about the organizaton
BiS](http://www.arbark.se/2014/11/foreningen-bibliotek-i-samhalle/), as a HTML
file in the `examples` subdirectory. To run the filter on this file, and write
to the target `examples/bisbodynew.html`, use 
`pandoc -o examples/bisbodynew.html examples/bisbody.html --filter ./lablinxfix`.
The filter should work with any format supported by Pandoc, not just HTML.

The conversion for the archive catalogue is very simple. For the library
catalogue, post IDs have changed, and old ones are mapped to new ones using the
`kataids` map. Currently, it only contains data for the posts in the example
file, and it obviously should be expanded and perhaps read from a CSV or JSON file
or a database.
