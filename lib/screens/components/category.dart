import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

import '../../utils/consts/theme.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: primaryColor,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Card(
              shadowColor: primaryColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: primaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: 155,
                height: 155,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(category: category)));
                  },
                  child: Image.asset(
                    "$imagePath$category.png",
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            categories[category]!,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
