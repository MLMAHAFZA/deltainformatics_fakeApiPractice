abstract class HomeEvents{}

class GetProductsHome extends HomeEvents{}

class SearchProductHome extends HomeEvents{
  String ?txt ;

  SearchProductHome(this.txt);
}