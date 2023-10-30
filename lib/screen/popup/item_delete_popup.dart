import 'package:flutter/material.dart';

class DeletePopup {
  Future showDialogueBox(BuildContext context, Map map) {
    print("hjh----$map");
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     // Text('Select'),
            //     InkWell(
            //         onTap: () {
            //           Navigator.pop(context);
            //         },
            //         child: Icon(
            //           Icons.close,
            //           color: Colors.red,
            //         ))
            //   ],
            // ),
            content: Row(
              children: [
                Text(
                  "Do You Want to Delete",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  ' ${map["item"]}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(" ? ")
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
}
