import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/home/service_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  List<String> weekdays = ['D', 'L', 'M', 'M', 'J', 'V', 'S'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).doctorProfile, context, hasBackBtn: true),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: ClipOval(
                            child: Image.asset('images/doctor.jpeg', width: screenWidth(context, dividedBy: 3)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text('Roberto Delgadillo', style: titleStyle.copyWith(fontSize: 20)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration:
                              BoxDecoration(color: ResColors.primaryColor, borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Text('3', style: titleStyle.copyWith(color: Colors.white, fontSize: 24)),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      AppLocalizations.of(context).patients,
                                      style: hintStyle.copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: Text('7', style: titleStyle.copyWith(color: Colors.white, fontSize: 24)),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      AppLocalizations.of(context).yearsOfExp,
                                      style: hintStyle.copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      child: SvgPicture.asset(
                                        'images/star.svg',
                                        color: Colors.yellow,
                                        width: 30,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text('4', style: hintStyle.copyWith(color: Colors.white))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(height: 1, thickness: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 20),
                        Text(AppLocalizations.of(context).aboutMe, style: titleStyle),
                        const SizedBox(height: 5),
                        Text(AppLocalizations.of(context).doctor, style: hintStyle),
                        const SizedBox(height: 10),
                        Row(children: [
                          Text('10M.X.N',
                              style: mainStyle.copyWith(color: ResColors.primaryColor, fontWeight: FontWeight.w600)),
                          Text('/${AppLocalizations.of(context).consultation}', style: hintStyle),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            color: ResColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              AppLocalizations.of(context).addToCart,
                              style: mainStyle.copyWith(color: Colors.white),
                            ),
                          )
                        ]),
                        const SizedBox(height: 10),
                        Divider(height: 1, thickness: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context).services, style: hintStyle),
                            const Spacer(),
                            MaterialButton(
                              onPressed: () {},
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                AppLocalizations.of(context).seeMore,
                                style: mainStyle.copyWith(color: ResColors.primaryColor, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
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
                                        Text('Roberto Delgadillo', style: mainStyle),
                                        Text(AppLocalizations.of(context).neurologist, style: hintStyle),
                                        const Spacer(),
                                        Text(AppLocalizations.of(context).consultation, style: hintStyle),
                                        const Spacer(),
                                        Row(children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Text(
                                              '10M.X.N',
                                              style: mainStyle.copyWith(
                                                  color: ResColors.mainTextColor, fontWeight: FontWeight.w600),
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 15,
                                              itemPadding: EdgeInsets.zero,
                                              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ]),
                                          Expanded(
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => const ServiceDetailsPage()));
                                              },
                                              elevation: 0,
                                              color: ResColors.primaryColor,
                                              padding: const EdgeInsets.all(0),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                              child: Text(
                                                AppLocalizations.of(context).add,
                                                style: mainStyle.copyWith(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10)
                                        ]),
                                        const SizedBox(height: 20)
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(height: 10),
                        Divider(height: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context).gallery, style: hintStyle),
                        const SizedBox(height: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'images/neurology.jpeg',
                            width: screenWidth(context, dividedBy: 2),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Divider(height: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).location, style: hintStyle),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 200,
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
                        const SizedBox(height: 15),
                        Divider(height: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).schedules, style: hintStyle),
                        const SizedBox(height: 15),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: screenWidth(context, dividedBy: 10), maxWidth: double.infinity),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: weekdays.length,
                            itemBuilder: (context, index) => weekDay(context, weekdays[index]),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Divider(height: 1, color: ResColors.dividerColor),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).reviewAndRatings, style: hintStyle),
                        const SizedBox(height: 15),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: screenWidth(context, dividedBy: 4)),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset('images/client.jpeg', width: screenWidth(context, dividedBy: 4)),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text('Alberto Ramirez', style: mainStyle),
                                      const Spacer(),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding: EdgeInsets.zero,
                                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text('2021-04-05', style: hintStyle),
                                  const Spacer(),
                                  Text(AppLocalizations.of(context).veryGoodDoctor, style: hintStyle),
                                  const SizedBox(height: 15),
                                ],
                              )),
                              const SizedBox(height: 20),
                              MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                minWidth: 30,
                                height: 30,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                child: SvgPicture.asset('images/dots.svg', color: Colors.black, width: 20, height: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
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

  Widget weekDay(context, String title) {
    double size = screenWidth(context, dividedBy: 10);
    double margin = screenWidth(context, dividedBy: 65);
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.only(left: margin, right: margin),
      decoration: BoxDecoration(color: ResColors.primaryColor, borderRadius: BorderRadius.circular(size / 2)),
      child: Center(child: Text(title, style: mainStyle.copyWith(color: Colors.white))),
    );
  }
}
