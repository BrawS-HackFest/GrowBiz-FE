import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest_mobile/bloc/user/user_bloc.dart';
import 'package:hackfest_mobile/pages/detail_work_page.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/widgets/card_work.dart';
import 'package:hackfest_mobile/widgets/my_textfield.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class AllWorkersPage extends StatefulWidget {
  AllWorkersPage({super.key});

  @override
  State<AllWorkersPage> createState() => _AllWorkersPageState();
}

class _AllWorkersPageState extends State<AllWorkersPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    context.read<UserBloc>().add(UserWorkFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 250,
                  child: MyTextField(hint: 'Cari kategori pekerjaan', controller:searchController , icon: Icons.search)),
              Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/svgs/filter_icon.svg', width: 24,),
                            const SizedBox(width: 3,),
                            Text('Filter',style: TextStyle(fontSize: 11, color: MyColors.primaryBase),)
                          ],
                        ),
                      ),
                    );
                  }
              ),

            ],
          ),
        ),
        const SizedBox(height: 18,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryBase,
                    elevation: 0,
                    foregroundColor: MyColors.whiteBase,
                    visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                ),
                child: Text('Semua',style: TextStyle(fontSize: 12), ),
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryBase,
                      elevation: 0,
                      foregroundColor: MyColors.whiteBase,
                      visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                  ),
                  child: Text('Rekomendasi',style: TextStyle(fontSize: 12), )
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryBase,
                      elevation: 0,
                      foregroundColor: MyColors.whiteBase,
                      visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: -1)
                  ),
                  child: Text('Teratas', style: TextStyle(fontSize: 12),)
              ),

            ],
          ),
        ),
        const SizedBox(height: 20,),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserWorkSuccess){
              final userData = state.userData;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final category = userData[index].categories[0] ;
                      return CardWork(
                        name: userData[index].username,
                        category: category['name'],
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return DetailWorkPage(
                              id: userData[index].id,
                            );
                          },));
                        },
                      );
                    }, separatorBuilder: (context, index) {
                      return const SizedBox(height: 15,);
                    }, itemCount: userData.length),
                  ),
                ),
              );
            }if(state is UserFailed){
              return Text(state.error);
            }else{
              return Container();
            }

          },
        ),
      ],
    );
  }
}
