abstract class CategoriesEvents{}
class GetCategories extends CategoriesEvents{}

class SelectCategory extends CategoriesEvents{
  final String name;

  SelectCategory({required this.name});
}