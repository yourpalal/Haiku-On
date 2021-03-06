%import Archivable.i


%{
#include <LayoutItem.h>
%}


class BLayoutItem : public BArchivable {
public:
								BLayoutItem();
	virtual						~BLayoutItem();

			BLayout*			Layout() const;

	virtual	BSize				MinSize() = 0;
	virtual	BSize				MaxSize() = 0;
	virtual	BSize				PreferredSize() = 0;
	virtual	BAlignment			Alignment() = 0;

	virtual	void				SetExplicitMinSize(BSize size) = 0;
	virtual	void				SetExplicitMaxSize(BSize size) = 0;
	virtual	void				SetExplicitPreferredSize(BSize size) = 0;
	virtual	void				SetExplicitAlignment(BAlignment alignment) = 0;

	virtual	bool				IsVisible() = 0;
	virtual	void				SetVisible(bool visible) = 0;

	virtual	BRect				Frame() = 0;
	virtual	void				SetFrame(BRect frame) = 0;

	virtual	bool				HasHeightForWidth();
	virtual	void				GetHeightForWidth(float width, float* min,
									float* max, float* preferred);

	virtual	BView*				View();

	virtual	void				InvalidateLayout(bool children = false);
	virtual	void				Relayout(bool immediate = false);

			void*				LayoutData() const;
			void				SetLayoutData(void* data);

			void				AlignInFrame(BRect frame);
};

