import 'package:get_it/get_it.dart';
import 'package:live_auction/core/viewModels/auction_viewmodel.dart';

import 'core/api/api.dart';

final locator = GetIt.instance;

void setupLocator(){
  locator.registerSingleton<Api>(Api('auctions'));
  locator.registerSingleton<AuctionViewModel>(AuctionViewModel());
}