// import 'package:flutter/material.dart';
//
// import '../core/app_colors.dart';
//
// class buildButton extends StatefulWidget {
//   int? pageIndex;
//   String? buttonText;
//   PageController? controller;
//   int? isSelected = 0 ;
//
//   buildButton({super.key,required this.controller,required this.pageIndex,required this.buttonText, });
//
//   @override
//   State<buildButton> createState() => _buildButtonState();
// }
//
// class _buildButtonState extends State<buildButton> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialButton(
//       onPressed: () {
//         widget.controller!.animateToPage(
//           widget.pageIndex = 2,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//         setState(() {
//           widget.isSelected = widget.pageIndex! - 1;
//         });
//       },
//       //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       elevation: 0,
//       //  color: isSelected == pageIndex - 1 ? AppColors.white :AppColors.lightGrey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               widget.buttonText!,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: widget.isSelected == widget.pageIndex! - 1 ? AppColors.pink :AppColors.greyScale,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 12,
//           ),
//           Container(
//               height: 2,
//               width: 30,
//               color: widget.isSelected == widget.pageIndex! - 1
//                   ? AppColors.pink
//                   : AppColors.lightGrey
//           )
//         ],
//       ),
//     );
//   }
// }
