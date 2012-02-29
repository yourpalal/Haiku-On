import os.path
import time


def FindDir(directory):
	process = subprocess.Popen(['finddir', directory],
		stderr = subprocess.PIPE,
		stdout = subprocess.PIPE)

	(stdout, stderr) = process.communicate()

	if process.returncode != 0:
		raise Exception("directory constant not recognized by finddir")
	return stdout.read()


env = Environment(CPPPATH=os.path.abspath("./"),
	JAVAC = 'ecj',
	JAVACFLAGS = ['-1.5'],
	tools = ['default', SymlinkTool])

env.Append(LIBPATH = [os.environ['LIBRARY_PATH']])

JAVA_LIBNAME = 'libhaiku-onJava.so'
JAVA_JARNAME = 'haiku.jar'


java_jar = env.File(JAVA_JARNAME)
java_lib = env.File(JAVA_LIBNAME)

env.SConscript("tests/java/SConscript",
	exports = ['java_jar', 'java_lib', 'env'])
