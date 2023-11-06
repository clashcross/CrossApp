import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final GestureTapCallback tapCallback;

  const SquareTile(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          height: 40,
        ),
        title: Text(title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        onTap: tapCallback,
      ),

      // child: Row(
      //   children: [
      //     Image.asset(
      //       imagePath,
      //       height: 40,
      //     ),
      //     const SizedBox(width: 20),
      //     Text(title,
      //         overflow: TextOverflow.ellipsis,
      //         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
      //   ],
      // ),
    );
  }
}
