import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/auth/auth_bloc.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/my_button.dart';
import 'package:GrowBiz/presentations/widgets/my_snackBar.dart';
import 'package:GrowBiz/presentations/widgets/my_textfield_form.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Reset Password',style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is ResetPassSuccess){
            mySnackBar(context, 'Reset Password dikirim melalui email, silahkan cek email anda');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: MyTextFieldForm(
                      label: 'Email',
                      hint: 'example@gmail.com',
                      controller: emailController,
                      icon: Icons.email_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                      text: state is AuthLoading ? 'Loading...': 'Reset Password',
                      color: MyColors.primaryBase,
                      onPressed: () {
                        context.read<AuthBloc>().add(ResetPassEvent(email: emailController.text.trim()));
                        setState(() {
                          emailController.clear();
                        });
                      }),
                ),
                const Spacer(),
              ],
            ),
          );
        },

      ),
    );
  }
}
