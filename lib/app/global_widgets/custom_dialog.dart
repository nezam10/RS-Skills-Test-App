//custom Dialog
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;
  const CustomDialog({
    Key? key,
    required this.title,
    this.subtitle,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () => Get.back(),
          color: Colors.red,
          icon: const Icon(Icons.close),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      actions: [
        SizedBox(
          //height: Get.height * 0.75,
          width: Get.width * 0.95,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 50, right: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(title),
                ),
                const Divider(height: 25, color: Colors.black),
                // table
                // Table(
                //   textDirection: TextDirection.rtl,
                //   defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                //   border: TableBorder.all(width: 2.0, color: Colors.red),
                //   children: const [
                //     TableRow(children: [
                //       Text("0", textScaleFactor: 1.5),
                //       Text("2", textScaleFactor: 1.5),
                //       Text("Before Fard", textScaleFactor: 1.5),
                //     ]),
                //     TableRow(children: [
                //       Text("B.Tech", textScaleFactor: 1.5),
                //       Text("ABESEC", textScaleFactor: 1.5),
                //       Text("AKTU", textScaleFactor: 1.5),
                //     ]),
                //     TableRow(children: [
                //       Text("12th", textScaleFactor: 1.5),
                //       Text("Delhi Public School", textScaleFactor: 1.5),
                //       Text("CBSE", textScaleFactor: 1.5),
                //     ]),
                //     TableRow(children: [
                //       Text("High School", textScaleFactor: 1.5),
                //       Text("SFS", textScaleFactor: 1.5),
                //       Text("ICSE", textScaleFactor: 1.5),
                //     ]),
                //   ],
                // ),
                //Namaz Rakat Row
                Column(
                  children: children,
                )
                // NamazRakats(
                //   rowColor: Colors.grey.shade300,
                //   title: "Before Fard",
                //   rakat: '2',
                //   rakatName: 'Sunnah',
                // ),
                // NamazRakats(
                //   rowColor: Colors.grey.shade100,
                //   title: "Fard",
                //   rakat: '2',
                //   rakatName: 'Fard',
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
