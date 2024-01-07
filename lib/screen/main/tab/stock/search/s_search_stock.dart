import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_stock_data.dart';
import 'w_popular_search_stock_list.dart';
import 'w_search_auto_complete_list.dart';
import 'w_search_history_stock_list.dart';
import 'w_stock_search_app_bar.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockDataProvider{
  final controller = TextEditingController();

  // 여기 변수는 state가 생성이 될 때 최초에 초기화가 된다. 때문에 late키워드를 이용한다.
  // late를 사용하면 searchData가 사용이 필요해진 시점에 초기화가 된다. -> initState에서 searchData.search가 호출될 때 실행되어 find하여 객체를 받아오게 된다.
  //late final searchData = Get.find<SearchStockData>();
  // SearchStockScreen이 최초에 생성이 될 때 getxController를 상속하고 있는 내가 만든 데이터가 등록되어야 한다.
  // 일반적으로 initState 함수에서 함수를 호출
  // 생성자가 생성될 때 호출되는 state가 아니다. 때문에 생성된 후 나중에 put이 된다.
  @override
  void initState() {
    Get.put(SearchStockData());
    // controller에 Listener를 달아주도록 한다. controller에 어떤 이벤트 변화가 올때마다 여기 안에 적힌 함수가 수행이 된다.
    controller.addListener(() {
      searchData.search(controller.text);
    });
    super.initState();
  }

  // 화면을 벗어날때 data를 제거해주는 코드
  // 제네릭을 통해서 지우고자하는 데이터 클래스 타입을 넣어주면 된다.
  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: controller,
      ),
      // Obx를 사용하면 setState를 사용하지 않고도, 입력할 때마다 업데이트가 가능하다.
      // get Controller의 rx변수들을 관찰하면서 변화가 있을 때마다 안에 있는 내용이 갱신이 된다.
      // setState를 실행하게 되면 Widget build메소드 전체가 다시 실행하게 된다. -> 불필요한 실행
      body: Obx(
        () => searchData.autoCompleteList.isEmpty
            ? ListView(
                children: [
                  const SearchHistoryStockList(),
                  const PopularSearchStockList(),
                ],
              )
            : SearchAutoCompleteList(controller),
      ),
    );
  }
}
