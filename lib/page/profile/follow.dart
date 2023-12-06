import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Follow extends StatefulWidget {
  const Follow({Key? key}) : super(key: key);

  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('안진용'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '팔로우'),
            Tab(text: '팔로잉'),
          ],
        ),
      ),
      body: SafeArea(
          child: Row(
        children: <Widget>[
          //
        ],
      )),
    );
  }
}
