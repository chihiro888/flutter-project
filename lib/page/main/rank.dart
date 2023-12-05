import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User {
  final String profilePicture;
  final String name;
  final int problemsSolved;

  User({
    required this.profilePicture,
    required this.name,
    required this.problemsSolved,
  });
}

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  _RankState createState() => _RankState();
}

class _RankState extends State<Rank> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<User> weeklyRanking = [
    User(
        profilePicture: 'assets/images/sample/user.jpg',
        name: '아이유',
        problemsSolved: 50),
    User(
        profilePicture: 'assets/images/sample/sample2.jpg',
        name: '윈터1',
        problemsSolved: 40),
    User(
        profilePicture: 'assets/images/sample/sample3.jpg',
        name: '윈터2',
        problemsSolved: 33),
    User(
        profilePicture: 'assets/images/sample/sample4.jpg',
        name: '카리나',
        problemsSolved: 20),
    User(
        profilePicture: 'assets/images/sample/sample5.jpg',
        name: '아마도닝닝',
        problemsSolved: 12),
    // Add more users as needed
  ];

  List<User> monthlyRanking = [
    User(
        profilePicture: 'assets/images/sample/sample5.jpg',
        name: '아마도닝닝',
        problemsSolved: 75),
    // Add more users as needed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    print('Rank');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: '주간 랭킹'),
          Tab(text: '월간 랭킹'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRankingList(weeklyRanking),
          _buildRankingList(monthlyRanking),
        ],
      ),
    );
  }
}

Widget _buildRankingList(List<User> ranking) {
  return ListView.builder(
    itemCount: ranking.length,
    itemBuilder: (context, index) {
      final user = ranking[index];
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(user.profilePicture),
        ),
        title: Text(user.name),
        subtitle: Text('푼 문제 수 : ${user.problemsSolved}'),
        // Add more details as needed
      );
    },
  );
}
