import 'package:doctor_profile/entity/clinic.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Clinic> clinics = [
    Clinic('Mexicali, Baja California', "images/clinic1.png", 8),
    Clinic('Tijuana, Baja California', "images/clinic2.jpeg", 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).favourites, context, hasBackBtn: true),
            Divider(color: ResColors.dividerColor),
            searchBar(AppLocalizations.of(context).search),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    itemCount: clinics.length,
                    itemBuilder: (context, index) {
                      var clinic = clinics[index];
                      return Container(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(clinic.imagePath),
                            ),
                            const SizedBox(height: 10),
                            Text(clinic.name, style: mainStyle),
                            const SizedBox(height: 10),
                            Text('${clinic.serviceCount} ${AppLocalizations.of(context).services}', style: hintStyle),
                          ],
                        ),
                      );
                    },
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
