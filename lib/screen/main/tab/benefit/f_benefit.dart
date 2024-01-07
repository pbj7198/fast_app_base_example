import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_height_and_width.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/benefit_dummy.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';

import 'w_benefit_item.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MainScreenState.bottomNavigatorHeight),
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,
            "혜택".text.white.bold.size(18).make(),
            height30,
            const PointButton(
              point: 569,
            ),
            height20,
            "혜택 더 받기".text.white.bold.size(16).make(),
            ...benefitList
                .map((element) => BenefitItem(benefit: element))
                .toList(),
          ],
        ).pSymmetric(h: 20),
      ),
    );
  }
}
