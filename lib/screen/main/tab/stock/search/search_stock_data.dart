import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider{
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];

  // 동적으로 리스트가 변할 때마다 화면을 자동으로 그려주는 Getx list
  // 명확한 타입을 앞에 넣어주고, 뒤에 .obs를 추가해준다.
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  // Getx가 호출이 될 때 최초로 호출이 되는 함수
  @override
  void onInit() {
    // 어떤 텍스트가 입력되는지 이벤트를 전달받을 수 있어야한다.
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();
    super.onInit();
  }

  //async하게 동작하기 위해서 Future함수로 만들어준다.
  Future<void> loadLocalStockJson() async {
    // 명확하게 SimpleStock을 구분하기 위해서 타입을 고정시켜줌
    final jsonList =
        await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    // 검색할 때마다 stocks를 확인하여 keyword가 있는지 확인하여 List에 들어가고, autoCompleteList에 들어가게 된다.
    if(keyword.isEmpty){
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value =
        stocks.where((element) => element.name.contains(keyword)).toList();
    // 그냥 값을 toString하면 객체가 호출된다. SimpleStock에 toString을 overiding해준다.
    //debugPrint(autoCompleteList.toString() + autoCompleteList.length.toString());
  }

  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    searchHistoryList.remove(stockName);
    //searchHistoryList.removeWhere((element) => element.id == stockName.id);
  }
}
