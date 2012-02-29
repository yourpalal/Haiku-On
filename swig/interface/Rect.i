%{
#include <Rect.h>
%}


%include Point.i
%include Size.i


class BRect {
public:
			float				left;
			float				top;
			float				right;
			float				bottom;

								BRect();
								BRect(const BRect& other);
								BRect(float left, float top, float right,
									float bottom);
								BRect(BPoint leftTop, BPoint rightBottom);
								BRect(BPoint leftTop, BSize size);
								BRect(float side);

//			BRect&				operator=(const BRect& other);

			void				Set(float left, float top, float right,
									float bottom);

			void				PrintToStream() const;

			BPoint				LeftTop() const;
			BPoint				RightBottom() const;
			BPoint				LeftBottom() const;
			BPoint				RightTop() const;

			void				SetLeftTop(const BPoint leftTop);
			void				SetRightBottom(const BPoint rightBottom);
			void				SetLeftBottom(const BPoint leftBottom);
			void				SetRightTop(const BPoint rightTop);

	// Transformation
			void				InsetBy(BPoint inset);
			void				InsetBy(float dx, float dy);
			void				OffsetBy(BPoint delta);
			void				OffsetBy(float dx, float dy);
			void				OffsetTo(BPoint offset);
			void				OffsetTo(float x, float y);

	// Expression transformations
			BRect&				InsetBySelf(BPoint inset);
			BRect&				InsetBySelf(float dx, float dy);
			BRect				InsetByCopy(BPoint inset);
			BRect				InsetByCopy(float dx, float dy);
			BRect&				OffsetBySelf(BPoint offset);
			BRect&				OffsetBySelf(float dx, float dy);
			BRect				OffsetByCopy(BPoint offset);
			BRect				OffsetByCopy(float dx, float dy);
			BRect&				OffsetToSelf(BPoint offset);
			BRect&				OffsetToSelf(float dx, float dy);
			BRect				OffsetToCopy(BPoint offset);
			BRect				OffsetToCopy(float dx, float dy);

	/*
	// Comparison
			bool				operator==(BRect r) const;
			bool				operator!=(BRect r) const;

	// Intersection and union
			BRect				operator&(BRect r) const;
			BRect				operator|(BRect r) const;
	*/

			bool				IsValid() const;
			float				Width() const;
			int32				IntegerWidth() const;
			float				Height() const;
			int32				IntegerHeight() const;
			BSize				Size() const;

			bool				Intersects(BRect r) const;
			bool				Contains(BPoint p) const;
			bool				Contains(BRect r) const;
};

