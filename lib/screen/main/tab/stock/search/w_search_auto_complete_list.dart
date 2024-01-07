import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:velocity_x/velocity_x.dart';

import 's_stock_detail.dart';
import 'search_stock_data.dart';

class SearchAutoCompleteList extends StatelessWidget
    with SearchStockDataProvider {
  final TextEditingController controller;
  // const를 지워서 상수가 아닌 일반 생성자로 변경하여 late 변수가 동작할 수 있도록 한다.
  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchData.autoCompleteList.length,
        itemBuilder: (context, index) {
          final stock = searchData.autoCompleteList[index];
          final stockName = stock.name;
          return Tap(
            onTap: () {
              controller.clear();
              searchData.addHistory(stock);
              Nav.push(StockDetailScreen(stockName));
            },
            child: stockName.text.make().p(20),
          );
        });
    //searchData.autoCompleteList[index].stockName.text.make());
  }
}
