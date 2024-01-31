import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/bloc/auth/auth_bloc.dart';
import 'package:GrowBiz/presentations/pages/users/account_settings_page.dart';
import 'package:GrowBiz/presentations/pages/login/login_page.dart';
import 'package:GrowBiz/styles/my_colors.dart';
import 'package:GrowBiz/styles/my_text.dart';
import 'package:GrowBiz/presentations/widgets/my_snackBar.dart';
class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is LogoutError){
            mySnackBar(context, state.error);
          }
          if(state is LogoutSuccess){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return LoginPage();
            },));
          }
        },
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        width: 53,
                        height: 53,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 8,),
                      BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if(state is AuthSuccess){
                              final dataUser = state.userModel;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(dataUser.username, style: MyTextStyle.buttonH3(color: MyColors.blackBase),),
                                  Text(dataUser.email, style: MyTextStyle.captionH5(color: MyColors.grey300),),
                                ],
                              );
                            }else{
                              return Text('User', style: MyTextStyle.buttonH3(color: MyColors.blackBase),);
                            }
                          },
                        )
                    ],
                  ),
                  const SizedBox(height: 38,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pengaturan Akun', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                          Text('Edit profil, ubah kata sandi', style: MyTextStyle.captionH5(color: MyColors.grey200),)
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return AccountSettingsPage();
                          },));
                        },
                          child: Icon(Icons.navigate_next)
                      )
                    ],
                  ),
                  const SizedBox(height: 27,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profil Disimpan', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                          Text('4 pekerja', style: MyTextStyle.captionH5(color: MyColors.grey200),)
                        ],
                      ),
                      GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.navigate_next)
                      )
                    ],
                  ),
                  const SizedBox(height: 27,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('FAQ', style: MyTextStyle.captionH5(color: MyColors.blackBase),),
                          Text('Pertanyaan seputar aplikasi', style: MyTextStyle.captionH5(color: MyColors.grey200),)
                        ],
                      ),
                      GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.navigate_next)
                      )
                    ],
                  ),
                  const SizedBox(height: 39,),
                  GestureDetector(
                    onTap: (){
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                    },
                    child: (state is AuthLoading) ?
                    Text('Loading...', style: MyTextStyle.captionH5(color: MyColors.blackBase),) :
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          const SizedBox(width: 8,),
                          Text('Keluar',style: MyTextStyle.captionH5(color: MyColors.blackBase),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
        },
),
    );
  }
}
