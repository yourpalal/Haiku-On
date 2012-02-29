%{
#include <MessageQueue.h>
%}


class BMessageQueue {
	public:
		BMessageQueue();
		virtual ~BMessageQueue();

		void AddMessage(BMessage* message);
		void RemoveMessage(BMessage* message);

		int32 CountMessages() const;
		bool IsEmpty() const;

		BMessage* FindMessage(int32 index) const;
		BMessage* FindMessage(uint32 what, int32 index = 0) const;

		bool Lock();
		void Unlock();
		bool IsLocked() const;

		BMessage *NextMessage();
		bool IsNextMessage(const BMessage* message) const;
};
