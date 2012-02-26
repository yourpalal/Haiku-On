%feature("director") BApplication;


%{
#include <Application.h>
%}


%import Looper.i


class BApplication : public BLooper {
public:
								BApplication(const char* signature);
	virtual						~BApplication();

	status_t InitCheck() const;

	// App control and System Message handling
	virtual	thread_id			Run();
	virtual	void				Quit();
	virtual bool				QuitRequested();
	virtual	void				Pulse();
	virtual	void				ReadyToRun();
	virtual	void				MessageReceived(BMessage* message);
	virtual	void				ArgvReceived(int32 argc, char** argv);
	virtual	void				AppActivated(bool active);
	virtual	void				RefsReceived(BMessage* message);
	virtual	void				AboutRequested();

	// Scripting
	/*
	virtual BHandler*			ResolveSpecifier(BMessage* message, int32 index,
									BMessage* specifier, int32 form,
									const char* property);
	*/

	// Cursor control, window/looper list, and app info
			void				ShowCursor();
			void				HideCursor();
			void				ObscureCursor();
			bool				IsCursorHidden() const;
/*
			void				SetCursor(const void* cursor);
			void				SetCursor(const BCursor* cursor,
									bool sync = true);
*/

			int32				CountWindows() const;
			BWindow*			WindowAt(int32 index) const;

			int32				CountLoopers() const;
			BLooper*			LooperAt(int32 index) const;
			bool				IsLaunching() const;
			status_t			GetAppInfo(app_info* info) const;
/*
	static	BResources*			AppResources();
*/

	virtual	void				DispatchMessage(BMessage* message,
									BHandler* handler);
			void				SetPulseRate(bigtime_t rate);

	/*
	// More scripting
	virtual status_t			GetSupportedSuites(BMessage* data);
	*/
};

%immutable;
extern BApplication* be_app;
extern BMessenger be_app_messenger;
%mutable;
