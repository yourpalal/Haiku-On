Haiku On
===============
Haiku On is a project to create language bindings for
the [Haiku](http://haiku-os.org) [API](http://api.haiku-os.org).
The first language to be targeted is Java, and it will likely be
the only targeted language for quite some time. However, with
Java bindings come Jython, JRuby, Scala etc. bindings, so we can
get a really good return from targeting Java.

To build everything
---------------
    make [all]

Before you do that, make sure you have the DevelopmentJava optional package installed. This will do it:

    installoptionalpackage DevelopmentJava

Once that's done, you'll need to install the ecj wrapper in the 'misc/' dir,
like so:

	ln -s <haiku-on repo>/misc/ecj /boot/common/bin/ecj

You'll also need to link 'gjar' as 'jar':

	ln -s `which gjar` /boot/common/bin/jar

You'll also need SWIG, and if you want to build the tests, you'll need SCons as well. After [installing haikuporter](http://ports.haiku-files.org/wiki/Installation#Installation) you can run the following code to do that:

    haikuporter -i swig/2.0.2
    haikuporter -i scons/2.0.1

Now that you've got almost everything ready, you'll need to get the jni headers
in place. Haiku's DevelopmentJava currently ships with bad headers, but better
ones from the GNUClasspath project are included in misc/. Copy them like so:

	cp -f misc/jni.h /boot/common/include/
	cp -f misc/jni_md.h /boot/common/include/

Finally, because the bindings only build under gcc4, you'll need to run the
following command before building:

	setgcc x86 gcc4

Bullet points
---------------
 *  You can install the .jar and .so files by running ```make install```
 *  The bindings are generated using SWIG.
 *  The build system was SCons, but it was choking on some of the generated filenames, so now it's a unholy mix of Make and SCons. This should be replaced, but it's functional.
 *  The bindings are still *very* immature.
 *  The SWIG interface files are mostly copied out of the Haiku headers, so the copyright for those chunks is held by whoever holds the copyright for the respective headers (mostly Haiku, Inc.). The copyright for anything written in this project by Alex Wilson (yourpalal) is also assigned to Haiku, Inc.
 *  MIT licensed

Haiku On?????
---------------
According to [wikipedia](http://en.wikipedia.org/wiki/On_(Japanese_prosody)),
'On' is the Japanase word for a phonetic unit, which is counted when composing Haiku poetry.
I'm a sucker for wordplay, so I decided to name this project 'Haiku on', as in 'Haiku on Java' or 'Haiku on Python' etc..
