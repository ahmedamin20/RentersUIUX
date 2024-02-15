import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/data/repository/verify_repo/verify_repo.dart';
import 'package:ksb/view_model/cubit/auth_cubit/verify_cubit/verify_cubit.dart';
import 'package:ksb/views/pages/auth/widgets/auth_app_bar.dart';
import 'package:ksb/views/pages/auth/widgets/verification/verification_view_body.dart';

import '../../../core/services/service_locator/service_locator.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key ,
 required  this.email
  });
 final  String email;
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AuthAppBar(
        onPressed: ()
        {
         context.go(AppRouter.loginView);
        },
      ),
      body: BlocProvider(
        create: (context) => VerifyCubit(sl<VerifyRepoImpl>()),
        child:  VerificationViewBody(email:email),
      ),
    );
  }
}
