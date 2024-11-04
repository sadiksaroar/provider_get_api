import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_get_api/main.dart';
import 'package:provider_get_api/provider/user_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().fetcPost();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
        "Get Api Calling",
      ))),
      body: SafeArea(
          child: userProvider.isLoading == true
              ? const Center(
                  child: CircleAvatar(),
                )
              : ListView.builder(
                  itemBuilder: (context, itemIndex) {
                    return ListTile(
                      leading: Text(
                          userProvider.allUserList[itemIndex].id.toString()),
                      title: Text(
                          userProvider.allUserList[itemIndex].name.toString()),
                      subtitle: Text(
                          userProvider.allUserList[itemIndex].email.toString()),
                    );
                  },
                  itemCount: userProvider.allUserList.length,
                )),
    );
  }
}
