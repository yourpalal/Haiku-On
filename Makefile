all : SWIG haiku.jar libhaiku-onJava.so tests
	echo boom

SWIG : swig/*.i swig/*/*.i
	rm -f generated/java/src/*
	swig -c++ -java -outdir generated/java/src -Iswig/support -Iswig/app -Wall -package org.haiku swig/haiku.i

haiku.jar : SWIG
	rm -f generated/java/classes/org/haiku/*
	ecj -1.5 -d generated/java/classes -sourcepath generated/java/src generated/java/src/*.java
	cd generated/java/classes && jar -cf haiku.jar org/haiku/*.class
	mv generated/java/classes/haiku.jar haiku.jar

libhaiku-onJava.so: SWIG
	g++ -shared -fPIC swig/*.cxx -o libhaiku-onJava.so

tests: haiku.jar libhaiku-onJava.so
	scons

@PHONY : SWIG all tests
