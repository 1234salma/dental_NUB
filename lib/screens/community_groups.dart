import 'package:flutter/material.dart';

class CommunityGroupsScreen extends StatelessWidget {
  const CommunityGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            Text('taghreed8859@NUB.edu.eg', style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [Icon(Icons.edit)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Messages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/community.png'),
                radius: 24,
              ),
              title: Text('Community Group'),
              subtitle: Text('32 new messages'),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                // Action لما يضغط على الجروب
              },
            ),
          ],
        ),
      ),
    );
  }
}
