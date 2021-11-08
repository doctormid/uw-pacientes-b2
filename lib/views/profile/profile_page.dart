import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/profile/invite_friend_page.dart';
import 'package:doctor_profile/views/profile/profile_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).profile, context),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: screenWidth(context, dividedBy: 5)),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset('images/client.jpeg', width: screenWidth(context, dividedBy: 5)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text('Alberto Ramirez Sanchez', style: titleStyle).viewPadding(left: 12),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const ProfileDetailPage()),
                                      );
                                    },
                                    elevation: 0,
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    child: Text(
                                      AppLocalizations.of(context).viewProfile,
                                      style: mainStyle.copyWith(
                                          color: ResColors.primaryColor, fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: ResColors.dividerColor),
                        const SizedBox(height: 5),
                        Text(AppLocalizations.of(context).profileComplete, style: mainStyle),
                        const SizedBox(height: 5),
                        Divider(color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).accountSettings,
                            style: mainStyle.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).personalInformation, 'profile'),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).paymentAndFees, 'card'),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).appointmentHistory, 'add'),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).inviteFriend, 'addFriend', onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const InviteFriendPage()));
                        }),
                        Divider(color: ResColors.dividerColor, height: 1),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).attendance,
                            style: mainStyle.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).securityCenter,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Text(AppLocalizations.of(context).supportMessage,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Divider(color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).getInTouchTeam,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Text(AppLocalizations.of(context).talkToTeam,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Divider(color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).getHelp,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Divider(color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).sendCommentaries,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Divider(color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).legalInformation,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Text(AppLocalizations.of(context).termsOfService,
                            style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        Divider(color: ResColors.dividerColor),
                        Row(
                          children: [
                            SvgPicture.asset('images/logout.svg'),
                            const SizedBox(width: 10),
                            Text(AppLocalizations.of(context).closeSession,
                                style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Divider(color: ResColors.dividerColor),
                        Align(
                          child: Text(AppLocalizations.of(context).version + "1.1 (2104220)",
                              style: hintStyle.copyWith(fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget menuItem(String title, String icon, {Function? onClick}) => MaterialButton(
        onPressed: () => onClick?.call(),
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('images/$icon.svg', color: Colors.blueGrey),
                const SizedBox(width: 16),
                Text(title, style: mainStyle),
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      );
}
