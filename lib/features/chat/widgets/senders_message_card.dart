import 'package:flutter/material.dart';
import 'package:waya_pay/core/utils/color_constants.dart';
import 'package:waya_pay/widgets/height_space.dart';

class SendersMessageCard extends StatelessWidget {
  final String message;
  final String dateTime;
  final String user;

  const SendersMessageCard({
    Key? key,
    required this.message,
    required this.dateTime,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 48,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 15,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFb8c2b7),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: const TextStyle(
                      color: tertiaryAppColor,
                      fontSize: 13,
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
                  const HeightSpace(5),
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
