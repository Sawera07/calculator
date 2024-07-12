import 'package:flutter/material.dart';
import 'package:todoapp/todolist.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  final _controller = TextEditingController();
  List todo = [
    ['Learn flutter', false],
    ['Drink water', false],
  ];
  void checkboxchanged(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  void saveNewtask() {
    setState(() {
      todo.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(90, 135, 125, 1),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Your Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: const Color.fromRGBO(39, 58, 54, 1),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, index) {
            return Todolist(
              taskname: todo[index][0],
              taskcompleted: todo[index][1],
              onChanged: (value) {
                checkboxchanged(index);
              },
              deleteFunction: (contex) {
                deleteTask(index);
              },
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Add todo new task',
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color.fromRGBO(39, 58, 54, 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewtask,
            backgroundColor: const Color.fromRGBO(39, 58, 54, 1),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
