import 'package:doctor_profile/entity/coupon.dart';
import 'package:doctor_profile/tools/common_widgets.dart';
import 'package:doctor_profile/tools/res_colors.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  List<Coupon> coupons = [
    Coupon(114, '23 May 2022', 10),
    Coupon(103, '22 May 2022', 100),
    Coupon(90, '21 May 2022', 20),
    Coupon(87, '20 May 2022', 40),
    Coupon(65, '10 May 2022', 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(AppLocalizations.of(context).coupons, context, hasBackBtn: true),
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
                          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                          itemCount: coupons.length,
                          separatorBuilder: (context, index) => Divider(color: ResColors.dividerColor, height: 1),
                          itemBuilder: (context, index) {
                            var coupon = coupons[index];
                            return SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        '#${coupon.id}',
                                        style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'M.X.N \$${coupon.price}',
                                        style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(coupon.date, style: hintStyle),
                                  const SizedBox(height: 10),
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
