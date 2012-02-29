%{
#include <Size.h>
%}


%import SupportDefs.i

%immutable;
enum {
	B_SIZE_UNSET		= -2,
	B_SIZE_UNLIMITED	= 1024 * 1024 * 1024,
};
%mutable;


class BSize {
public:
			float				width;
			float				height;
	
								BSize();
								BSize(const BSize& other);
								BSize(float width, float height);

			float				Width() const;
			float				Height() const;

			void				Set(float width, float height);
			void				SetWidth(float width);
			void				SetHeight(float height);

			int32				IntegerWidth() const;
			int32				IntegerHeight() const;

			bool				IsWidthSet() const;
			bool				IsHeightSet() const;

	/*
			bool				operator==(const BSize& other) const;
			bool				operator!=(const BSize& other) const;

			BSize&				operator=(const BSize& other);
	*/
};
