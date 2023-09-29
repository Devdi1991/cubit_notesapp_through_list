import 'package:cubit_notesapp_with_list/notesstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NotesState(arrNotes: []));




  void addData(Map<String,dynamic>data){
    var listData=state.arrNotes;
    listData.add(data);
    emit(NotesState(arrNotes: state.arrNotes));

  }
  void delData(int index){
    var listdata=state.arrNotes;
    listdata.removeAt(index);
    emit(NotesState(arrNotes: state.arrNotes));
  }
  void updateData(Map<String,dynamic>data,int index){
    var listData=state.arrNotes;
    listData[index]=data;
    emit(NotesState(arrNotes: state.arrNotes));
  }


}