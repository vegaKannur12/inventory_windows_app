import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';

class CommonPopup {
  Future showDialogueBox(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select'),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ))
              ],
            ),
            content: Consumer<Controller>(
              builder: (context, value, child) => Container(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.prodcutList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<Controller>(context, listen: false)
                            .setProductRow( value.prodcutList[index]);
                        Navigator.pop(context);
                      },
                      child: Card(
                        color: Colors.grey[100],
                        elevation: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  value.prodcutList[index]
                                                      ["image"])),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Expanded(
                                        // flex: 1,
                                        // fit: FlexFit.tight,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                text: value.prodcutList[index]
                                                        ["item"]
                                                    .toString()
                                                    .toUpperCase(),
                                                // text:
                                                //     "sjfjsfbjzfn znjfjzf fznfzjfbdf jhsfbjhfbdf fbjhfb fffff",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.grey[800]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rate : ",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey[700]),
                                                ),
                                                Text(
                                                  value.prodcutList[index]
                                                      ["rate"],
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey[600],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Container(
                                      //   height: size.height*0.05,
                                      //   width: size.width*0.05,

                                      //   child: FloatingActionButton.small(

                                      //     backgroundColor: Colors.orange,
                                      //     onPressed: () {},
                                      //     child: Icon(Icons.add,size: 16,),
                                      //   ),
                                      // )
                                      // Container(
                                      //     margin: const EdgeInsets.symmetric(
                                      //         horizontal: 9,vertical: 10),
                                      //     // width: size.width * 0.068,
                                      //     child: Center(
                                      //       child: ElevatedButton(
                                      //         onPressed: () {
                                      //           // ProductDetailsSheet sheet=ProductDetailsSheet();
                                      //           // sheet.showBottomSheet(context,value.productList[index],size,index);
                                      //         },
                                      //         child: Center(
                                      //           child: Text(
                                      //             '+',
                                      //             style: TextStyle(
                                      //                 fontSize: 19,
                                      //                 fontWeight: FontWeight.bold),
                                      //           ),
                                      //         ),
                                      //         style: ElevatedButton.styleFrom(
                                      //           backgroundColor: Colors.orange,
                                      //           shape: const CircleBorder(),
                                      //           padding: const EdgeInsets.all(2),
                                      //         ),
                                      //       ),
                                      //     ))
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
