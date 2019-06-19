import 'package:flutter/material.dart';
import 'package:flutter_sql/models/user.dart';
import 'package:flutter_sql/utils/DatabaseHelper.dart';

List _users;
void main() async {
  var db = DatabaseHelper();

//  int saveduser = await db.saveUser(User('Cola', 'bear'));
//
//  print('User saved $saveduser');

  int count = await db.getCount();
  print('Count: $count');

  User ana = await db.getUser(1);
  print('Got Username: ${ana.username}');
  User anaUpdated = User.fromMap(
      {'username': 'UpdatedAna', 'password': 'updatedPassword', 'id': 1});

  await db.updateUser(anaUpdated);
//  int userDeleted = await db.deleteUser(2);
//  print('Delete User: $userDeleted');

  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);

    print('Username: ${user.username}, User Id: ${user.id}');
  }

  runApp(MaterialApp(
    title: 'Database',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(User.fromMap(_users[position]).username[0]),
              ),
              title: Text('User: ${User.fromMap(_users[position]).username}'),
              subtitle: Text('Id: ${User.fromMap(_users[position]).id}'),
              onTap: () => print(User.fromMap(_users[position]).password),
            ),
          );
        },
      ),
    );
  }
}
