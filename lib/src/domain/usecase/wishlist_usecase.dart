import 'package:bulk_buyers/src/domain/repository/repository.dart';

class WishListUC {
  final Repository repository;

  WishListUC(this.repository);

  updateWishList({int id, bool state}) async =>
      repository.updateWishList(id: id, state: state);

  fetchWishList() async => await repository.fetchWishList();
}
