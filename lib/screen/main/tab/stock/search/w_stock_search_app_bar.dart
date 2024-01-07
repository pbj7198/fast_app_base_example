import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const StockSearchAppBar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: const SizedBox(
                width: 56,
                height: kToolbarHeight,
                child: Arrow(
                  direction: AxisDirection.left,
                ),
              ),
            ),
            Expanded(
              child: TextFieldWithDelete(
                controller: controller,
                textInputAction: TextInputAction.search, // 키보드를 체크표시에서 검색표시로 변경
                texthint: "'커피'를 검색해보세요",
                onEditingComplete: () {
                  debugPrint('검색 확인버튼');
                  AppKeyboardUtil.hide(context); // 검색버튼을 누르면 사라지게 만듬
                },
              ).pOnly(top: 6),
            ),
            width20,
          ],
        ),
      ),
    );
  }

  // kToolbarHeight: 디자인 가이드에 따른 높이
  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
