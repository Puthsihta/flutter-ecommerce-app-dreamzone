import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderProductScreen extends StatelessWidget {
  const OrderProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text("Payment"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "My. Dev",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "+85592389497"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
