%module(directors="1") haiku


%include "enums.swg"

#ifdef SWIGJAVA
	%insert ("runtime") %{
		#define SWIG_JAVA_NO_DETACH_CURRENT_THREAD
	%}

	#define BEGIN_ENUMS %javaconst(1);
	#define END_ENUMS %javaconst(0);
#endif

%include app/Message.i
%include app/Messenger.i

%include app/Handler.i
%include app/Looper.i
%include app/Application.i

%include support/SupportDefs.i
