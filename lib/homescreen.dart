import 'package:cubit_notesapp_with_list/adddata.dart';
import 'package:cubit_notesapp_with_list/notes_cubit.dart';
import 'package:cubit_notesapp_with_list/notesstate.dart';
import 'package:cubit_notesapp_with_list/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var titlecontroller=TextEditingController();
  var desccontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotesAppwithlistcubit'),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit,NotesState>(builder: (context,state){
        return ListView.builder(itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              showModalBottomSheet(context: context,
                  builder: (BuildContext context){
                return Container(
                  height: 400,
                  width: 320,
                  child: Column(
                    children: [
                      Uihelper.CustomTextfield(titlecontroller, "Update title", Icons.update),
                      Uihelper.CustomTextfield(desccontroller, "Update desc", Icons.update),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        context.read<NotesCubit>().updateData({"title":titlecontroller.text.toString(),"desc":desccontroller.text.toString()}
                            , index);
                      }, child: Text("Update data"))
                    ],
                  ),
                );
                  });
            },
            child: ListTile(
              title: Text("${state.arrNotes[index]['title']}"),
              subtitle: Text("${state.arrNotes[index]["desc"]}"),
              trailing: IconButton(onPressed: (){
                context.read<NotesCubit>().delData(index);
              },
                  icon: Icon(Icons.delete)),
            ),
          );
        },itemCount:state.arrNotes.length ,);
      },),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Adddata()));
      },child: Icon(Icons.add),),
    );
  }
}
