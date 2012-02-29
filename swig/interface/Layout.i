%import LayoutItem.i


%{
#include <Layout.h>
%}


class BLayout : public BLayoutItem {
public:
	virtual						~BLayout();

			BView*				Owner() const;
			BView*				TargetView() const;
	virtual	BView*				View(); // from BLayoutItem

	// methods dealing with items
	virtual	BLayoutItem*		AddView(BView* child);
	virtual	BLayoutItem*		AddView(int32 index, BView* child);

	virtual	bool				AddItem(BLayoutItem* item);
	virtual	bool				AddItem(int32 index, BLayoutItem* item);

	virtual	bool				RemoveView(BView* child);
	virtual	bool				RemoveItem(BLayoutItem* item);
	virtual	BLayoutItem*		RemoveItem(int32 index);

			BLayoutItem*		ItemAt(int32 index) const;
			int32				CountItems() const;
			int32				IndexOfItem(const BLayoutItem* item) const;
			int32				IndexOfView(BView* child) const;

			bool				AncestorsVisible() const;

	// Layouting related methods

	virtual	void				InvalidateLayout(bool children = false);
	virtual	void				Relayout(bool immediate = false);
									// from BLayoutItem
			void				RequireLayout();
			bool				IsValid();
			void				EnableLayoutInvalidation();
			void				DisableLayoutInvalidation();

			void				LayoutItems(bool force = false);
			BRect				LayoutArea();
			BLayoutContext*		LayoutContext() const;

protected:
	virtual	void				DoLayout() = 0;
};

