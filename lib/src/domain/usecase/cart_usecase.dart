import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/domain/entities/cart_items_entity.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class CartUC implements UseCase<CartItemsEntity, Params> {
  final Repository repository;

  List<CartModel> cartItem = List<CartModel>();

  CartUC(this.repository);
  @override
  Future<Either<Failure, List<CartItemsEntity>>> call(Params parms) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItemsEntity>>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItemsEntity>>> post(Params parm) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItemsEntity>>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }

  fetchCart() async => repository.getCartList();
  clearCart() async => repository.clearCart();
  addToCart(CartModel model) async {
    cartItem.add(CartModel(
        productid: model.productid,
        unitprice: model.unitprice,
        totalprice: model.totalprice,
        productimg: model.productimg,
        discount: model.discount,
        quantity: model.quantity,
        productname: model.productname));
    await repository.addToCart(cartItem);
    await cartItem.clear();
  }

  updateCartItems({int id, int price, int qty}) async =>
      repository.updateCartItems(id: id, price: price, qty: qty);
  removeFromCart(int id) => repository.removeFromCart(id);
  Future<int> cartTotal() async => repository.CartTotal();
}
