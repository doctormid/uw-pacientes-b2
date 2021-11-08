import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/appointments/appointment_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
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
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).state + ":",
                            style: mainStyle.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).pending,
                            style: mainStyle.copyWith(fontWeight: FontWeight.w700, color: Colors.blueGrey),
                          ),
                        ],
                      ),
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
                                SizedBox(height: screenWidth(context, dividedBy: 10)),
                                Text('18 Abr 2021 - 15:00 Hrs.', style: mainStyle),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).pricingDetails,
                            style: mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const Spacer(),
                          MaterialButton(
                            elevation: 0,
                            height: 30,
                            color: Colors.blueGrey,
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            highlightColor: const Color(0xffE8ECFB),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(AppLocalizations.of(context).pay,
                                style: mainStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(width: 5),
                          MaterialButton(
                            elevation: 0,
                            height: 30,
                            color: Colors.red,
                            onPressed: () {
                              showCancelDialog(context);
                            },
                            padding: EdgeInsets.zero,
                            highlightColor: const Color(0xffE8ECFB),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(AppLocalizations.of(context).cancel,
                                style: mainStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      Divider(color: ResColors.dividerColor),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context).quantity, style: mainStyle),
                                const SizedBox(height: 5),
                                Text('1', style: hintStyle),
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
                                Text(AppLocalizations.of(context).consultationLong, style: hintStyle),
                                const SizedBox(height: 5),
                                Text('Limpieza Dental', style: hintStyle)
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
                                Text('\$3000 M.X.N', style: hintStyle, textDirection: TextDirection.ltr),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: const CameraPosition(target: LatLng(39.9560861, -3.5033035)),
                            zoomControlsEnabled: false,
                            minMaxZoomPreference: const MinMaxZoomPreference(14, 20),
                            onMapCreated: (GoogleMapController controller) {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(color: ResColors.dividerColor),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context).additionalInformation,
                        style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ).viewPadding(left: 16, right: 16, top: 20, bottom: 50)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showCancelDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(AppLocalizations.of(ctx).youWantToCancel + '?',
                  style: mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: MaterialButton(
                      elevation: 0,
                      height: 40,
                      color: Colors.redAccent,
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      padding: EdgeInsets.zero,
                      highlightColor: const Color(0xffE8ECFB),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Text('No', style: mainStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      elevation: 0,
                      height: 40,
                      color: Colors.greenAccent,
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const AppointmentDetailPage(true)),
                        );
                      },
                      padding: EdgeInsets.zero,
                      highlightColor: const Color(0xffE8ECFB),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Text('Yes', style: mainStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
