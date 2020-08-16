import 'package:message_app/modules/users.dart';
// Messages struct
class Messages {

  final User sender;
  final String time;
  final String text;
  final bool isRead;
  final bool isLiked;

  Messages(this.sender, this.text, this.time, this.isRead, this.isLiked);

}
// Users
final User amy = User(0,'Amy','assets/amy.jpg');
final User chin = User(1,'Chin','assets/chin.jpg');
final User frank = User(2,'Frank','assets/frank.jpg');
final User john = User(3,'John','assets/john.jpg');
final User mike = User(4,'Mike','assets/mike.jpg');
final User minu = User(5,'Minu','assets/minu.jpg');
final User oliva = User(6,'Oliva','assets/oliva.jpg');
final User me = User(7,'Greg','assets/greg.jpg');

// Favourite users
List <User> favouriteUsers = [amy, chin, frank, john, mike, minu, oliva];


// Recent chat
List <Messages> recentchat = [

  Messages(oliva,'Call me when you\'re on','6:03 PM', false, false),
  Messages(mike,'You there now?','5:30 PM', true, true),
  Messages(john,'Yeah, mee too','2:00 PM', false, false),
  Messages(chin,':( Sad about the loss','1:35 PM', false, true),
  Messages(frank,'Amazing! Did you watch Barcelona VS Bayren?','1:34 PM', true, false),
  Messages(chin,'I\'m doing good, how did you do with the deal?','1:32 PM', true, true),
  Messages(amy,'Hey! how are you doing?','1:30 PM', false, false),









];

// chat

List <Messages> chat = [
  Messages(oliva,'Call me when you\'re on','6:03 PM', false, false),
  Messages(mike,'You there now?','5:30 PM', true, true),
  Messages(john,'Yeah, mee too','2:00 PM', false, false),
  Messages(me,'I am sad because of Messi','1:37 PM', false, false),
  Messages(chin,':( Sad about the loss','1:35 PM', false, true),
  Messages(me,'ha ha ha ha','1:34 PM', true, false),
  Messages(frank,'Amazing! Did you watch Barcelona VS Bayren?','1:34 PM', true, false),
  Messages(me,'Excellent! Everything went really good','1:32 PM', false, false),
  Messages(chin,'I\'m doing good, how did you do with the deal?','1:32 PM', true, true),
  Messages(me,'Fine! How about you?','1:31 PM', false, false),
  Messages(amy,'Hey! how are you doing?','1:30 PM', false, false),
];