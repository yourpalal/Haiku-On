%import View.i


%{
#include <StringView.h>
%}


class BStringView : public BView {
public:
								BStringView(BRect bounds, const char* name,
									const char* text, uint32 resizeFlags
										= B_FOLLOW_LEFT | B_FOLLOW_TOP,
									uint32 flags = B_WILL_DRAW);
								BStringView(const char* name, const char* text,
									uint32 flags = B_WILL_DRAW);
								BStringView(BMessage* archive);
	virtual 					~BStringView();

			void				SetText(const char* text);
			const char*			Text() const;
			void				SetAlignment(alignment flag);
			alignment			Alignment() const;

	virtual	void				AttachedToWindow();
	virtual	void				DetachedFromWindow();
	virtual	void				AllAttached();
	virtual	void				AllDetached();

	virtual	void				MakeFocus(bool state = true);

	virtual void				GetPreferredSize(float* _width,
									float* _height);
	virtual	BSize				MinSize();
	virtual	BSize				MaxSize();
	virtual	BSize				PreferredSize();
	virtual	void				ResizeToPreferred();
	virtual	void				FrameMoved(BPoint newPosition);
	virtual	void				FrameResized(float newWidth, float newHeight);

	virtual	void				Draw(BRect bounds);

	virtual	void				MessageReceived(BMessage* message);
	virtual	void				MouseDown(BPoint point);
	virtual	void				MouseUp(BPoint point);
	virtual	void				MouseMoved(BPoint point, uint32 transit,
									const BMessage* dragMessage);

	virtual	BHandler*			ResolveSpecifier(BMessage* message,
									int32 index, BMessage* specifier,
									int32 form, const char* property);
	virtual	status_t			GetSupportedSuites(BMessage* data);

	virtual	void				SetFont(const BFont* font,
									uint32 mask = B_FONT_ALL);
};

