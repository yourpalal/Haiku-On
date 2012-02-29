%{
#include <GroupLayout.h>
%}


%import TwoDimensionalLayout.i


%feature ("notabstract") BGroupLayout;


class BGroupLayout : public BTwoDimensionalLayout {
public:
								BGroupLayout(enum orientation orientation,
									float spacing = B_USE_DEFAULT_SPACING);
								BGroupLayout(BMessage* from);
	virtual						~BGroupLayout();

			float				Spacing() const;
			void				SetSpacing(float spacing);

			orientation			Orientation() const;
			void				SetOrientation(enum orientation orientation);
	
			float				ItemWeight(int32 index) const;
			void				SetItemWeight(int32 index, float weight);

	virtual	BLayoutItem*		AddView(BView* child);
	virtual	BLayoutItem*		AddView(int32 index, BView* child);
	virtual	BLayoutItem*		AddView(BView* child, float weight);
	virtual	BLayoutItem*		AddView(int32 index, BView* child,
									float weight);

	virtual	bool				AddItem(BLayoutItem* item);
	virtual	bool				AddItem(int32 index, BLayoutItem* item);
	virtual	bool				AddItem(BLayoutItem* item, float weight);
	virtual	bool				AddItem(int32 index, BLayoutItem* item,
									float weight);
};
