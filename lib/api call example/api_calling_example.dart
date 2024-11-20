import 'package:advance_flutter_ch2/api%20call%20example/provider/user_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiCallingExample extends StatelessWidget {
  const ApiCallingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Calling Example'),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).secondaryHeaderColor,

      ),


      // BODY
      body: Consumer<UserApiProvider>(builder: (context, userProvider, child) => 
        ListView.builder(
          itemCount: userProvider.userList.length,
          itemBuilder: (context, index) => Card(
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.5),
            margin: const EdgeInsets.all(10),
            color: Theme.of(context).secondaryHeaderColor,
            child: ListTile(
              leading: Text(userProvider.userList[index].id.toString()),
              title: Text(userProvider.userList[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userProvider.userList[index].username),
                  Text(userProvider.userList[index].email),
                  Text(userProvider.userList[index].phone),
                  Text(userProvider.userList[index].website),
                ],
              ),
            ),
          ),
        ),),
    );
  }
}
