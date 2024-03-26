// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController inputFieldController = TextEditingController();
  TextEditingController updateFieldController = TextEditingController();

  List<String> toDoList = [];
  bool isTextFieldopen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("TODO APP"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      color: Colors.grey,
                      height: 60,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                toDoList[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: TextField(
                                              controller: updateFieldController,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  150)),
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      )),
                                                  hintText: "update your Task"),
                                            ),
                                            title: const Text("Edit Task"),
                                            actions: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        toDoList[index] =
                                                            updateFieldController
                                                                .text;

                                                        Navigator.of(context)
                                                            .pop();
                                                        updateFieldController
                                                            .clear();
                                                        setState(() {});
                                                      },
                                                      child: const Text("Ok")),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        updateFieldController
                                                            .clear();
                                                        setState(() {});
                                                      },
                                                      child:
                                                          const Text("Cancel")),
                                                ],
                                              )
                                            ],
                                          );
                                        });

                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  color: const Color.fromARGB(255, 104, 15, 9),
                                  onPressed: () {
                                    toDoList.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () {
                    isTextFieldopen = !isTextFieldopen;
                    inputFieldController.clear();
                    setState(() {});
                    // print(toDoList);
                    // print(inputFieldController.text);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            Container(
                child: isTextFieldopen
                    ? Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: inputFieldController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(150)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  hintText: "write your Task"),
                            ),
                          ),
                          // ElevatedButton(
                          IconButton(
                              onPressed: () {
                                toDoList.add(inputFieldController.text);

                                // Navigator.of(context).pop();
                                updateFieldController.clear();
                                setState(() {});
                              },
                              icon: const Icon(Icons.add_task))
                        ],
                      )
                    : null),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
