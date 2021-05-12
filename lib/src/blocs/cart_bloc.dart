import 'package:burgers/src/mixins/validators.dart';
import 'package:burgers/src/models/Cart_Item.dart';
import 'package:burgers/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _cart = BehaviorSubject<CartItem>();
  final _dbCart = BehaviorSubject<List>();

  // Getters
  Function(CartItem) get addItem => _cart.sink.add;
  Stream<CartItem> get cart => _cart.stream;

  Function(List) get getCart => _dbCart.sink.add;
  Stream<List> get dbCart => _dbCart.stream;

  addToCart() async {
    await _repository.addToCart(_cart.value);
    final cart = await _repository.fetchCart();
    getCart(cart);
  }

  dispose() {
    _cart.close();
    _dbCart.close();
  }
}
