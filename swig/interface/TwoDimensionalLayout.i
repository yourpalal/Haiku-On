%import AbstractLayout.i

%{
#include <TwoDimensionalLayout.h>
%}


class BTwoDimensionalLayout : public BAbstractLayout {
public:
								BTwoDimensionalLayout();
	virtual						~BTwoDimensionalLayout();

			void				SetInsets(float left, float top, float right,
									float bottom);
			void				SetInsets(float horizontal, float vertical);
			void				SetInsets(float insets);
			void				GetInsets(float* left, float* top, float* right,
									float* bottom) const;

			void				AlignLayoutWith(BTwoDimensionalLayout* other,
									enum orientation orientation);

	virtual	BSize				BaseMinSize();
	virtual	BSize				BaseMaxSize();
	virtual	BSize				BasePreferredSize();
	virtual	BAlignment			BaseAlignment();

	virtual	bool				HasHeightForWidth();
	virtual	void				GetHeightForWidth(float width, float* min,
									float* max, float* preferred);

	virtual	void				SetFrame(BRect frame);
};
