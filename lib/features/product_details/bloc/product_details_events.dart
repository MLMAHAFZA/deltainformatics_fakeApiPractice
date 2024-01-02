abstract class ProductDetailsEvents{}

class GetProductDetailsEvent extends ProductDetailsEvents{
  final int ?id;

  GetProductDetailsEvent({required this.id});
}