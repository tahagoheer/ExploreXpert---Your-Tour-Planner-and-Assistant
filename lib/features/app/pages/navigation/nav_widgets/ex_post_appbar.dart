import 'package:flutter/material.dart';

class EXPostAppBar extends StatelessWidget {
  const EXPostAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 6)
                  ]),
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
