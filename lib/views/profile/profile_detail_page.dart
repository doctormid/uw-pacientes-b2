import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/profile/edit_profile_page.dart';
import 'package:doctor_profile/views/profile/profile_survey_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ResColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              appBar(AppLocalizations.of(context).profile, context, hasBackBtn: true),
              Card(
                margin: const EdgeInsets.only(top: 70, bottom: 20, left: 16, right: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('images/client.jpeg', width: double.infinity, height: 200),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const EditProfilePage()));
                            },
                            padding: EdgeInsets.zero,
                            minWidth: 50,
                            height: 50,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: SvgPicture.asset('images/edit.svg',
                                color: ResColors.primaryColor, width: 25, height: 25),
                          ).viewPadding(right: 10, top: 10),
                        ),
                      ],
                    ),
                    Text('Alberto Ramirez Sanchez', style: titleStyle.copyWith(fontSize: 30))
                        .viewPadding(left: 16, right: 16),
                    Align(alignment: Alignment.center, child: Text('albertogakupo@gmail.com', style: mainStyle)),
                    Divider(color: ResColors.dividerColor),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: ResColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              AppLocalizations.of(context).myDoctor,
                              style: mainStyle.copyWith(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          MaterialButton(
                            onPressed: () {},
                            color: ResColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              AppLocalizations.of(context).myDates,
                              style: mainStyle.copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).dateOfBirth, '29/11/1997'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).occupation, 'Paciente'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).bloodType, 'B+'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).nationality, 'Mexicano'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).idiom, 'en'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).sex, 'Hombre'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).age, '23'),
                    Divider(color: ResColors.dividerColor),
                    details(AppLocalizations.of(context).allergies, 'No hay'),
                    Divider(color: ResColors.dividerColor),
                    Align(
                      alignment: Alignment.topRight,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ProfileSurveyPage()));
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          AppLocalizations.of(context).seeMore,
                          style: mainStyle.copyWith(color: ResColors.primaryColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget details(String title, String item) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Expanded(child: Text(title, style: mainStyle)),
        const SizedBox(width: 30),
        Expanded(child: Text(item, style: hintStyle)),
        const SizedBox(width: 16),
      ],
    );
  }
}
