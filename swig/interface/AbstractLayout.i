%{
#include <AbstractLayout.h>
%}


%import interface/Layout.i
%import Alignment.i
%import Size.i


%feature ("abstract") BAbstractLayout;

class BAbstractLayout : public BLayout {
public:
	virtual						~BAbstractLayout();

	virtual	BSize				MinSize();
	virtual	BSize				MaxSize();
	virtual	BSize				PreferredSize();
	virtual	BAlignment			Alignment();

	virtual	void				SetExplicitMinSize(BSize size);
	virtual	void				SetExplicitMaxSize(BSize size);
	virtual	void				SetExplicitPreferredSize(BSize size);
	virtual	void				SetExplicitAlignment(BAlignment alignment);

	virtual	BSize				BaseMinSize();
	virtual	BSize				BaseMaxSize();
	virtual	BSize				BasePreferredSize();
	virtual	BAlignment			BaseAlignment();

	virtual BRect				Frame();
	virtual	void				SetFrame(BRect frame);	

	virtual	bool				IsVisible();
	virtual	void				SetVisible(bool visible);

protected:
	virtual	bool				ItemAdded(BLayoutItem* item, int32 atIndex);
	virtual	void				ItemRemoved(BLayoutItem* item, int32 fromIndex);
	virtual	void				LayoutInvalidated(bool children);
	virtual	void				OwnerChanged(BView* was);

	// BLayoutItem hook methods
	virtual	void				AttachedToLayout();
	virtual void				DetachedFromLayout(BLayout* layout);
	virtual	void				AncestorVisibilityChanged(bool shown);
};

