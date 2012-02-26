%feature ("director") BLooper;


%{
#include <Looper.h>
%}


%import Handler.i


// Port (Message Queue) Capacity
#define B_LOOPER_PORT_DEFAULT_CAPACITY	200


class BLooper : public BHandler {
public:
							BLooper(const char* name = NULL,
								int32 priority = B_NORMAL_PRIORITY,
								int32 port_capacity
									= B_LOOPER_PORT_DEFAULT_CAPACITY);
	virtual					~BLooper();
	// Archiving
	/*
							BLooper(BMessage* data);
	static	BArchivable*	Instantiate(BMessage* data);
	virtual	status_t		Archive(BMessage* data, bool deep = true) const;
	*/

	// Message transmission
			status_t		PostMessage(uint32 command);
			status_t		PostMessage(BMessage* message);
			status_t		PostMessage(uint32 command, BHandler* handler,
								BHandler* replyTo = NULL);
			status_t		PostMessage(BMessage* message, BHandler* handler,
								BHandler* replyTo = NULL);

	virtual	void			DispatchMessage(BMessage* message,
								BHandler* handler);
	virtual	void			MessageReceived(BMessage* message);
			BMessage*		CurrentMessage() const;
			BMessage*		DetachCurrentMessage();
			BMessageQueue*	MessageQueue() const;
			bool			IsMessageWaiting() const;

	// Message handlers
			void			AddHandler(BHandler* handler);
			bool			RemoveHandler(BHandler* handler);
			int32			CountHandlers() const;
			BHandler*		HandlerAt(int32 index) const;
			int32			IndexOf(BHandler* handler) const;

			BHandler*		PreferredHandler() const;
			void			SetPreferredHandler(BHandler* handler);

	// Loop control
	virtual	thread_id		Run();
	virtual	void			Quit();
	virtual	bool			QuitRequested();
			bool			Lock();
			void			Unlock();
			bool			IsLocked() const;
			status_t		LockWithTimeout(bigtime_t timeout);
			thread_id		Thread() const;
			team_id			Team() const;
	static	BLooper*		LooperForThread(thread_id thread);

	// Loop debugging
			thread_id		LockingThread() const;
			int32			CountLocks() const;
			int32			CountLockRequests() const;
			sem_id			Sem() const;

	// Scripting
	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual status_t		GetSupportedSuites(BMessage* data);

	// Message filters (also see BHandler).
	virtual	void			AddCommonFilter(BMessageFilter* filter);
	virtual	bool			RemoveCommonFilter(BMessageFilter* filter);
	virtual	void			SetCommonFilterList(BList* filters);
			BList*			CommonFilterList() const;
};
