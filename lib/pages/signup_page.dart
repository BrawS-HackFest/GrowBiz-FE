import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/pages/login_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
import 'package:hackfest_mobile/widgets/my_textfield_form.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is RegisterError){
              mySnackBar(context, state.error);
            }
            if(state is RegisterSuccess){
              mySnackBar(context, 'Pendaftaran berhasil, silahkan aktivasi akun anda melalui email anda!');
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 230,
                  color: MyColors.primary600,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Selamat Datang ',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: MyColors.whiteBase),
                        ),
                        Text(
                          'Isi data anda dengan benar!',
                          style:
                          TextStyle(fontSize: 13, color: MyColors.primary200),
                        )
                      ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        MyTextFieldForm(
                          label: 'Email',
                          hint: 'Example@gmail.com',
                          controller: emailController,
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFieldForm(
                          label: 'password',
                          hint: '********',
                          controller: passController,
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFieldForm(
                          label: 'Confirm password',
                          hint: '********',
                          controller: confirmPassController,
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: MyButton(
                                text: 'Daftar',
                                color: MyColors.primaryBase,
                                onPressed: () {
                                  context.read<AuthBloc>().add(RegisterEvent(
                                      email: emailController.text.trim(),
                                      password: passController.text.trim(),
                                      confirmPassword: confirmPassController.text.trim())
                                  );
                                })),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sudah memiliki akun? ',
                                style: TextStyle(color: MyColors.greyBase)),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return LoginPage();
                                      }));
                                },
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                      color: MyColors.grey700,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
