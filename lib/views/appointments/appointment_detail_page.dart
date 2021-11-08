import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppointmentDetailPage extends StatefulWidget {
  final bool isCanceled;

  const AppointmentDetailPage(this.isCanceled, {Key? key}) : super(key: key);

  @override
  _AppointmentDetailPageState createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
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
                                  SizedBox(height: screenWidth(context, dividedBy: 10)),
                                  Text('18 Abr 2021 - 15:00 Hrs', style: mainStyle),
                                  const SizedBox(height: 10)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.isCanceled
                                ? AppLocalizations.of(context).cancelled
                                : AppLocalizations.of(context).finished,
                            style: mainStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: widget.isCanceled ? Colors.red : Colors.green,
                                fontSize: 22),
                          ),
                        ),
                        Divider(color: ResColors.dividerColor),
                        Text(
                          AppLocalizations.of(context).pricingDetails,
                          style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Divider(color: ResColors.dividerColor),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).quantity, style: mainStyle),
                                  const SizedBox(height: 5),
                                  Text('1', style: hintStyle)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).service, style: mainStyle),
                                  const SizedBox(height: 5),
                                  Text(AppLocalizations.of(context).consultationLong, style: hintStyle)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).cost,
                                      style: mainStyle, textDirection: TextDirection.ltr),
                                  const SizedBox(height: 5),
                                  Text('\$3000 M.X.N', style: hintStyle, textDirection: TextDirection.ltr)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: ResColors.dividerColor),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context).subtotal, style: mainStyle),
                            const Spacer(),
                            Text('\$3000 M.X.N', style: mainStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context).percentage, style: mainStyle),
                            const Spacer(),
                            Text('-\$750 M.X.N', style: mainStyle),
                          ],
                        ),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context).advanceNotApplied, style: mainStyle),
                            const Spacer(),
                            Text('-\$2250 M.X.N', style: mainStyle),
                          ],
                        ),
                        Divider(color: ResColors.dividerColor),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context).pendingPayment,
                              style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text('\$0 M.X.N', style: mainStyle),
                          ],
                        ),
                        Divider(color: ResColors.dividerColor),
                        const SizedBox(height: 10),
                        Text(
                          AppLocalizations.of(context).additionalInformation,
                          style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: RatingBar.builder(
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
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context).patientReview,
                          style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: AppLocalizations.of(context).veryGoodDoctor,
                              hintStyle: hintStyle,
                              prefixIconConstraints: const BoxConstraints(maxHeight: 16, minWidth: 40),
                              contentPadding: const EdgeInsets.only(left: 14.0, bottom: 5, top: 0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                            ),
                          ),
                        )
                      ],
                    ).viewPadding(top: 20, bottom: 20, left: 16, right: 16),
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
