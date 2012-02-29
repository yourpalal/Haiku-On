import org.haiku.*;


class JApplication extends BApplication {

	static {
		System.load("./libhaiku-onJava.so");
	}

	public JApplication()
	{
		super("application/x-vnd.Haiku-onJava-GUItest");

		fWindow = new BWindow(new BRect(0, 0, 200, 200), "JAVA HAIKU GUI!!!",
			window_type.B_TITLED_WINDOW);
		fWindow.SetLayout(new BGroupLayout(orientation.B_HORIZONTAL));
		fWindow.AddChild(new BButton("JAAAAAAAAAAAVAAAAAA"));
		fWindow.Show();
	}

	private BWindow fWindow;

	public static void main(String args[])
	{
		(new JApplication()).Run();
	}
};
