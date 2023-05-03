import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/app_drawer.dart';
import 'controllers/chart_controller.dart';
import 'components/translation.dart';
import 'controllers/page_controller.dart';
import 'controllers/timeline_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AtomController());
    Get.put(PageStateController());
    Get.put(ChartControl());
    return GetMaterialApp(
      translations: Dictionary(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'AR'),
      title: 'Denis Germán Giménez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const AppDrawer(
        child: Home(),
      ),
      
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:multi_charts/multi_charts.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Radar Chart Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Radar Chart Example"),
//         ),
//         body: Column(children: [
//           Container(
//             width: 450,
//             height: 450,
//             //Radar Chart
//             child: RadarChart(
//               values: [1, 2, 4, 7, 9, 0, 6],
//               labels: [
//                 "Label1",
//                 "Label2",
//                 "Label3",
//                 "Label4",
//                 "Label5",
//                 "Label6",
//                 "Label7",
//               ],
//               maxValue: 10,
//               fillColor: Colors.blue,
//               chartRadiusFactor: 0.7,
//             ),
//           ),
          //Pie Chart
          // PieChart(
          //   values: [15, 10, 30, 25, 20],
          //   labels: ["Label1", "Label2", "Label3", "Label4", "Label5"],
          //   sliceFillColors: [
          //     Colors.blueAccent,
          //     Colors.greenAccent,
          //     Colors.pink,
          //     Colors.orange,
          //     Colors.red,
          //   ],
          //   animationDuration: Duration(milliseconds: 1500),
          //   legendPosition: LegendPosition.Right,
          // ),
//         ]),
//       ),
//     );
//   }
// }