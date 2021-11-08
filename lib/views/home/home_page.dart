import 'package:doctor_profile/entity/doctor.dart';
import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/home/doctor_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> doctors = [
    Doctor('Manuel Macias', 'implantology', 'images/doctor2.png'),
    Doctor('Roberto Delgadillo', 'Neurologist', 'images/doctor.jpeg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).profile, context),
            Divider(color: ResColors.dividerColor),
            searchBar(AppLocalizations.of(context).search),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) => MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const DoctorProfilePage()));
                      },
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), side: BorderSide(color: ResColors.dividerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              doctors[index].imagePath,
                              width: double.infinity,
                              height: screenWidth(context, dividedBy: 3),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(doctors[index].name, style: mainStyle),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(doctors[index].job, style: hintStyle),
                              const Spacer(),
                              MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                height: 20,
                                minWidth: 50,
                                elevation: 0,
                                color: ResColors.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: Text(
                                  AppLocalizations.of(context).add,
                                  style: mainStyle.copyWith(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ).viewPadding(left: 5, right: 5, top: 5, bottom: 5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
