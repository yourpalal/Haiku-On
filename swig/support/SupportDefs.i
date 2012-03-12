
%{
#include <SupportDefs.h>
%}


/* fixed-size integer types */
typedef	__haiku_int8			int8;
typedef __haiku_uint8			uint8;
typedef	__haiku_int16			int16;
typedef __haiku_uint16			uint16;
typedef	__haiku_int32			int32;
typedef __haiku_uint32			uint32;
typedef	__haiku_int64			int64;
typedef __haiku_uint64			uint64;

typedef unsigned char			uchar;
typedef unsigned short          unichar;

/* descriptive types */
typedef int32					status_t;
typedef int64					bigtime_t;
typedef int64					nanotime_t;
typedef uint32					type_code;
typedef uint32					perform_code;


/* typemaps */
%apply unsigned int {__haiku_uint32, uint32, type_code, perform_code};
%apply int {__haiku_int32, int32, status_t};

%apply long long {__haiku_int64, int64};
