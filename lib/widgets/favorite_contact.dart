import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/screens/ChatScreen.dart';
import "package:flutter/material.dart";

class FavoriteContact extends StatefulWidget {
  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<FavoriteContact> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorite Contacts",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.blueGrey,
                    ),
                    iconSize: 30.0,
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChatScreen(user: favorites[index]);
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
