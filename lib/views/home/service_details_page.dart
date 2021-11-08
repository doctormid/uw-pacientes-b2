import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  List<String> spinValues = ['CNT: 1', 'CNT: 2', 'CNT: 3', 'CNT: 4'];
  String spinValue = '';

  @override
  void initState() {
    spinValue = spinValues[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).serviceDetails, context, hasBackBtn: true),
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(AppLocalizations.of(context).revision),
                            const Spacer(),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton<String>(
                                value: spinValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                style: mainStyle,
                                underline: const SizedBox(),
                                onChanged: (_) {},
                                items: spinValues.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                              Text(
                                '\$10M.X.N',
                                style: mainStyle.copyWith(color: ResColors.mainTextColor, fontWeight: FontWeight.w600),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 12,
                                itemPadding: EdgeInsets.zero,
                                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) {},
                              ),
                            ]),
                            const SizedBox(width: 16)
                          ],
                        ),
                        const SizedBox(height: 15),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'images/doctor.jpeg',
                                  width: screenWidth(context, dividedBy: 2.5),
                                ),
                              ).viewPadding(left: 10, top: 10, bottom: 10, right: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(AppLocalizations.of(context).description, style: mainStyle),
                                    const Spacer(),
                                    Text(AppLocalizations.of(context).revision, style: hintStyle),
                                    const Spacer(),
                                    const SizedBox(height: 40)
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(height: 30, width: double.infinity, color: ResColors.dividerColor),
                        Text(AppLocalizations.of(context).additionalInformation, style: mainStyle)
                            .viewPadding(left: 16, top: 16),
                        Text(AppLocalizations.of(context).revision, style: hintStyle)
                            .viewPadding(left: 16, top: 10, bottom: 40),
                        Container(height: 30, width: double.infinity, color: ResColors.dividerColor),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).gallery, style: hintStyle).viewPadding(left: 16),
                        const SizedBox(height: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'images/neurology.jpeg',
                            width: screenWidth(context, dividedBy: 2),
                          ),
                        ).viewPadding(left: 16),
                        const SizedBox(height: 20),
                        Container(height: 30, width: double.infinity, color: ResColors.dividerColor),
                        const SizedBox(height: 20),
                        Text(AppLocalizations.of(context).reviewAndRatings, style: mainStyle)
                            .viewPadding(left: 16, top: 16),
                        Text(AppLocalizations.of(context).reviewsNotFound, style: hintStyle)
                            .viewPadding(left: 16, top: 16),
                        const SizedBox(height: 30),
                        Text(
                          AppLocalizations.of(context).reserveWarning,
                          style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ).viewPadding(left: 16, top: 16, bottom: 20),
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            color: ResColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              AppLocalizations.of(context).reserve,
                              style: mainStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
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
}
