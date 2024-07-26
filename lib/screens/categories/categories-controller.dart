import 'package:dreamzone/data/models/category.dart';
import 'package:dreamzone/data/repos/categories_repo.dart';
import 'package:flutter/foundation.dart';

class CategoriesScreenController extends ChangeNotifier {
  final CategoriesRespo categoriesRepo;

  CategoriesScreenController({required this.categoriesRepo});

  Categories? _subCateData;
  bool loading = true;
  Categories? get subCateData => _subCateData;
  set subCateData(Categories? data) {
    _subCateData = data;
    notifyListeners();
  }

  Future<void> getSubCategoriesData(int cateId) async {
    try {
      loading = true;
      final data = await categoriesRepo.getSubCategories(cateId);
      subCateData = data;
      loading = false;
    } catch (e) {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        print('erro get categories : $e');
      }
    }
  }
}
