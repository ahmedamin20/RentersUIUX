// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../../core/resource/colors_manager.dart';
// import '../../../../../../core/resource/text_manager.dart';
// import '../../../../../../core/resource/text_style_manager.dart';
//
// class CustomAddress extends StatelessWidget {
//   const CustomAddress({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<LocationCubit, LocationState>(
//       listener: (context, state)
//       {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         LocationCubit cubit = context.read<LocationCubit>();
//         if(cubit.address != null){
//           return
//             ListTile(
//               leading: Image.asset('assets/icons/map.png'),
//               title: Text(
//                 TextManager.currentLocation,
//                 style: TextStyleManager.textStyle12w500.copyWith(
//                     color:ColorsManager.gray2),
//               ),
//               subtitle: Text(
//                 cubit.address!,
//                 style: TextStyleManager.textStyle14w500,
//               ),
//             );
//         }else{
//           return ListTile(
//             leading: Image.asset('assets/icons/map.png'),
//             title: Text(
//               TextManager.currentLocation,
//               style: TextStyleManager.textStyle12w500.copyWith(
//                   color: ColorsManager.gray2),
//             ),
//             subtitle: Text(
//               'Loading...',
//               style: TextStyleManager.textStyle14w500,
//             ),
//           );
//         }
//
//       },
//     );
//   }
// }
