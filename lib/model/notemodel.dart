import 'package:hive/hive.dart';
part 'notemodel.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  // @HiveField(2)
  // String? category;
  @HiveField(3)
  String? date;
  @HiveField(4)
  int? colors;

  NoteModel({
    required title,
    required description,
    // required category,
    required date,
    required colors,
  });
}
