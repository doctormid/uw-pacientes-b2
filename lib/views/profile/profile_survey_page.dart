import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSurveyPage extends StatefulWidget {
  const ProfileSurveyPage({Key? key}) : super(key: key);

  @override
  _ProfileSurveyPageState createState() => _ProfileSurveyPageState();
}

class _ProfileSurveyPageState extends State<ProfileSurveyPage> {
  List<String> diseases = [];

  @override
  void didChangeDependencies() {
    diseases = getDiseases(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).profile, context, hasBackBtn: true),
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
                            Text(AppLocalizations.of(context).personalInformation,
                                style: mainStyle.copyWith(fontWeight: FontWeight.w700)),
                            const Spacer(),
                            Text(
                              AppLocalizations.of(context).edit,
                              style: mainStyle.copyWith(fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).nationality, style: mainStyle),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButton<String>(
                                      value: 'Nationalidad',
                                      isExpanded: true,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      style: mainStyle,
                                      underline: const SizedBox(),
                                      onChanged: (_) {},
                                      items: ['Nationalidad'].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).bloodType, style: mainStyle),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButton<String>(
                                      value: 'A+',
                                      isExpanded: true,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      style: mainStyle,
                                      underline: const SizedBox(),
                                      onChanged: (_) {},
                                      items: ['A+'].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).bloodType, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
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
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).allergies, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
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
                        const SizedBox(height: 15),
                        question(AppLocalizations.of(context).haveYouBeenHospitalized),
                        const SizedBox(height: 15),
                        question(AppLocalizations.of(context).haveYouBeenUnderMedicalCare),
                        const SizedBox(height: 15),
                        question(AppLocalizations.of(context).areYouAllergic),
                        const SizedBox(height: 15),
                        question(AppLocalizations.of(context).haveYouHadBleeding),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).haveYouHadDiseases, style: mainStyle),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: diseases.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 30,
                              width: 150,
                              child: CheckboxListTile(
                                title: Text(diseases[index], style: mainStyle),
                                checkColor: Colors.white,
                                activeColor: ResColors.primaryColor,
                                value: index % 2 == 0,
                                onChanged: (bool? value) {},
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 25),
                        question(AppLocalizations.of(context).areYouTakingMedicine),
                        const SizedBox(height: 15),
                        question(AppLocalizations.of(context).areYouPregnant),
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).lastVisitDentist, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
                              hintText: '2020-03-10',
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
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).emergencyNumber, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
                              hintText: '3125955906',
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
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).name, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
                              hintText: 'Gerardo Ramirez',
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
                        const SizedBox(height: 15),
                        Text(AppLocalizations.of(context).relationShip, style: mainStyle),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 45,
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blueGrey.shade50,
                              hintText: 'Hermano',
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
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          height: 50,
                          minWidth: double.infinity,
                          color: ResColors.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            AppLocalizations.of(context).keep,
                            style: mainStyle.copyWith(color: Colors.white),
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

  List<String> getDiseases(BuildContext context) {
    return [
      AppLocalizations.of(context).tuberculosis,
      AppLocalizations.of(context).pacemaker,
      AppLocalizations.of(context).diabetes,
      AppLocalizations.of(context).fever,
      AppLocalizations.of(context).anemia,
      AppLocalizations.of(context).arthritis,
      AppLocalizations.of(context).rheumatic,
      AppLocalizations.of(context).cardiac,
      AppLocalizations.of(context).psychic,
      AppLocalizations.of(context).treatment,
      AppLocalizations.of(context).hepatitis,
      AppLocalizations.of(context).hypertension,
      AppLocalizations.of(context).stroke,
      AppLocalizations.of(context).weightLoss,
      AppLocalizations.of(context).vascularAccident,
      AppLocalizations.of(context).epilepsy,
      AppLocalizations.of(context).injury,
      AppLocalizations.of(context).cancer
    ];
  }

  Widget question(String question) {
    return Row(
      children: [
        Expanded(child: Text(question, style: mainStyle)),
        const SizedBox(width: 10),
        Container(
          height: 45,
          width: 75,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: 'No',
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            style: mainStyle,
            underline: const SizedBox(),
            onChanged: (_) {},
            items: ['No', 'Yes'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
