import org.haiku.*;


class JApplication extends BApplication {
	static {
		System.load("./libhaiku-onJava.so");
	}

	JApplication()
	{
		super("application/x-vnd.haiku-onJava-handler-test");
	}

	public SWIGTYPE_p_thread_id Run()
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
