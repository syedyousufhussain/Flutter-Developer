import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final void Function() onTap;
  BottomContainer({required this. onTap,required this. image, required this. price, required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
          child: Container(
        height: 570,
        width: 420,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(image),
            ),
            ListTile(
              leading: Text(
                name,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
              trailing: Text(
                "$price PKR/Kg",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.white,
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