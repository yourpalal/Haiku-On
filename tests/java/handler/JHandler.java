import org.haiku.*;


public class JHandler extends BHandler {

	@Override
	public void MessageReceived(BMessage message) {
		System.out.println("MESSAGE RECEIVED!!!");
		super.MessageReceived(message);
	}
};
