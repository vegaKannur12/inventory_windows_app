import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class ProductRow extends StatefulWidget {
  const ProductRow({super.key});

  @override
  State<ProductRow> createState() => _ProductRowState();
}

class _ProductRowState extends State<ProductRow> {
  double textFieldHeight = 30;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appbarHeight = AppBar().preferredSize.height;

    double con = size.height - (60 + 16 + appbarHeight + size.height * 0.07);
    return Consumer<Controller>(
        builder: (context, value, child) => value.itemSelected
            ? Container(
                height: con - 12,
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              // width: size.height * 0.1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      height: con - (24 + 12),
                                      width: size.width * 0.25,
                                      child: Image.asset(
                                        value.image.toString(),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    // child: SizedBox(
                                    //   height: size.height * .2,
                                    //   width: size.height * 1.7,
                                    //   child: FadeInImage(
                                    //     // width: imageActualWidth,
                                    //     placeholder:
                                    //         const AssetImage("assets/ajax_loader.gif"),
                                    //     fit: BoxFit.cover,
                                    //     image: AssetImage("assets/im1.jpeg"),
                                    //     // image: NetworkImage(
                                    //     //     value.prodcutList[index]["image"]),
                                    //   ),
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.015,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/item.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text("Item Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 22))),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                        text:
                                            "${value.item.toString().toUpperCase()}"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/bar-code.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Code",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  Text(
                                    "${value.code.toString()}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                                  Row(
                                children: [
                                  Image.asset(
                                    "assets/money.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Tax",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  Text(
                                    "\u{20B9}${value.tax.toString()}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/money.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Rate",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      text: "\u{20B9}${value.rate}",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                                Row(
                                children: [
                                  Image.asset(
                                    "assets/qty.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Qty",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  Container(
                                      width: size.width * 0.05,
                                      child: TextField(
                                        onTap: () => value.discper.selection =
                                            TextSelection(
                                                baseOffset: 0,
                                                extentOffset: value
                                                    .discper.value.text.length),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 8.0),
                                          isDense: true,
                                        ),
                                        controller: value.discper,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Image.asset(
                              //       "assets/qty.png",
                              //       height: size.height * 0.03,
                              //     ),
                              //     SizedBox(
                              //       width: size.width * 0.01,
                              //     ),
                              //     Container(
                              //         width: size.width * 0.1,
                              //         child: Text(
                              //           "Qty",
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.grey,
                              //               fontSize: 22),
                              //         )),
                              //     Container(
                              //         width: size.width * 0.01,
                              //         child: Text(":")),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.grey[300]

                              //           // border:
                              //           //     Border.all(color: Colors.blueAccent)
                              //           ),
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(8.0),
                              //         child: Text(
                              //           "-",
                              //           style: TextStyle(
                              //               fontSize: 22,
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.black),
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.only(
                              //           left: 8.0, right: 8),
                              //       child: Container(
                              //           width: size.width * 0.05,
                              //           child: TextField(
                              //             onTap: () => value.qty.selection =
                              //                 TextSelection(
                              //                     baseOffset: 0,
                              //                     extentOffset: value
                              //                         .qty.value.text.length),
                              //             decoration: InputDecoration(
                              //               contentPadding:
                              //                   EdgeInsets.only(bottom: 8.0),
                              //               isDense: true,
                              //             ),
                              //             textAlign: TextAlign.center,
                              //             controller: value.qty,
                              //             style: TextStyle(
                              //               fontSize: 22,
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.black,
                              //             ),
                              //           )),
                              //     ),
                              //     // Padding(
                              //     //   padding: const EdgeInsets.only(
                              //     //       left: 8.0, right: 8),
                              //     //   child: Text(
                              //     //     "8",
                              //     //     style: TextStyle(
                              //     //       fontSize:22,
                              //     //       fontWeight: FontWeight.bold,
                              //     //       color: Colors.black,
                              //     //     ),
                              //     //   ),
                              //     // ),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.grey[300]

                              //           // border:
                              //           //     Border.all(color: Colors.blueAccent)
                              //           ),
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(8.0),
                              //         child: Text(
                              //           "+",
                              //           style: TextStyle(
                              //               fontSize: 22,
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.black),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                             
                          
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/money.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Disc Per",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  Container(
                                      width: size.width * 0.05,
                                      child: TextField(
                                        onTap: () => value.discper.selection =
                                            TextSelection(
                                                baseOffset: 0,
                                                extentOffset: value
                                                    .discper.value.text.length),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 8.0),
                                          isDense: true,
                                        ),
                                        controller: value.discper,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/money.png",
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                      width: size.width * 0.1,
                                      child: Text(
                                        "Disc Amt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 22),
                                      )),
                                  Container(
                                      width: size.width * 0.01,
                                      child: Text(":")),
                                  Container(
                                      width: size.width * 0.05,
                                      child: TextField(
                                        onTap: () => value.discAmt.selection =
                                            TextSelection(
                                                baseOffset: 0,
                                                extentOffset: value
                                                    .discAmt.value.text.length),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 8.0),
                                          isDense: true,
                                        ),
                                        controller: value.discAmt,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 0.14,
                                    height: size.height * 0.05,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () {},
                                        label: Text(
                                          "ADD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        icon: Icon(Icons.add),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     CircleAvatar(
                        //       radius: 16,
                        //       child: Text(
                        //         "-",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //       backgroundColor: Colors.orange,
                        //     ),
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.only(left: 8.0, right: 8),
                        //       child: Text("8"),
                        //     ),
                        //     CircleAvatar(
                        //       radius: 16,
                        //       child: Text(
                        //         "+",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //       backgroundColor: Colors.orange,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: con - 12,
                width: double.infinity,
                child: Card(
                    elevation: 4,
                    child: Lottie.asset("assets/choose.json",
                        height: size.height * 0.2)),
              ));
  }
}
