import os.path


def FindDir(directory):
	process = subprocess.Popen(['finddir', directory],
		stderr = subprocess.PIPE,
		stdout = subprocess.PIPE)

	(stdout, stderr) = process.communicate()

	if process.returncode != 0:
		raise Exception("directory constant not recognized by finddir")
	return stdout.read()


env = Environment(CPPPATH=os.path.abspath("./"),
	ENV = {
		'BE_CPLUS_COMPILER' : os.environ['BE_CPLUS_COMPILER'],
		'BELIBRARIES' : os.environ['BELIBRARIES'],
		'BEINCLUDES' : os.environ['BEINCLUDES'],
		'PATH' : os.environ['PATH']},
	SWIGFLAGS = ['-Wall', '-c++'],
	SWIGPATH = ['swig/support', 'swig/app'],
	JAVAC = 'ecj',
	JAVACFLAGS = ['-1.5'],
	tools = ['default', SymlinkTool])

env.Append(LIBPATH = [os.environ['LIBRARY_PATH']])


swig_files = ["swig/haiku.i"]


JAVA_OUTDIR = 'generated/java/src'
JAVA_CLASSDIR = 'generated/java/classes'
JAVA_LIBNAME = 'haiku-onJava'
JAVA_JARNAME = 'haiku.jar'
JAVA_PACKAGE = 'org.haiku'

javaEnv = env.Clone()
javaEnv.AppendUnique(SWIGFLAGS = ['-java', '-package', JAVA_PACKAGE],
					SWIGOUTDIR = JAVA_OUTDIR)	

java_lib = javaEnv.SharedLibrary(JAVA_LIBNAME, swig_files)

class_files = env.Java(JAVA_CLASSDIR, JAVA_OUTDIR)

fix_filenames = lambda x : os.path.join(JAVA_CLASSDIR, 'org/haiku/', os.path.split(str(x))[1])

jarEnv = env.Clone(JARCHDIR = JAVA_CLASSDIR)
java_jar = jarEnv.Jar(JAVA_JARNAME, map(fix_filenames, class_files))
env.Depends(java_jar, class_files)
env.Depends(class_files, java_lib)

env.SConscript("tests/java/SConscript",
	exports = ['java_jar', 'java_lib', 'env'])
