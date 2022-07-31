// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:talebe_app/cubit/login/login_cubit.dart';
// import 'package:talebe_app/ui/theme/colors.dart';
// import 'package:talebe_app/ui/widgets/atoms/custom_text.dart';
//
// class CustomNameSurname extends StatelessWidget {
//   const CustomNameSurname({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
//       if (state is GotLoginStudentState) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomText(
//                 // text: state.studentInfo.name,
//                 text: state.loginStudentUserData.name,
//                 fontSize: 38,
//                 fontWeight: FontWeight.w500,
//                 textColor: AppColors.white),
//             CustomText(
//                 // text: state.studentInfo.surname,
//                 text: state.loginStudentUserData.surname,
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//                 textColor: AppColors.white),
//           ],
//         );
//       } else {
//         return SizedBox(
//           width: MediaQuery.of(context).size.width * 0.60,
//           height: 100,
//           child: const LinearProgressIndicator(color:AppColors.primary),
//         );
//       }
//     });
//   }
// }
