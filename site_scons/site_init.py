import subprocess

def SymlinkTool(env):
	def DoSymlink(target, source, env):
		os.symlink(os.path.abspath(str(source[0])),
			os.path.abspath(str(target[0])))

	add_symlink = Builder(action = DoSymlink)
	env.Append(BUILDERS = {'Symlink' : add_symlink})
