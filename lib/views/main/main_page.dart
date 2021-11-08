import 'package:doctor_profile/views/appointments/appointments_page.dart';
import 'package:doctor_profile/views/favourites/favourites_page.dart';
import 'package:doctor_profile/views/home/home_page.dart';
import 'package:doctor_profile/views/main/menu_item.dart';
import 'package:doctor_profile/views/payments/payments_page.dart';
import 'package:doctor_profile/views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController(keepPage: true);

  List<Widget> screens = const [HomePage(), FavouritesPage(), AppointmentsPage(), PaymentsPage(), ProfilePage()];
  List<String> icon = ['catalog', 'favourites', 'add', 'appointment', 'profile'];
  int pos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned.fill(
            top: 0,
            bottom: 55,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() {
                pos = index;
              }),
              controller: _controller,
              itemCount: screens.length,
              itemBuilder: (context, int index) => screens[index],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 20,
              shadowColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: SizedBox(height: 60, child: Row(children: List.generate(screens.length, menuItem))),
            ),
          ),
        ]),
      ),
    );
  }

  Widget menuItem(index) => MenuItem(
        icon[index],
        pos == index,
        () => _controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
      );

  static const Radius itemRadius = Radius.circular(1);
}
