import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppointmentReviewPage extends StatefulWidget {
  const AppointmentReviewPage({Key? key}) : super(key: key);

  @override
  _AppointmentReviewPageState createState() => _AppointmentReviewPageState();
}

class _AppointmentReviewPageState extends State<AppointmentReviewPage> {
  List<String> reviews = [];

  @override
  void didChangeDependencies() {
    var local = AppLocalizations.of(context);
    reviews.add(local.bad);
    reviews.add(local.just);
    reviews.add(local.well);
    reviews.add(local.excellent);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).services.toCapitalize(), context, hasBackBtn: true),
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('images/doctor.jpeg', width: screenWidth(context, dividedBy: 3.5)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text('Dr. Manuel Macias', style: titleStyle),
                                SizedBox(height: screenWidth(context, dividedBy: 12)),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemPadding: EdgeInsets.zero,
                                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: (rating) {},
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ).viewPadding(left: 16, right: 16, top: 20, bottom: 20),
                      Container(color: Colors.blueGrey.shade50, height: 20),
                      Text(
                        AppLocalizations.of(context).evaluateAspects,
                        style: mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                      ).viewPadding(left: 16, top: 20),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          questionnaire(AppLocalizations.of(context).punctuality),
                          const SizedBox(width: 16),
                          questionnaire(AppLocalizations.of(context).attention),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          questionnaire(AppLocalizations.of(context).hygiene),
                          const SizedBox(width: 16),
                          questionnaire(AppLocalizations.of(context).cooperative),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(color: Colors.blueGrey.shade50, height: 20),
                      Text(
                        AppLocalizations.of(context).writeYourReview,
                        style: mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                      ).viewPadding(left: 16, top: 20),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          autofocus: false,
                          minLines: 2,
                          maxLines: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            hintText: AppLocalizations.of(context).veryGoodDoctor,
                            hintStyle: hintStyle,
                            contentPadding: const EdgeInsets.only(left: 16.0, bottom: 10, top: 10, right: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                            enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                          ),
                        ),
                      ).viewPadding(left: 16, right: 16, top: 10, bottom: 20),
                      Align(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                          onPressed: () {},
                          elevation: 0,
                          color: ResColors.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            AppLocalizations.of(context).submitOpinion,
                            style: mainStyle.copyWith(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget questionnaire(String title) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: hintStyle),
          const SizedBox(height: 5),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: reviews[3],
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              style: mainStyle,
              underline: const SizedBox(),
              onChanged: (_) {},
              items: reviews.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
