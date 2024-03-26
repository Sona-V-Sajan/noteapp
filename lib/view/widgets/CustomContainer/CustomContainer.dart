import 'package:flutter/material.dart';
import 'package:noteapp/controller/notecontroller.dart';
import 'package:noteapp/utils/color_consants.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key,required this.tit, required this.desc ,required this.datte,
     // required this.selectedIndex
     });
   final String tit;
   final String desc;
   final String datte;
   // final int selectedIndex;

   NoteController noteController = NoteController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
        decoration: BoxDecoration(
            // color: selectedIndex < ColorConstant.mycolorList.length
            // ? ColorConstant.mycolorList[selectedIndex]
            // : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, )
        ),
        child: Column(
          children: [
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tit,
                  style: TextStyle(
                    fontWeight:FontWeight.bold,fontSize:18,color: Colors.white
                ),),
                Text(datte,style: TextStyle(
                    fontWeight:FontWeight.bold,fontSize:18,color: Colors.white
                ),)
              ],
            ),
            SizedBox(height: 10,),
            Text(desc,
              maxLines: 2,overflow: TextOverflow.ellipsis

              ,style: TextStyle(fontSize:14,color: Colors.white),
              textAlign: TextAlign.justify,),
            SizedBox(height: 20,),

            // Align(alignment:Alignment.bottomLeft,
            //     child: Text("Category",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),

    );
  }
}
