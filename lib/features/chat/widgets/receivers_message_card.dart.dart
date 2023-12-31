import 'package:flutter/material.dart';
import 'package:waya_pay/core/utils/color_constants.dart';
import 'package:waya_pay/widgets/height_space.dart';

class ReceiversMessageCard extends StatelessWidget {
  final String message;
  final String dateTime;
  final String user;
  const ReceiversMessageCard({
    Key? key,
    required this.message,
    required this.dateTime,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 48,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFb9b6c1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HeightSpace(10),
                  Text(
                    message,
                    style: const TextStyle(
                      color: secondaryAppColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HeightSpace(15),
                  Text(
                    dateTime,
                    style: const TextStyle(
                      color: secondaryAppColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
