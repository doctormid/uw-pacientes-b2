import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:doctor_profile/views/payments/coupons_page.dart';
import 'package:doctor_profile/views/payments/payment_vouchers_page.dart';
import 'package:doctor_profile/views/payments/pending_payments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).payments, context),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        menuItem(AppLocalizations.of(context).paymentVouchers, onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const PaymentVouchersPage()));
                        }),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).pendingPayments, onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const PendingPaymentsPage()));
                        }),
                        Divider(color: ResColors.dividerColor, height: 1),
                        menuItem(AppLocalizations.of(context).pageCoupons, onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const CouponsPage()));
                        }),
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

  Widget menuItem(String title, {Function? onClick}) => MaterialButton(
      onPressed: () => onClick?.call(),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Text(title, style: mainStyle),
          const Spacer(),
          SvgPicture.asset('images/next.svg', width: 20, color: ResColors.mainTextColor),
          const SizedBox(width: 16)
        ],
      ));
}
