%{
#include <MessageRunner.h>
%}


%import Messenger.i


class BMessageRunner {
public:
								BMessageRunner(BMessenger target,
									const BMessage* message, bigtime_t interval,
									int32 count = -1);
								BMessageRunner(BMessenger target,
									const BMessage* message, bigtime_t interval,
									int32 count, BMessenger replyTo);
	virtual						~BMessageRunner();

			status_t			InitCheck() const;

			status_t			SetInterval(bigtime_t interval);
			status_t			SetCount(int32 count);
			status_t			GetInfo(bigtime_t* interval,
									int32* count) const;

	static	status_t			StartSending(BMessenger target,
									const BMessage* message, bigtime_t interval,
									int32 count);
	static	status_t			StartSending(BMessenger target,
									const BMessage* message, bigtime_t interval,
									int32 count, BMessenger replyTo);

};

