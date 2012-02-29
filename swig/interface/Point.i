%{
#include <Point.h>
%}


class BPoint {
public:
			float				x;
			float				y;

								BPoint();
								BPoint(float x, float y);
								BPoint(const BPoint& p);
		
			// BPoint&				operator=(const BPoint& other);
			void				Set(float x, float y);

			void				ConstrainTo(BRect rect);
			void				PrintToStream() const;
			
			/*
			BPoint				operator-() const;
			BPoint				operator+(const BPoint& other) const;
			BPoint				operator-(const BPoint& other) const;
			BPoint&				operator+=(const BPoint& other);
			BPoint&				operator-=(const BPoint& other);

			bool				operator!=(const BPoint& other) const;
			bool				operator==(const BPoint& other) const;
			*/
};
