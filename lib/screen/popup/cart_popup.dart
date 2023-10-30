import 'package:flutter/material.dart';
import 'package:inventorywindowsapp/controller/controller.dart';
import 'package:provider/provider.dart';

import 'item_delete_popup.dart';

class CartPopup {
  Future viewData(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    double appbarHeight = AppBar().preferredSize.height;
    double con = size.height - (appbarHeight + size.height * 0.08);
    // double con=300.00;
    double popupwidth = size.width * 0.9;
    double listvwwidth = popupwidth * 0.7;
    double summarywidth = popupwidth * 0.3;
    double imgWdth = listvwwidth * 0.1;
    double tileWidth = listvwwidth - 4;
    double tileHght = con * 0.21;

    print("con----${con}");

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //  backgroundColor: Colors.grey[200],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product Details'),
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
                width: popupwidth,
                height: con,
                color: Colors.grey[500],
                child: Row(
                  children: [
                    listviewWidget(listvwwidth, size, tileWidth, tileHght),
                    summaryWidget(summarywidth, size)
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget listviewWidget(
      double listvwwidth, Size size, double tileWidth, double tileHeight) {
    return Consumer<Controller>(
      builder: (context, value, child) => Container(
          alignment: Alignment.topLeft,
          // color: Colors.yellow,
          width: listvwwidth,
          child: ListView.builder(
            itemCount: value.cartProductList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                // height: tileHeight,
                child: Card(
                  // color: Colors.red,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: tileHeight,
                              width: tileWidth * 0.1,
                              child: Image.asset(
                                value.cartProductList[index]["image"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: tileWidth * 0.01,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            SizedBox(
                              height: tileHeight * 0.07,
                            ),
                            /////frst rowww///////////////////////////////////////////////////////

                            Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: tileWidth * 0.16,
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, bottom: 2),
                                          child: Text(
                                            value.cartProductList[index]
                                                ["code"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                        ))),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 250, 178, 69)),
                                      color: Colors.orange[200],
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      )),
                                  width: tileWidth * 0.5,
                                  // child: Text("hjhsha dsdbjsdd sdjbb dgdggdggdf dgdgd hgdgddg gggggg hhhhh wer",overflow: TextOverflow.ellipsis,),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, bottom: 2),
                                    child: Text(
                                      value.cartProductList[index]["item"]
                                          .toString()
                                          .toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        )),
                                    width: tileWidth * 0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0, bottom: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Tax % : ",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "${value.cartProductList[index]["tax_p"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),

                            ////2nd rowwww////////////////////////////////////////////////////
                            SizedBox(
                              height: tileHeight * 0.05,
                            ),
                            Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: tileWidth * 0.31,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.31) * 0.16,
                                            child: Text(
                                              "Rate",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            // width: (tileWidth * 0.31) * 0.8,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, bottom: 2),
                                              child: Text(
                                                "\u{20B9}${value.cartProductList[index]["rate"]}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: tileWidth * 0.28,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.28) * 0.12,
                                            child: Text(
                                              "Qty",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                            // width: (tileWidth * 0.25) * 0.6,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                )),
                                            child: TextField(
                                              onTap: () => value.cartQty[index]
                                                      .selection =
                                                  TextSelection(
                                                      baseOffset: 0,
                                                      extentOffset: value
                                                          .cartQty[index]
                                                          .value
                                                          .text
                                                          .length),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    bottom: 5.0, top: 5),
                                                isDense: true,
                                              ),
                                              textAlign: TextAlign.center,
                                              controller: value.cartQty[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                    width: tileWidth * 0.27,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.27) * 0.16,
                                            child: Text(
                                              "Gross",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                            // width: (tileWidth * 0.3) * 0.8,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, bottom: 2),
                                              child: Text(
                                                "\u{20B9}${value.cartProductList[index]["gross"]}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),

                            ///3rd rowww///////////////////////////////
                            SizedBox(
                              height: tileHeight * 0.05,
                            ),
                            Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    width: tileWidth * 0.31,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.31) * 0.16,
                                            child: Text(
                                              "Disc % ",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                              // width: (tileWidth * 0.31) * 0.8,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  )),
                                              child: TextField(
                                                onTap: () => value
                                                        .cartDisc_per[index]
                                                        .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset: value
                                                            .cartDisc_per[index]
                                                            .value
                                                            .text
                                                            .length),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 5.0, top: 5),
                                                  isDense: true,
                                                ),
                                                textAlign: TextAlign.center,
                                                controller:
                                                    value.cartDisc_per[index],
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              )),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: tileWidth * 0.28,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.28) * 0.23,
                                            child: Text(
                                              "Discount",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                              // width: (tileWidth * 0.3) * 0.72,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  )),
                                              child: TextField(
                                                onTap: () => value
                                                        .cartDisc_amt[index]
                                                        .selection =
                                                    TextSelection(
                                                        baseOffset: 0,
                                                        extentOffset: value
                                                            .cartDisc_amt[index]
                                                            .value
                                                            .text
                                                            .length),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 5.0, top: 5),
                                                  isDense: true,
                                                ),
                                                textAlign: TextAlign.center,
                                                controller:
                                                    value.cartDisc_amt[index],
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              )),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: tileWidth * 0.01,
                                ),
                                Container(
                                    width: tileWidth * 0.27,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: (tileWidth * 0.25) * 0.12,
                                            child: Text(
                                              "Tax",
                                              style: TextStyle(fontSize: 12),
                                            )),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.center,
                                              // width: (tileWidth * 0.25) * 0.8,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0, bottom: 2),
                                                child: Text(
                                                  value.cartProductList[index]
                                                      ["tax"],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ))
                              ],
                            ),

                            Divider(
                              height: 12,
                            ),
                            ////4th row///////////////////////////////////
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, bottom: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      DeletePopup popup = DeletePopup();
                                      popup.showDialogueBox(context,
                                          value.cartProductList[index]);
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Remove",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.close,
                                            size: 16,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Net Total : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "\u{20B9}${value.cartProductList[index]["net_total"]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget summaryWidget(double sumWidth, Size size) {
    return Container(
      width: sumWidth,
      child: Card(
        elevation: 4,
        // shape: RoundedRectangleBorder(
        //   // side: BorderSide(color: Colors.white70, width: 1),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: Column(
          children: [
            Container(
              height: size.height * 0.06,
              width: size.width * 0.3,
              alignment: Alignment.center,
              color: Colors.black,
              child: Text(
                "SUMMARY",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "\u{20B9}${20456} ",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Sub Total"),
            //     Text("\u{20B9}${20456} ")
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "\u{20B9}${20456} ",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "\u{20B9}${20456} ",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grand Total",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "\u{20B9}${20456} ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.34,
              color: Colors.deepOrange,
              alignment: Alignment.center,
              child: Text(
                "CONTINUE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
