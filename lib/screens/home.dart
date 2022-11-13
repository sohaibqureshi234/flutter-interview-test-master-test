import 'package:flutter/material.dart';
import 'package:interview/data/user.dart';
import 'package:interview/data/mock_data.dart';

import 'widget/avatar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.title);

  String? title;

  var users = User.fromJsonToList(allData());
  var searchUser = <dynamic>[];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController;
    searchUser.addAll(users);
  }

  void filterSearchResults(String query) {
    List<dynamic> dummySearchList = <dynamic>[];
    dummySearchList.addAll(users);
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = <dynamic>[];
      dummySearchList.forEach((item) {
        if (item.firstName.toLowerCase().contains(query) ||
            item.lastName.toLowerCase().contains(query) ||
            item.role.toLowerCase().contains(query) ||
            item.email.toLowerCase().contains(query)) {
          dummyListData.add(item);
          print("$dummyListData{dummyListData}");
        }
      });
      setState(() {
        searchUser.clear();
        searchUser.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchUser.clear();
        searchUser.addAll(users);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("all data ${allData()}");
    print("title=${title}");
    print("user avatar");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!.toString()),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'Search...',),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: searchUser.length,
              itemBuilder: (context, index) {
                print(searchUser.length);
                final item = searchUser[index];
                final avatar = searchUser[index].avatar;

                return ListTile(
                  leading:userAvatar(useravatar: avatar),
                  title: Text(
                      "${item.firstName} ${item.lastName}"),
                  subtitle: Text(item.role.toString()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          users.add(User( id: "b32ec56c-21bb-4b7b-a3a0-635b8bca1f9d",
              avatar: null,
              firstName: "James",
              lastName: "May",
              email: "ssaull1c@tripod.com",
              role: "Developer"));
          var newUser = User(
              id: "b32ec56c-21bb-4b7b-a3a0-635b8bca1f9d",
              avatar: null,
              firstName: "James",
              lastName: "May",
              email: "ssaull1c@tripod.com",//cmt
              role: "Developer");
          print("userr Added");
          print(users.length);
        },

        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
