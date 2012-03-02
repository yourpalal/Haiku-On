import org.haiku.*;


class JApplication extends BApplication {
	JApplication()
	{
		super("application/x-vnd.haiku-onJava-handler-test");
	}

	public int Run()
	{
		AddHandler(new JHandler());
		return super.Run();
	}


	public static void main(String args[])
	{
		JApplication app = new JApplication();
		app.Run();
	}
};
