%{
#include <Button.h>
%}


%import View.i


class BButton : public BControl {
public:
								BButton(BRect frame, const char* name,
									const char* label, BMessage* message,
									uint32 resizingMode
										= B_FOLLOW_LEFT | B_FOLLOW_TOP,
									uint32 flags = B_WILL_DRAW | B_NAVIGABLE
										| B_FULL_UPDATE_ON_RESIZE); 
								BButton(const char* name, const char* label,
									BMessage *message,
									uint32 flags = B_WILL_DRAW | B_NAVIGABLE
										| B_FULL_UPDATE_ON_RESIZE);
								BButton(const char* label,
									BMessage* message = NULL);
	
	virtual						~BButton();

	virtual	void				Draw(BRect updateRect);
	virtual	void				MouseDown(BPoint point);
	virtual	void				AttachedToWindow();
	virtual	void				KeyDown(const char* bytes, int32 numBytes);
	virtual	void				MakeDefault(bool flag);
	virtual	void				SetLabel(const char* string);
			bool				IsDefault() const;

	virtual	void				MessageReceived(BMessage* message);
	virtual	void				WindowActivated(bool active);
	virtual	void				MouseMoved(BPoint point, uint32 transit,
									const BMessage* message);
	virtual	void				MouseUp(BPoint point);
	virtual	void				DetachedFromWindow();
	virtual	void				SetValue(int32 value);
	virtual	void				GetPreferredSize (float* _width,
									float* _height);
	virtual	void				ResizeToPreferred();
	virtual	status_t			Invoke(BMessage* message = NULL);
	virtual	void				FrameMoved(BPoint newLocation);
	virtual	void				FrameResized(float width, float height);

	virtual	void				MakeFocus(bool focused = true);
	virtual	void				AllAttached();
	virtual	void				AllDetached();
	
	virtual	BHandler*			ResolveSpecifier(BMessage* message,
									int32 index, BMessage* specifier,
									int32 what, const char* property);
	virtual	status_t			GetSupportedSuites(BMessage* message);
	virtual	status_t			Perform(perform_code d, void* arg);


	virtual	BSize				MinSize();
	virtual	BSize				MaxSize();
	virtual	BSize				PreferredSize();
};
