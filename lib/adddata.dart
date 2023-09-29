import 'dart:developer';

import 'package:cubit_notesapp_with_list/notes_cubit.dart';
import 'package:cubit_notesapp_with_list/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  var titlecontroller=TextEditingController();
  var desccontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data page"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.CustomTextfield(titlecontroller, "Enter title", Icons.title),
          Uihelper.CustomTextfield(desccontroller, "Enter description", Icons.description),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            var title=titlecontroller.text.toString();
            var desc=desccontroller.text.toString();
            titlecontroller.clear();
            desccontroller.clear();

            if(title==""&& desc==""){
               showDialog(context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Enter required fields'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('ok'))
                      ],
                    );
                  });
            }
            else{
              context.read<NotesCubit>().addData({
                "title":title,
                "desc":desc,

              });
            }
          },
              child:Text('Add me',
                style: TextStyle(fontSize: 25),) )

        ],
      ),
    );
  }
}
