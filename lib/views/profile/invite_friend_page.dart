import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InviteFriendPage extends StatefulWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).inviteFriend, context, hasBackBtn: true),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).addContactToInvite, style: mainStyle),
                      const SizedBox(height: 15),
                      MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        minWidth: double.infinity,
                        height: 55,
                        color: ResColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text(
                          AppLocalizations.of(context).selectContact,
                          style: mainStyle.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(AppLocalizations.of(context).enterYourPhone, style: mainStyle),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            hintText: AppLocalizations.of(context).fullName,
                            hintStyle: hintStyle,
                            prefixIconConstraints: const BoxConstraints(maxHeight: 16, minWidth: 40),
                            contentPadding: const EdgeInsets.only(left: 14.0, bottom: 5, top: 0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<String>(
                              value: '+52',
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              style: mainStyle,
                              underline: const SizedBox(),
                              onChanged: (_) {},
                              items: ['+52'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blueGrey.shade50,
                                  hintText: AppLocalizations.of(context).phoneNumber,
                                  hintStyle: hintStyle,
                                  prefixIconConstraints: const BoxConstraints(maxHeight: 16, minWidth: 40),
                                  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 5, top: 0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                                  enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        minWidth: double.infinity,
                        height: 55,
                        color: ResColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text(
                          AppLocalizations.of(context).sendInvitation,
                          style: mainStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ).viewPadding(left: 16, right: 16, top: 30)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
