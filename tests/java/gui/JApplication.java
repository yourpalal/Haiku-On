import org.haiku.*;
import static org.haiku.haikuConstants.*;


class JApplication extends BApplication {
	static final long kButtonPressed = BMessage.MakeWhatConstant("boom");

	public JApplication()
	{
		super("application/x-vnd.Haiku-onJava-GUItest");

		fWindow = new BWindow(new BRect(0, 0, 200, 200), "JAVA HAIKU GUI!!!",
			window_type.B_TITLED_WINDOW, B_AUTO_UPDATE_SIZE_LIMITS) {

			public void MessageReceived(BMessage message) {
				if (message.getWhat() == kButtonPressed) {
					System.out.println("BOOM!");
				} else
					super.MessageReceived(message);
			}
		};

		fWindow.SetLayout(new BGroupLayout(orientation.B_VERTICAL, 0));
		fWindow.AddChild(_makeUnlimited(new BButton("JAAAAAAAAAAAVAAAAAA",
			new BMessage(kButtonPressed))));
		fWindow.AddChild(_makeUnlimited(
			new BStringView("string view", "WOOOO HOOO")));

		fWindow.Show();
	}

	private BView _makeUnlimited(BView view)
	{
		view.SetExplicitMaxSize(new BSize(B_SIZE_UNLIMITED, B_SIZE_UNLIMITED));
		return view;
	}

	private BWindow fWindow;

	public static void main(String args[])
	{
		(new JApplication()).Run();
	}
};
