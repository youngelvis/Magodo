import 'package:flutter/material.dart';
import '../../components/components_for_class_of_varable/colors.dart' as color;

class FilterAndSortButtons extends StatelessWidget {
  const FilterAndSortButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 210,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: color.AppColor.homePageBackground,
                onPrimary: Colors.grey),
            child: Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.tune),
                SizedBox(
                  width: 10,
                ),
                Text('Filter'),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 210,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: color.AppColor.homePageBackground,
                onPrimary: Colors.grey),
            child: Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.sort),
                SizedBox(
                  width: 10,
                ),
                Text('sort'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
