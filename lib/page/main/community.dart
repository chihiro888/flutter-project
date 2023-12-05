import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  void initState() {
    super.initState();
    print('Community');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Change this to the number of posts you want to display
      itemBuilder: (context, index) {
        return buildPostCard();
      },
    );
  }
}

Widget buildPostCard() {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: CircleAvatar(
            // You can replace this with the user's profile image
            backgroundColor: Colors.blue,
            // child: Image.network('user_profile_url'),
          ),
          title: Text('Username'),
          subtitle: Text('Location'),
          trailing: Icon(Icons.more_vert),
        ),
        // Post Image
        Image.network(
          'https://placekitten.com/600/400', // Replace with the actual post image URL
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300.0,
        ),
        // Post Actions
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 8.0),
                  Text('Like'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment),
                  SizedBox(width: 8.0),
                  Text('Comment'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 8.0),
                  Text('Send'),
                ],
              ),
            ],
          ),
        ),
        // Post Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '123 likes', // Replace with the actual number of likes
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Post Caption
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Caption text goes here...', // Replace with the actual post caption
            style: TextStyle(),
          ),
        ),
        // View all comments
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Handle view all comments
            },
            child: Text(
              'View all comments',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        // Post Comments
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username1:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Comment 1'),
              Text('Username2:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Comment 2'),
              // Add more comments as needed
            ],
          ),
        ),
        // Post Time
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '2 hours ago', // Replace with the actual post time
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}
