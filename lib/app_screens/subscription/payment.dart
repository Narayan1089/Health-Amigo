import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                SizedBox(
                  width: 100,
                ),
                Text(
                  'Payment',
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
              width: 343,
              height: 55,
              decoration: BoxDecoration(
                  color: Color(0xffFF834F),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Complete Payment',
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
      ),
    );
  }
}
