import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/controller/notecontroller.dart';
import 'package:noteapp/model/notemodel.dart';
import 'package:noteapp/utils/color_consants.dart';
import 'package:noteapp/view/widgets/CustomContainer/CustomContainer.dart';



class NoteHome extends StatefulWidget {
  const NoteHome({super.key});
  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  var box = Hive.box<NoteModel>("notebox");
   int selectedIndex=0;
   final titleController = TextEditingController();
   final descriptionController = TextEditingController();
   final _dateController = TextEditingController();
   NoteController notecontrol = NoteController();

  // String dropdownvalue = 'Item 1';
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];
  // DateTime selectedDate = DateTime.now();
  // List<String> month=[
  //   "Jan",
  //   "Feb",
  //   "March",
  //   "April",
  //   "May",
  //   "June",
  //   "July",
  //   "August",
  //   "September",
  //   "October",
  //   "November",
  //   "December"
  // ];
  Future<void> _selectDate (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    // Load data when the home page is initialized
    notecontrol.loadNotes();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        title: Text("Notee",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
            preferredSize:Size.fromHeight(50) , child:Container(
          child: SearchBar(
            backgroundColor: MaterialStatePropertyAll(Colors.black12),
            leading:Icon(Icons.search,size:24,color:Colors.white,),
            hintText: "Search title..",
            hintStyle:MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            // shadowColor: MaterialStatePropertyAll(Colors.grey[50])

          ),
        ),
        ),
      ),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
           itemCount:notecontrol.details.length,
            itemBuilder:(BuildContext context, int index){
          return CustomContainer(
            tit: notecontrol.details[index].title ?? "",
             datte: notecontrol.details[index].date ?? "",
            desc: notecontrol.details[index].description ?? "",
            // selectedIndex: selectedIndex,
          );
        }),
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.red,
        splashColor:Colors.black ,
        onPressed: ()=>ShowBottom(context),
        child: Icon(Icons.add,size: 25,color: Colors.white,),),

    );
  }

 Future<void> ShowBottom(context) async{
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
        return SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration:BoxDecoration(
              color: Colors.black,
              border: Border.all(color:Colors.grey)

            ),
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hoverColor: Colors.white,
                    hintText: "Title",
                    hintStyle:TextStyle(fontSize:18,
                    fontWeight: FontWeight.bold,color: Colors.white),
                    labelText: "Title",
                    labelStyle:TextStyle(fontSize:18,
                      fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),

                SizedBox(height: 40,),

                TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hoverColor: Colors.white,
                    hintText: "Description",
                    hintStyle:TextStyle(fontSize:18,
                        fontWeight: FontWeight.bold,color: Colors.white),
                    labelText: "Description",
                    labelStyle:TextStyle(fontSize:18,
                        fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                SizedBox(height: 40 ,),


                // Row(
                //   children: [
                //     Text("Add Category",
                //       style: TextStyle(
                //           fontSize:18,
                //           fontWeight: FontWeight.bold,color: Colors.white),),
                //     SizedBox(width: 10,),
                //     DropdownButton(
                //       // Initial Value
                //       value: dropdownvalue,
                //
                //       // Down Arrow Icon
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //
                //       // Array list of items
                //       items: items.map((String items) {
                //         return DropdownMenuItem(
                //           value: items,
                //           child: Text(items),
                //         );
                //       }).toList(),
                //       // After selecting the desired option,it will
                //       // change button value to selected value
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           dropdownvalue = newValue!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
          //
                TextFormField(
                  controller: _dateController,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hoverColor: Colors.white,
                    hintText: "Date",
                    hintStyle:TextStyle(fontSize:18,
                        fontWeight: FontWeight.bold,color: Colors.white),
                    labelText: "Date",
                    labelStyle:TextStyle(fontSize:18,
                        fontWeight: FontWeight.bold,color: Colors.white),
                      suffixIcon: IconButton(onPressed: (){
                        _selectDate(context);
                      },
                          icon: Icon(Icons.calendar_month,size: 24,color:Colors.white,))
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  height:50,
                  child: ListView.builder(
                      itemCount: ColorConstant.mycolorList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color:selectedIndex == index?
                                      ColorConstant.mycolorListDart[index]
                                          :Colors.transparent
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  color: ColorConstant.mycolorList[index]
                              ),

                            ),
                          ),
                          onTap:(){
                            setState(() {
                              selectedIndex = index;
                            });
                            print(selectedIndex);
                          },
                        );
                      }),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){
                      box.add(NoteModel(
                          title: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          date: _dateController.text.trim(),
                          colors: selectedIndex));

                      titleController.clear();
                      descriptionController.clear();
                      _dateController.clear();

                        Navigator.pop(context);

                      setState(() {
                      });
                    }, child: Text("Save")),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel"))
                  ],
                )



              ],
            ),
          ),
        ),
      );
    });
 }
}
