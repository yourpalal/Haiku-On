%{
#include <Control.h>
%}


// %import Invoker.i
%import View.i


%immutable;
enum {
	B_CONTROL_OFF = 0,
	B_CONTROL_ON = 1
};
%mutable;


class BControl : public BView, public BInvoker {
public:
								BControl(BRect frame, const char* name,
									const char* label, BMessage* message,
									uint32 resizingMode, uint32 flags);
								BControl(const char* name, const char* label,
									BMessage* message, uint32 flags);
	virtual						~BControl();

	virtual	void				WindowActivated(bool active);

	virtual	void				AttachedToWindow();
	virtual	void				DetachedFromWindow();
	virtual	void				AllAttached();
	virtual	void				AllDetached();

	virtual	void				MessageReceived(BMessage* message);
	virtual	void				MakeFocus(bool focused = true);

	virtual	void				KeyDown(const char* bytes, int32 numBytes);
	virtual	void				MouseDown(BPoint point);
	virtual	void				MouseUp(BPoint point);
	virtual	void				MouseMoved(BPoint point, uint32 transit,
									const BMessage *message);

	virtual	void				SetLabel(const char* string);
			const char*			Label() const;

	virtual	void				SetValue(int32 value);
			int32				Value() const;

	virtual	void				SetEnabled(bool enabled);
			bool				IsEnabled() const;

	virtual	void				GetPreferredSize(float* _width,
									float* _height);
	virtual	void				ResizeToPreferred();

	virtual	status_t			Invoke(BMessage* message = NULL);
	virtual	BHandler*			ResolveSpecifier(BMessage* message,
									int32 index, BMessage* specifier,
									int32 what, const char* property);
	virtual	status_t			GetSupportedSuites(BMessage* message);

protected:
			bool				IsFocusChanging() const;
			bool				IsTracking() const;
			void				SetTracking(bool state);

			void				SetValueNoUpdate(int32 value);
};

