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
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 50),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 40),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 33),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 20),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 12),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 9),
    User(profilePicture: 'profile1.jpg', name: 'User 1', problemsSolved: 3),
    // Add more users as needed
  ];

  List<User> monthlyRanking = [
    User(profilePicture: 'profile2.jpg', name: 'User 2', problemsSolved: 75),
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
    return TabBarView(
      controller: _tabController,
      children: [
        _buildRankingList(weeklyRanking),
        _buildRankingList(monthlyRanking),
      ],
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
        subtitle: Text('Problems Solved: ${user.problemsSolved}'),
        // Add more details as needed
      );
    },
  );
}
