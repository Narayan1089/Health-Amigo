import 'package:amigoproject/app_screens/subscription/payment.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffFF834F),
                    )),
                SizedBox(
                  width: 80,
                ),
                Text(
                  'Check Out',
                  style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.91),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Customer Details',
                        style: TextStyle(
                            // color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.77),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        width: 64,
                        height: 39,
                        decoration: BoxDecoration(
                            color: Color(0xffFF834F),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.69),
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.location_on_outlined,
                            color: Color(0xffFF834F)),
                        radius: 17,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          Text(
                            'User Name\n+91 1234567891',
                            style: TextStyle(
                                // color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 12),
                          ),
                          // Text('+91 1234567891'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Free Plan Active',
                            style: TextStyle(
                                // color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                            // color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.77),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        width: 64,
                        height: 39,
                        decoration: BoxDecoration(
                            color: Color(0xffFF834F),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.69),
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   child: ListView.builder(
                  //     itemCount: 2,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Row(
                  //         children: [
                  //           Container(
                  //             width: 70,
                  //             height: 70,
                  //             color: Colors.pinkAccent,
                  //           ),
                  //           SizedBox(
                  //             width: 30,
                  //           ),
                  //           Column(
                  //             children: [
                  //               Text('Plan Name'),
                  //               Text('Period: 6 Months'),
                  //               Text('RS. 800'),
                  //             ],
                  //           ),
                  //           SizedBox(width: 50),
                  //           Center(child: Text('x1')),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 343,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(0xffFF834F),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Payment()));
                        },
                        child: Text(
                          'Go to Payment',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
