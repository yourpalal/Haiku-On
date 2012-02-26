%{
#include <Messenger.h>
%}


class BMessenger {
public:	
	BMessenger();
	BMessenger(const char *signature, team_id team = -1,
			   status_t *result = NULL);
	BMessenger(const BHandler *handler, const BLooper *looper = NULL,
			   status_t *result = NULL);
	BMessenger(const BMessenger &from);
	~BMessenger();

	// Target

	bool IsTargetLocal() const;
	BHandler *Target(BLooper **looper) const;
	bool LockTarget() const;
	status_t LockTargetWithTimeout(bigtime_t timeout) const;

	// Message sending

	status_t SendMessage(uint32 command, BHandler *replyTo = NULL) const;
	status_t SendMessage(BMessage *message, BHandler *replyTo = NULL,
						 bigtime_t timeout = B_INFINITE_TIMEOUT) const;
	status_t SendMessage(BMessage *message, BMessenger replyTo,
						 bigtime_t timeout = B_INFINITE_TIMEOUT) const;
	status_t SendMessage(uint32 command, BMessage *reply) const;
	status_t SendMessage(BMessage *message, BMessage *reply,
						 bigtime_t deliveryTimeout = B_INFINITE_TIMEOUT,
						 bigtime_t replyTimeout = B_INFINITE_TIMEOUT) const;
	
	// Operators and misc

	%ignore operator=(const BMessenger& from);
	BMessenger &operator=(const BMessenger &from);

	%rename("IsEqual") operator==(const BMessenger& from) const;
	bool operator==(const BMessenger &other) const;

	bool IsValid() const;
	team_id Team() const;
};

%ignore operator<(const BMessenger& a, const BMessenger& b);
bool operator<(const BMessenger &a, const BMessenger &b);

%ignore operator!=(const BMessenger& a, const BMessenger& b);
bool operator!=(const BMessenger &a, const BMessenger &b);
