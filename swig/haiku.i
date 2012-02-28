%module(directors="1") haiku

#ifdef SWIGJAVA
	%insert ("runtime") %{
		#define SWIG_JAVA_NO_DETACH_CURRENT_THREAD
	%}
#endif

%include app/Message.i
%include app/Messenger.i

%include app/Handler.i
%include app/Looper.i
%include app/Application.i

%include support/SupportDefs.i
