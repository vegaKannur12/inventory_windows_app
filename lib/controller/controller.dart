import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../components/common_data.dart';
import '../components/network_connectivity.dart';

class Controller extends ChangeNotifier {
  String? item;
  String? rate;
  String? tax;
  String? code;
  String? image;
  bool itemSelected = false;

  bool status = false;

  // TextEditingController item = TextEditingController();
  // TextEditingController rate = TextEditingController();
  // TextEditingController tax = TextEditingController();
  TextEditingController discAmt = TextEditingController();
  TextEditingController discper = TextEditingController();
  // TextEditingController code = TextEditingController();
  TextEditingController qty = TextEditingController();

  List<TextEditingController> cartQty = [];
  List<TextEditingController> cartDisc_amt = [];
  List<TextEditingController> cartDisc_per = [];

  List<Map<String, dynamic>> prodcutList = [];
  List<Map<String, dynamic>> cartProductList = [];

  // List<TextEditingController> qty = [];
  getProdcutList(
    BuildContext context,
  ) {
    print("dsdjsd");

    try {
      print("sfhjhsfzjf");

      prodcutList = [
        {
          "item": "item1",
          "code": "IT1234",
          "rate": "120.00",
          "tax": "21.8",
          "disc_amt": "0.00",
          "disc_per": "0",
          "image": "assets/im1.jpeg"
        },
        {
          "item": "item2",
          "code": "IT34",
          "rate": "420",
          "tax": "12.66",
          "disc_amt": "0.00",
          "disc_per": "0",
          "image": "assets/im2.jpeg"
        },
        {
          "item": "item3",
          "code": "IT888",
          "rate": "220",
          "tax": "8.99",
          "disc_amt": "0.00",
          "disc_per": "0",
          "image": "assets/im3.jpg"
        },
        {
          "item": "item4",
          "code": "IT098",
          "rate": "190",
          "tax": "5.99",
          "disc_amt": "0.00",
          "disc_per": "0",
          "image": "assets/im1.jpeg"
        },
        {
          "item": "item5",
          "code": "IT43",
          "rate": "1000",
          "tax": "34.00",
          "disc_amt": "0.00",
          "disc_per": "0",
          "image": "assets/im2.jpeg"
        },
      ];
      print("pro---$prodcutList");
      notifyListeners();
      // qty =
      //     List.generate(prodcutList.length, (index) => TextEditingController());
      // Uri url = Uri.parse("$apiurl/load_dmg_details.php");
    } catch (e) {
      print(e);
      // return null;
      return [];
    }
  }

/////////////////////////////////////////////////////////
  setProductRow(Map<String, dynamic> map) {
    itemSelected = true;
    item = map["item"];
    code = map["code"];
    rate = map["rate"];
    tax = map["tax"];
    image = map["image"];
    qty.text = "1";
    discAmt.text = map["disc_amt"];
    discper.text = map["disc_per"];
    notifyListeners();
  }

//////////////////////////////////////////////////////////
  getCartProductList(BuildContext context) {
    cartProductList = [
      {
        "item": "item1",
        "code": "IT1234",
        "qty": "1",
        "rate": "120.00",
        "gross": "120.00",
        "tax_p":"5",
        "tax": "21",
        "disc_amt": "0.00",
        "disc_per": "0",
        "net_total":"1234.00",
        "image": "assets/im1.jpeg"
      },
      {
        "item": "item2",
        "code": "IT34",
        "qty": "2",
        "rate": "420",
        "gross": "840.00",
        "tax_p":"5",
        "tax": "12",
        "disc_amt": "0.00",
        "disc_per": "0",
        "net_total":"345.00",

        "image": "assets/im2.jpeg"
      },
      {
        "item": "item3",
        "code": "IT888",
        "qty": "3",
        "rate": "220",
        "gross": "660.00",
        "tax_p":"5",
        "tax": "8.999",
        "disc_amt": "0.00",
        "disc_per": "0",
        "net_total":"334.00",

        "image": "assets/im3.jpg"
      },
    ];

    cartQty = List.generate(
        cartProductList.length, (index) => TextEditingController());
    cartDisc_per = List.generate(
        cartProductList.length, (index) => TextEditingController());
    cartDisc_amt = List.generate(
        cartProductList.length, (index) => TextEditingController());
    for (var i = 0; i < cartProductList.length; i++) {
      cartQty[i].text = cartProductList[i]["qty"];
      cartDisc_per[i].text = cartProductList[i]["disc_per"];
      cartDisc_amt[i].text = cartProductList[i]["disc_amt"];
    }
    notifyListeners();
  }

  /////////////////////////////////////////////////////////
}
