import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget{

  Widget build(BuildContext context) {
	  return MaterialApp(
		  theme: ThemeData.dark(),
		  title: 'TODO App',
		  home: ToDoList(),
	  );
  }
}

class ToDoList extends StatefulWidget{
	@override
 	createState() => _ToDoListState();
}


class _ToDoListState extends State<ToDoList>{

	List<String> _todoItems = [];

	Widget  _buildToDoList(){
		return Container();
	}

	@override
	Widget build(BuildContext context) {
	  return Scaffold(
		  appBar: AppBar(title: Text('ToDo App')),
		  body: _buildToDoList(),
		  floatingActionButton: FloatingActionButton(
			  tooltip: 'Add Item',
			  child: Icon(
				  Icons.add,
			  ),
			  onPressed: (){
				  print('pressed');
			  },
		  ),
	  );
	}
}