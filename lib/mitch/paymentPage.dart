import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: Center(
          child: Text(
        'Pay Here!!',
        style: GoogleFonts.bebasNeue(fontSize: 50),
      )),
    );
  }
}
