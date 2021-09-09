import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class View extends StatefulWidget {
  var ds;
  View(this.ds);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  w(w1, pw) {
    return pw * (w1 / 392);
  }

  h(h1, ph) {
    return ph * (h1 / 850);
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.ds} slfncs');
    double pw = Get.size.width;
    double ph = Get.size.height;
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          color: Colors.white.withOpacity(0.75),
          minHeight: h(180, ph),
          maxHeight: h(550, ph),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          body: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var ind = index + 1;
                return Container(
                  width: w(392, pw),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.ds['img$ind']),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: EdgeInsets.all(w(18.0, pw)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.76),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(w(8.0, pw)),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                );
              },
              itemCount: 3,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),
          ),
          panelBuilder: (controller) {
            return Padding(
              padding: EdgeInsets.only(
                  left: w(18.0, pw),
                  right: w(18, pw),
                  bottom: h(10, ph),
                  top: h(10, ph)),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                controller: controller,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: h(10.0, ph),
                              left: w(8, pw),
                              right: w(8, pw)),
                          child: Text(
                            widget.ds['title'],
                            style: TextStyle(
                                fontSize: w(21, pw),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: w(32, pw),
                                color: Colors.pinkAccent,
                              ),
                              Text(
                                widget.ds['rating'],
                                style: TextStyle(
                                    fontSize: w(22, pw),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h(14, ph),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w(10, pw),
                      ),
                      FaIcon(
                        FontAwesomeIcons.rupeeSign,
                        size: w(24, pw),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: w(20, pw),
                      ),
                      Text(
                        widget.ds['offerprice'],
                        style: TextStyle(
                            fontSize: w(32, pw), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: w(20, pw),
                      ),
                      Text(
                        widget.ds['mrp'],
                        style: TextStyle(
                            fontSize: w(26, pw),
                            color: Colors.black.withOpacity(0.5),
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: w(10, pw),
                      ),
                      Text(
                        "( 50% off )",
                        style: TextStyle(
                          fontSize: w(23, pw),
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w(8.0, pw)),
                    child: Text(
                      "inclusive of all taxes",
                      style: TextStyle(
                        fontSize: w(20, pw),
                        fontWeight: FontWeight.bold,
                        color: Colors.green.withOpacity(1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h(20, ph),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w(8.0, pw), bottom: h(5, ph)),
                    child: Text(
                      "Select size -",
                      style: TextStyle(
                        fontSize: w(20, pw),
                        color: Colors.black.withOpacity(1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h(10, ph),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _si("S"),
                      _si("M"),
                      _si("L"),
                      _si("XL"),
                    ],
                  ),
                  SizedBox(
                    height: h(20, ph),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w(8.0, pw), bottom: h(5, ph)),
                    child: Text(
                      "Product details",
                      style: TextStyle(
                        fontSize: w(20, pw),
                        color: Colors.black.withOpacity(1),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w(12.0, pw), right: w(5, pw)),
                    child: Text(
                      widget.ds['details'],
                      style: TextStyle(
                        fontSize: w(17, pw),
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h(22, ph),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w(8.0, pw), bottom: h(5, ph)),
                    child: Text(
                      "Material and care",
                      style: TextStyle(
                        fontSize: w(20, pw),
                        color: Colors.black.withOpacity(1),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: w(12.0, pw), right: w(5, pw)),
                    child: Text(
                      widget.ds['material'],
                      style: TextStyle(
                        fontSize: w(17, pw),
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h(25, ph),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w(18.0, pw),
                                    vertical: h(6, ph)),
                                child: Text("Offer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w(20, pw))),
                              ),
                            ),
                            SizedBox(
                              height: h(10, ph),
                            ),
                            FaIcon(
                              FontAwesomeIcons.truckMoving,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: w(15.0, pw)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "850 off + Free shipping on your first order",
                                style: TextStyle(
                                    fontSize: w(18, pw),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              SizedBox(
                                height: h(10, ph),
                              ),
                              Text(
                                "Only on first order use",
                                style: TextStyle(
                                    fontSize: w(16, pw),
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "code : STAR500",
                                style: TextStyle(
                                    fontSize: w(16, pw),
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h(25, ph),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: w(12.0, pw)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(w(8.0, pw)),
                                child: Text(
                                  " 8 left ",
                                  style: TextStyle(
                                      fontSize: w(20, pw),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(w(8.0, pw)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                  size: w(28, pw),
                                ),
                                Text(
                                  "  Add to cart",
                                  style: TextStyle(
                                      fontSize: w(21, pw),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h(20, ph),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _si(te) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.pinkAccent,
            width: 1,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 6),
        child: Text(
          te,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent.withOpacity(0.8)),
        ),
      ),
    );
  }
}
