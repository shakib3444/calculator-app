// import 'package:flutter/material.dart';
//
// class AppButton extends StatelessWidget {
//    const AppButton({super.key,
//      required this.name, required this.onClick,
//      this.bgColor= Colors.white10,
//      this.textColor=Colors.white,
//    });
//   final String name;
//   final VoidCallback onClick;
//   final Color bgColor ;
//   final Color textColor ;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onClick,
//         child: Container(
//           margin: const EdgeInsets.all(08),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: bgColor,
//           ),
//           child: Center(
//             child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: textColor),),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
