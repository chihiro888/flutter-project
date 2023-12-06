import 'package:flutter/material.dart';
import 'package:sample/component/appBarAddFeed.dart';

class AddFeed extends StatefulWidget {
  const AddFeed({Key? key}) : super(key: key);

  @override
  _AddFeedState createState() => _AddFeedState();
}

class _AddFeedState extends State<AddFeed> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddFeed(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Text area
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                maxLines: 4, // Adjust as needed
                decoration: InputDecoration(
                  hintText: 'Type your feed here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Box for adding pictures
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 200, // Adjust as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text('Add Pictures'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
