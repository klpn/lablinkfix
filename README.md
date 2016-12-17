# lablinkfix
Due to changes in the archive and library catalogues at the Swedish [Labour
Movement Archives and Library](http://www.arbark.se/en/), there is widespread
link rot on web pages linking to these catalogues.

This program is intended to be used as a [Pandoc
filter](http://pandoc.org/scripting.html) to update source code which contains
such links.

The conversion for the archive catalogue is very simple. For the library
catalogue, post IDs have changed, and the mappings from old ones to new ones
are defined in `kataids.json`, with the format `"oldid":"newid"`. To build the
filer (assuming the Pandoc libraries and the GHC compiler are available), run
`make build`. At build, the mapping in `kataids.json` is coded into the filter,
so if this file is changed, the filter should be rebuilt. The present version
of `kataids.json` contains mappings for all links to posts in the library
catalogue in the [RSS feed for the institution's webpage category with articles
about their
collections](http://www.arbark.se/kategori/ur-vara-samlingar/feed/). Links to
Kata posts with the prefixes `http://kata.arbark.se/wsRecInfo.asp?idno=` or 
`http://kata.arbark.se/wsVolumes.asp?idno=` are updated with their matched IDs.
Links to Kata searches with the prefix
`http://kata.arbark.se/wsHitList.Asp?`are currently just redirected to the
search page in the new system.

I include the body content for [my article about the organization
BiS](http://www.arbark.se/2014/11/foreningen-bibliotek-i-samhalle/), as a HTML
file in the `examples` subdirectory. To run the filter on this file, and write
to the target `examples/bisbodynew.html`, use 
`pandoc -o examples/bisbodynew.html examples/bisbody.html --filter ./lablinkfix`.
The filter should work with any format supported by Pandoc, not just HTML.
