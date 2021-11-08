import 'package:doctor_profile/entity/voucher.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentVouchersPage extends StatefulWidget {
  const PaymentVouchersPage({Key? key}) : super(key: key);

  @override
  _PaymentVouchersPageState createState() => _PaymentVouchersPageState();
}

class _PaymentVouchersPageState extends State<PaymentVouchersPage> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  late TabController _tabController;

  List<Voucher> vouchers = [
    Voucher('tarjete de debito/credito', 130.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Finalizado'),
    Voucher('tarjete de debito/credito', 410.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Cancelado'),
    Voucher('tarjete de debito/credito', 150.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Finalizado'),
    Voucher('tarjete de debito/credito', 2310.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Cancelado'),
    Voucher('tarjete de debito/credito', 1000.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Cancelado'),
    Voucher('tarjete de debito/credito', 4540.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Finalizado'),
    Voucher('tarjete de debito/credito', 3430.0, '2021-03-17 11:25:23', 'Consultation', 'MEXICALI, BAJA, CALIFORNIA',
        'Finalizado'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).paymentVouchers, context, hasBackBtn: true),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: TabBar(
                            controller: _tabController,
                            onTap: (index) {
                              _controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            labelStyle: mainStyle.copyWith(color: ResColors.primaryColor, fontWeight: FontWeight.w600),
                            tabs: [
                              Tab(text: AppLocalizations.of(context).finished),
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
                            var list = vouchers;
                            if (index == 0) {
                              list = vouchers.where((element) => element.status == 'Finalizado').toList();
                            } else {
                              list = vouchers.where((element) => element.status == 'Cancelado').toList();
                            }
                            return ListView.separated(
                                shrinkWrap: true,
                                itemCount: list.length,
                                separatorBuilder: (context, index) => Divider(color: ResColors.dividerColor, height: 1),
                                itemBuilder: (context, index) {
                                  var voucher = list[index];
                                  return Container(
                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(voucher.name, style: mainStyle.copyWith(fontWeight: FontWeight.w600)),
                                            const Spacer(),
                                            Text('M.X.N \$${voucher.price}',
                                                style: mainStyle.copyWith(fontWeight: FontWeight.w600))
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text('-' + voucher.date, style: hintStyle),
                                            const Spacer(),
                                            Text(voucher.status, style: hintStyle)
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Text('-' + voucher.type, style: hintStyle),
                                        const SizedBox(height: 3),
                                        Text('-' + voucher.address, style: hintStyle),
                                      ],
                                    ),
                                  );
                                });
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
