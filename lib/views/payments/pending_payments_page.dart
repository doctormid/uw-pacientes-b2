import 'package:doctor_profile/entity/voucher.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PendingPaymentsPage extends StatefulWidget {
  const PendingPaymentsPage({Key? key}) : super(key: key);

  @override
  _PendingPaymentsPageState createState() => _PendingPaymentsPageState();
}

class _PendingPaymentsPageState extends State<PendingPaymentsPage> {
  List<Voucher> payments = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).pendingPayments, context, hasBackBtn: true),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 20),
                          itemCount: payments.length,
                          separatorBuilder: (context, index) => Divider(color: ResColors.dividerColor, height: 1),
                          itemBuilder: (context, index) {
                            var voucher = payments[index];
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
                                  Text('-' + voucher.date, style: hintStyle),
                                  const SizedBox(height: 3),
                                  Text('-' + voucher.type, style: hintStyle),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Text('-' + voucher.address, style: hintStyle),
                                      const Spacer(),
                                      MaterialButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        color: ResColors.primaryColor,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        child: Text(
                                          AppLocalizations.of(context).pay,
                                          style: mainStyle.copyWith(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
