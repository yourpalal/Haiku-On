%module(directors="1") haiku


%include "enums.swg"

#ifdef SWIGJAVA
	%insert ("runtime") %{
		#define SWIG_JAVA_NO_DETACH_CURRENT_THREAD
	%}

	#define BEGIN_ENUMS %javaconst(1);
	#define END_ENUMS %javaconst(0);
#endif


/* NOTE: Unfortunately, order seems to be important here in making the
 * generated java files actually build. I have no clue why this is, but
 * it's worth writing down.
 */


// need int types & typemaps to be in scope
%include support/SupportDefs.i

%include app/Message.i
%include app/MessageQueue.i
%include app/Messenger.i
%include app/MessageRunner.i

%include support/Archivable.i

%include app/Handler.i
%include app/Looper.i
%include app/Cursor.i
%include app/Application.i

%include app/AppDefs.i
 
%include interface/InterfaceDefs.i

%include interface/Alignment.i
%include interface/Point.i
%include interface/Size.i
%include interface/Rect.i

%include interface/LayoutItem.i
%include interface/Layout.i
%include interface/AbstractLayout.i
%include interface/TwoDimensionalLayout.i
%include interface/GroupLayout.i
%include interface/View.i
%include interface/Control.i
%include interface/Button.i

%include interface/StringView.i
%include interface/Window.i
