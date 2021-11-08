import 'package:doctor_profile/entity/appointment.dart';
import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/appointments/services_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  late TabController _tabController;

  List<Appointment> appointments = [
    Appointment('Dr. Roberto Delgadillo', 20.00, 1, '24 Jun 2021 - 19:00 Hrs', Appointment.upcoming),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '23 Jun 2021 - 19:00 Hrs', Appointment.upcoming),
    Appointment('Dr. Roberto Delgadillo', 20.00, 1, '23 Jun 2021 - 15:00 Hrs', Appointment.upcoming),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '23 Jun 2021 - 13:00 Hrs', Appointment.rejected),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '22 Jun 2021 - 11:00 Hrs', Appointment.canceled),
    Appointment('Dr. Roberto Delgadillo', 20.00, 1, '22 Jun 2021 - 119:00 Hrs', Appointment.finished),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '22 Jun 2021 - 15:00 Hrs', Appointment.canceled),
    Appointment('Dr. Roberto Delgadillo', 20.00, 1, '21 Jun 2021 - 10:00 Hrs', Appointment.finished),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '20 Jun 2021 - 19:00 Hrs', Appointment.canceled),
    Appointment('Dr. Selgio Palacios', 20.00, 1, '19 Jun 2021 - 11:00 Hrs', Appointment.finished),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).myDates, context),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 4,
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: TabBar(
                            controller: _tabController,
                            onTap: (index) {
                              _controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                            },
                            labelStyle: mainStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                            tabs: [
                              Tab(text: AppLocalizations.of(context).all),
                              Tab(text: AppLocalizations.of(context).previous),
                              Tab(text: AppLocalizations.of(context).upcoming),
                              Tab(text: AppLocalizations.of(context).canceled),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (index) {
                            _tabController.animateTo(index, duration: const Duration(milliseconds: 300));
                          },
                          itemBuilder: (context, index) {
                            var apps = appointments;
                            String? status;
                            if (index == 1) {
                              apps = apps.where((item) => item.status == Appointment.finished).toList();
                            } else if (index == 2) {
                              apps = apps.where((item) => item.status == Appointment.upcoming).toList();
                            } else if (index == 3) {
                              apps = apps
                                  .where((item) =>
                                      item.status == Appointment.rejected || item.status == Appointment.canceled)
                                  .toList();
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: apps.length,
                              padding: const EdgeInsets.only(top:15, bottom: 20),
                              itemBuilder: (context, index) {
                                var app = apps[index];
                                return MaterialButton(
                                  elevation: 10,
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ServicesPage()));
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: ResColors.dividerColor)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(app.doctor, style: mainStyle.copyWith(fontWeight: FontWeight.w600)),
                                          const Spacer(),
                                          Text('\$${app.price} M.X.N',
                                              style: mainStyle.copyWith(fontWeight: FontWeight.w700, color: app.statusColor()))
                                        ],
                                      ),
                                      Text('${AppLocalizations.of(context).consultation} +${app.consultation}'),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: app.statusColor(),
                                            ),
                                            padding: const EdgeInsets.only(top: 2, bottom: 2, left: 6, right: 6),
                                            child: Text(app.statusText(context), style: mainStyle.copyWith(color: Colors.white)),
                                          ),
                                          const Spacer(),
                                          Text(app.date, style: hintStyle)
                                        ],
                                      )
                                    ],
                                  ).viewPadding(left: 5, right: 5, top: 10, bottom: 10),
                                ).viewPadding(left: 16, right: 16, top: 5, bottom: 5);
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
