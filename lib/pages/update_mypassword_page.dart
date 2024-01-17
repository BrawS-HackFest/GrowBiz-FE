import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
import 'package:hackfest_mobile/widgets/my_textfield_form.dart';

class UpdateMyPasswordPage extends StatelessWidget {
  UpdateMyPasswordPage({super.key});

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah kata sandi', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is UpdatePassFailed){
            mySnackBar(context, state.error);
          }
          if(state is UpdatePassSuccess){
            mySnackBar(context, 'Password berhasil diupdate :)');
          }
        },
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 28,vertical: 28),
              child: Column(
                children: [
                  MyTextFieldForm(label: 'Kata sandi baru', hint: '*******', controller:passController , icon: Icons.lock_outline,obsecureText: true, type: 'password',),
                  const SizedBox(height: 16,),
                  MyTextFieldForm(label: 'Kofirmasi kata sandi baru', hint: '*******', controller:confirmPassController , icon: Icons.lock_outline, obsecureText: true, type: 'password',),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: MyButton(text: (state is AuthLoading) ? 'Loading...' : 'Update', color: MyColors.primaryBase, onPressed: (){
                      context.read<AuthBloc>().add(UpdatePassEvent(
                          password: passController.text.trim(),
                          confirmPassword: confirmPassController.text.trim()
                      ));
                    }),
                  )
                ],
              ),
            );
        },
),
    );
  }
}
