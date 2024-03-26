
import 'package:hive/hive.dart';
import 'package:noteapp/model/notemodel.dart';

class NoteController{
  List<NoteModel> details =[];
  var box = Hive.box<NoteModel>("notebox");


  void addNote(NoteModel newnote){
    details.add(newnote);
  }
  void loadNotes() {
    details = box.values.toList();
  }
}