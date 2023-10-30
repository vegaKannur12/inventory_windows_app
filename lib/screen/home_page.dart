import 'package:flutter/material.dart';
import 'package:inventorywindowsapp/screen/popup/cart_popup.dart';
import 'package:inventorywindowsapp/screen/popup/common_popup.dart';
import 'package:inventorywindowsapp/screen/product_row.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double textFieldHeight = 60;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 66, 66, 66),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,elevation: 0,
        title: Text("Flutter App"),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08, width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                // width: size.width * 0.3,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  "SAVE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22),
                )),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     // width: size.width * 0.3,
            //     color: Colors.yellow,
            //   ),
            // ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Provider.of<Controller>(context, listen: false)
                      .getCartProductList(context);
                  CartPopup popup = CartPopup();
                  popup.viewData(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const CartPage()),
                  // );
                },
                child: Container(
                  // width: size.width * 0.3,
                  color: Color.fromARGB(255, 0, 109, 4),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "VIEW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -14, end: -20),
                        badgeContent: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            '22',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        "( \u{20B9}${20456} )",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
        // color: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: textFieldHeight,
              width: size.width * 0.5,
              child: TextField(
                onSubmitted: (value) {
                  Provider.of<Controller>(context, listen: false)
                      .getProdcutList(context);
                  CommonPopup popup = CommonPopup();
                  popup.showDialogueBox(context);
                },
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  // prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: InkWell(
                      onTap: () async {
                        Provider.of<Controller>(context, listen: false)
                            .getProdcutList(context);
                        CommonPopup popup = CommonPopup();
                        popup.showDialogueBox(context);
                      },
                      child: Icon(Icons.search)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  hintText: "Search with code/ EAN/Item ",
                  hintStyle: TextStyle(fontSize: 12),
                  // border: InputBorder.none,
                ),
              ),
            ),

            ProductRow()
          ],
        ),
      ),
    );
  }
}
