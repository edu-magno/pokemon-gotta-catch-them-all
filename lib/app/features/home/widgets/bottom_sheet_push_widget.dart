import 'package:flutter/material.dart';

class BottomSheetPushWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
        width: 50,
        height: 10,
      ),
    );
  }
}
