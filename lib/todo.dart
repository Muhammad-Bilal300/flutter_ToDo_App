import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = '';
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              // padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              height: 50,
              color: Colors.grey[300],
              child: ListTile(
                leading: Text("${index + 1}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                title: Text(
                  "${lst[index]}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Container(
                  width: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Edit Todo"),
                                  content: TextField(
                                    onChanged: (value) {
                                      output = value;
                                    },
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(output);
                            output = '';
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
