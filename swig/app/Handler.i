%feature ("director") BHandler;


%{
#include <Handler.h>
%}


#define B_OBSERVE_WHAT_CHANGE "be:observe_change_what"
#define B_OBSERVE_ORIGINAL_WHAT "be:observe_orig_what"
const uint32 B_OBSERVER_OBSERVE_ALL = 0xffffffff;


class BHandler {
public:
							BHandler(const char* name = NULL);
	virtual					~BHandler();

	// BHandler guts.
	virtual	void			MessageReceived(BMessage* message);
			BLooper*		Looper() const;
			void			SetName(const char* name);
			const char*		Name() const;
	virtual	void			SetNextHandler(BHandler* handler);
			BHandler*		NextHandler() const;

	// Message filtering
	virtual	void			AddFilter(BMessageFilter* filter);
	virtual	bool			RemoveFilter(BMessageFilter* filter);
	virtual	void			SetFilterList(BList* filters);
			BList*			FilterList();

			bool			LockLooper();
			status_t		LockLooperWithTimeout(bigtime_t timeout);
			void			UnlockLooper();

	// Scripting
	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual status_t		GetSupportedSuites(BMessage* data);

	// Observer calls, inter-looper and inter-team
			status_t		StartWatching(BMessenger target, uint32 what);
			status_t		StartWatchingAll(BMessenger target);
			status_t		StopWatching(BMessenger target, uint32 what);
			status_t		StopWatchingAll(BMessenger target);

	// Observer calls for observing targets in the local team
			status_t		StartWatching(BHandler* observer, uint32 what);
			status_t		StartWatchingAll(BHandler* observer);
			status_t		StopWatching(BHandler* observer, uint32 what);
			status_t		StopWatchingAll(BHandler* observer);


	// Notifier calls
	virtual	void 			SendNotices(uint32 what,
								const BMessage* notice = NULL);
			bool			IsWatched() const;
};
