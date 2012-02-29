%{
#include <Alignment.h>
%}


%import InterfaceDefs.i


class BAlignment {
public:
			alignment			horizontal;
			vertical_alignment	vertical;

	inline						BAlignment();
	inline						BAlignment(const BAlignment& other);
	inline						BAlignment(alignment horizontal,
									vertical_alignment vertical);

	inline	alignment			Horizontal() const;
	inline	vertical_alignment	Vertical() const;

			float				RelativeHorizontal() const;
			float				RelativeVertical() const;

	inline	void				SetHorizontal(alignment horizontal);
	inline	void				SetVertical(vertical_alignment vertical);

	inline	bool				IsHorizontalSet() const;
	inline	bool				IsVerticalSet() const;

	/*
	inline	bool				operator==(const BAlignment& other) const;
	inline	bool				operator!=(const BAlignment& other) const;

	inline	BAlignment&			operator=(const BAlignment& other);
	*/
};
