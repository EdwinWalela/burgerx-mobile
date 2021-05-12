import 'package:burgers/src/mixins/validators.dart';
import 'package:burgers/src/models/Cart_Item.dart';
import 'package:burgers/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends Validators {
  final _repository = Repository();

  // StreamControllers
  final _cart = BehaviorSubject<CartItem>();
  final _dbCart = BehaviorSubject<List<CartItem>>();

  // Getters
  Function(CartItem) get addItem => _cart.sink.add;
  Stream<CartItem> get cart => _cart.stream;

  Function(List<CartItem>) get getCart => _dbCart.sink.add;
  Stream<List<CartItem>> get dbCart => _dbCart.stream;

  addToCart() async {
    await _repository.addToCart(_cart.value);
    await _repository.fetchCart();
  }

  dispose() {
    _cart.close();
    _dbCart.close();
  }
}
