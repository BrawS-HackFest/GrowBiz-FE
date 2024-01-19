import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/user/user_bloc.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/card_detail_work.dart';
import 'package:hackfest_mobile/widgets/desc_work_section.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/profile_work_section.dart';
import 'package:hackfest_mobile/widgets/scrollbehavior.dart';

class DetailWorkPage extends StatefulWidget {
   DetailWorkPage({super.key, required this.id});
   String id;

  @override
  State<DetailWorkPage> createState() => _DetailWorkPageState();
}

class _DetailWorkPageState extends State<DetailWorkPage> {
  bool isDescriptionSelected = true;
  
  @override
  void initState(){
    super.initState();
    context.read<UserBloc>().add(UserWorkDetailFetched(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pekerja', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},icon:Icon(Icons.bookmark_border_outlined, color: MyColors.primaryBase,))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if(state is UserWorkDetailSuccess){
                  final userData = state.userWorkDetail;
                  return ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardDetailWork(
                              name: userData.name,
                              work: userData.categories != null && userData.categories.isNotEmpty
                                  ? userData.categories[0]['name']
                                  : '',
                            ),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 44),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: MyColors.neutra100,
                                ),
                                child: Stack(
                                    children:[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isDescriptionSelected = true;
                                                });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                ),
                                                side: BorderSide.none,
                                                backgroundColor: isDescriptionSelected
                                                    ? MyColors.primaryBase
                                                    : MyColors.neutra100,
                                                foregroundColor: isDescriptionSelected ? MyColors.whiteBase : MyColors.grey300,
                                              ),
                                              child: Text('Deskripsi'),
                                            ),
                                          ),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isDescriptionSelected = false;
                                                });
                                              },
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                ),
                                                side: BorderSide.none,
                                                backgroundColor: !isDescriptionSelected
                                                    ? MyColors.primaryBase
                                                    : MyColors.neutra100,
                                                foregroundColor: isDescriptionSelected ? MyColors.grey300 : MyColors.whiteBase,
                                              ),
                                              child: const Text('Profil'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(height: 21,),
                            isDescriptionSelected ?
                            DescWorkSection() :
                            ProfileWorkSection(),
                            const SizedBox(height: 30,),
                            SizedBox(
                                width: double.infinity,
                                child: MyButton(text: 'Hubungi', color: MyColors.primaryBase,
                                    onPressed: (){
                                    }
                                )
                            ),
                            const SizedBox(height: 15,),




                          ],
                        ),
                      ),
                    ),
                  );
                }
                if(state is UserFailed){
                  return Text(state.error);
                }
                else{
                  return Container();
                }

              },
            ),
    );
  }
}
