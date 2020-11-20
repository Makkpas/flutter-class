import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}


// Esta clase es el cascaron
class ToDoApp extends StatelessWidget{

  // Este método obligatorio y es el que se ejecuta primero
  @override
  Widget build(BuildContext context) {
	  return MaterialApp(
		  theme: ThemeData.dark(),
		  title: 'TODO App',
		  home: ToDoList(),
      debugShowCheckedModeBanner: false,
	  );
  }
}

//Esta clase es para manejar estados
class ToDoList extends StatefulWidget{

  //Este metodo es obligatorio en las stateful widgets
	@override
 	createState() => _ToDoListState();
}


//Esta clase maneja el estado
class _ToDoListState extends State<ToDoList>{
	List<String> _todoItems = [
    // "Hacer el proyecto de servidores",
    // "Hacer el lab",
  ];

	Widget  _buildToDoList(){
		if(_todoItems.length > 0){
      return ListView.builder(itemBuilder: (context, index){
          if(index < _todoItems.length){
            return _buildTodoItem(_todoItems[index], index);
          }
           return null; 
        },
      );
    }

    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image(
                    image:AssetImage('images/Instagram_Post.png'), 
                ),
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            Center(
              child: Text('Ya es todo wey!!', 
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
	}

  Widget _buildTodoItem(String todo, int index){
    return Container(
      child: ListTile(
        title: Text(todo), 
        onTap: () {
          print('element: $index');
        },
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFCCCCCCC),
            )
          )
      ),
    );
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
			  onPressed: _pushAddTodoScreen,
		  ),
	  );
  }


  void _pushAddTodoScreen(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text('Add new ToDo'),
          ),
          body: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter something to do...',
                contentPadding: EdgeInsets.all(16.0),
            ),
            onSubmitted: (val){
              if (val.length > 0){
                _addTodoItem(val);
                Navigator.pop(context);
              }
            },
          ),
        );
      },
    ));
  }

  void _addTodoItem(String todo){
    setState(() {
      _todoItems.add(todo);
    });
  }
}