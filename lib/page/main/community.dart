import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
        return PostCard();
      },
    );
  }
}

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _currentPage = 0;
  String gender = 'M';
  Color backgroundColor = Color(0xff787ff6);
  List<String> imageUrls = [
    'https://placekitten.com/600/400',
    'https://placekitten.com/601/400',
    'https://placekitten.com/602/400',
    // Add more URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set card color to white
      elevation: 0.0, // Set elevation to 0
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          InkWell(
            onTap: () {
              Get.toNamed('/personProfile');
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  'assets/images/sample/user.jpg',
                ),
              ),
              title: Row(
                children: <Widget>[
                  Text('안진용'),
                  SizedBox(width: 6.0, height: 0.0),
                  Container(
                    padding:
                        EdgeInsets.only(left: 6, right: 6, top: 1, bottom: 1),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(gender == 'M' ? Icons.male : Icons.female,
                            color: Colors.white, size: 12),
                        Text(
                          "30",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                '토익 300점 · 정답률 83%',
              ),
              trailing: GestureDetector(
                onTap: () {
                  // Handle the tap event on the trailing icon
                  print('Trailing icon tapped!');
                  // Add your logic or function call here
                },
                child: Icon(Icons.more_vert),
              ),
            ),
          ),
          // Post Image
          Container(
            height: 300.0, // Set a specific height
            child: PageView.builder(
              itemCount: imageUrls
                  .length, // Assuming imageUrls is a list of image URLs
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrls[
                      index], // Use the current index to get the URL from the list
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300.0,
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          SizedBox(width: 0.0, height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // 왼쪽에 위치할 요소 설정
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 16.0),
                    Icon(Icons.favorite_border),
                    SizedBox(width: 16.0),
                    Icon(Icons.mode_comment_outlined),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // 가운데에 위치할 요소 설정
                  child: DotsIndicator(
                    dotsCount: imageUrls.length,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      size: const Size.square(8.0),
                      activeSize: const Size(20.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 80, height: 0.0)
            ],
          ),
          // Post Likes
          SizedBox(width: 0.0, height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '좋아요 123 개', // Replace with the actual number of likes
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Post Content
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              '크리스마스 이브까지만 토익 800점 가즈아! 크리스마스 이브까지만 토익 800점 가즈아! ... 더 보기',
              style: TextStyle(color: Colors.black),
            ),
          ),
          // Post Caption
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              '댓글 4개 모두 보기', // Replace with the actual post caption
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Post Time
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              '2시간 전',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
