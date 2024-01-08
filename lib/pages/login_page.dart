import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/pages/home_page.dart';
import 'package:hackfest_mobile/pages/signup_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/my_snackBar.dart';
import 'package:hackfest_mobile/widgets/my_textfield_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthError){
              mySnackBar(context, state.error);
            }
            if(state is AuthSuccess){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
               return HomePage();
             },));
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
                          'Selamat Datang Kembali',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: MyColors.whiteBase),
                        ),
                        Text(
                          'Silahkan masuk ke akun anda!',
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
                          label: 'Password',
                          hint: '********',
                          controller: passController,
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Lupa kata sandi?',
                                  style: TextStyle(
                                      color: MyColors.grey400,
                                      decoration: TextDecoration.underline),
                                ))),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: MyButton(
                                text: (state is AuthLoading) ? 'Loading...' : 'Masuk',
                                color: MyColors.primaryBase,
                                onPressed: () {
                                  context.read<AuthBloc>().add(LoginEvent(
                                      email: emailController.text.trim(),
                                      password: passController.text.trim())
                                  );
                                })),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum memiliki akun? ',
                                style: TextStyle(color: MyColors.greyBase)),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return SignUpPage();
                                      }));
                                },
                                child: Text(
                                  'Daftar',
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
        )
    );
  }
}
