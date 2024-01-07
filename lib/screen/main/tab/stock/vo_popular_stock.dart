import 'stock_percentage_data_provider.dart';
import 'vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider {
  @override
  final int yesterdayClosePrice;
  final int currentPrice;

  PopularStock(
      {required String stockName,
      required this.yesterdayClosePrice,
      required this.currentPrice})
      : super(stockName);
}
