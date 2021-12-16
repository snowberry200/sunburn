import 'package:flutter/material.dart';
import 'package:cooler/views/CreateToDo.dart';

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("final"),
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1544985361-b420d7a77043?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "My tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              Icon(Icons.menu),
              Icon(Icons.search),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(20),
                bottomRight: const Radius.circular(20)),
          ),
          child: ListView.separated(
            itemCount: (17),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.check_circle_outline, color: Colors.blue),
                title: Text("Plan a trip to Finland"),
                subtitle: Text("the family's trip"),
                trailing: Wrap(spacing: 20, children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.red,
                  ),
                  Text("Yesterday")
                ]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 20);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return createTodo();
              }),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
