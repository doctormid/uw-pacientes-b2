import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/screen_tools.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _isMan = true;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ResColors.primaryColor,
              child: appBar(AppLocalizations.of(context).editProfile, context, hasBackBtn: true),
            ),
            const SizedBox(height: 15),
            Center(
              child: ClipOval(
                child: Image.asset('images/client.jpeg', width: screenWidth(context, dividedBy: 3)),
              ),
            ),
            const SizedBox(height: 10),
            details(AppLocalizations.of(context).name),
            const SizedBox(height: 10),
            details('Apellido'),
            const SizedBox(height: 10),
            details('user@gmail.com'),
            const SizedBox(height: 10),
            details('1997-11-30'),
            Text(AppLocalizations.of(context).sex, style: mainStyle).viewPadding(left: 16),
            SizedBox(
              height: 30,
              width: 150,
              child: CheckboxListTile(
                title: Text(AppLocalizations.of(context).man),
                checkColor: Colors.white,
                activeColor: ResColors.primaryColor,
                value: _isMan,
                onChanged: (bool? value) {
                  setState(() {
                    _isMan = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
              width: 150,
              child: CheckboxListTile(
                title: Text(AppLocalizations.of(context).woman),
                checkColor: Colors.white,
                activeColor: ResColors.primaryColor,
                value: !_isMan,
                onChanged: (bool? value) {
                  setState(() {
                    _isMan = !value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: 'Mexico',
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      isExpanded: true,
                      style: mainStyle,
                      underline: const SizedBox(),
                      onChanged: (_) {},
                      items: ['Mexico'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: 'COLIMA',
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: mainStyle,
                      underline: const SizedBox(),
                      onChanged: (_) {},
                      items: ['COLIMA'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: 'COLIMA',
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: mainStyle,
                      underline: const SizedBox(),
                      onChanged: (_) {},
                      items: ['COLIMA'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: 'Ingles',
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: mainStyle,
                      underline: const SizedBox(),
                      onChanged: (_) {},
                      items: ['Ingles'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
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
              child: Text(AppLocalizations.of(context).send, style: mainStyle.copyWith(color: Colors.white),),
            ).viewPadding(left: 16, right: 16),
          ],
        )
      ),
    );
  }

  Widget details(String hint) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey.shade50,
          hintText: hint,
          hintStyle: hintStyle,
          prefixIconConstraints: const BoxConstraints(maxHeight: 16, minWidth: 40),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 5, top: 0),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
