import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final container = Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: isMe
          ? EdgeInsets.only(top: 7.0, bottom: 7.0, left: 80.0)
          : EdgeInsets.only(top: 7.0, bottom: 7.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0))
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            message.text,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );

    if (isMe) {
      return container;
    }
    return Row(
      children: [
        container,
        message.isLiked
            ? Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              )
            : IconButton(
                icon: Icon(Icons.favorite_border),
                iconSize: 30.0,
                color: Colors.blueGrey,
                onPressed: () {},
              )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.photo),
              color: Theme.of(context).primaryColor,
              onPressed: () {}),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration: InputDecoration.collapsed(hintText: "Tap a message"),
          )),
          IconButton(
              icon: Icon(Icons.send),
              color: Theme.of(context).primaryColor,
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    scrollDirection: Axis.vertical,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
