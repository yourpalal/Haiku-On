Haiku On
===============
Haiku On is a project to create language bindings for the [Haiku](http://haiku-os.org) [API](http://api.haiku-os.org). The first language to be targeted is Java, and it will likely be the only targeted language for quite some time. However, with Java bindings come Jython, JRuby, Scala etc. bindings, so we can get a really good return from targeting Java.

To build everything
---------------
    Make [all]

Bullet points
---------------
 *  There is currently no install target in the Makefile.
 *  The bindings are generated using SWIG.
 *  The build system was SCons, but it was choking on some of the generated filenames, so now it's a unholy mix of Make and SCons. This should be replaced, but it's functional.
 *  The bindings are still *very* immature.
 *  The SWIG interface files are mostly copied out of the Haiku headers, so the copyright for those chunks is held by whoever holds the copyright for the respective headers (mostly Haiku, Inc.). The copyright for anything written in this project by Alex Wilson (yourpalal) is also assigned to Haiku, Inc.
