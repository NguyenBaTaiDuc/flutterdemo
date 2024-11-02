import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Student.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // inplement object
   final List<Student> student = [
    Student(name: 'duc', isDone: false),
    Student(name: 'toan', isDone: false),
    Student(name: 'hau', isDone: true),
    Student(name: 'kien', isDone: false),
  ];
  // fuction add
  void _addstudent (String name){
    student.add(Student(name: name));
  }
  //function remove
  void _removestudent (int id){
    setState(() {
      student.removeAt(id);
    });
  }
  void _toggle (int id){
    setState(() {
      student[id].isDone = !student[id].isDone;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      //create ListView
      body: ListView.builder(
          itemCount: student.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(
                student[index].name,
                style: TextStyle(
                  decoration: student[index].isDone? TextDecoration.lineThrough: TextDecoration.none,
                ),
              ),
              //button delete
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => {
                  _toggle(index),
                },
              ),

            );
          }),
      //button add
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
