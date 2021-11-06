import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = '';
  var subTitle = '';
  List<dynamic> lst = [];
  List<dynamic> lst2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.white,
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        title: Center(
          child: Text(
            "ToDo App",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ], color: Colors.black, borderRadius: BorderRadius.circular(10)),
                // padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 75,
                // color: Color.fromRGBO(255, 255, 255, 0.5),
                child: ListTile(
                  leading: Text("${index + 1}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  title: Text(
                    "${lst[index]}",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "${lst2[index]}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  trailing: Container(
                    width: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Permission"),
                                    content: Text(
                                        "Are You sure you want to delete this ToDo?"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.removeAt(index);
                                              lst2.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Yes")),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {lst[index]});
                                              output = '';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("No")),
                                    ],
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Todo"),
                                    content: Container(
                                      height: 50,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black26),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: TextField(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                              output = '';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  // height: 400,
                  child: AlertDialog(
                    title: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Center(child: Text("Add Todo"))),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name:"),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 50,
                              // margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(color: Colors.black26),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  output = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Job Role:"),
                            Container(
                              height: 50,
                              // margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(color: Colors.black26),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  subTitle = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lst.add(output);
                              lst2.add(subTitle);
                              output = '';
                              subTitle = '';
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"))
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
