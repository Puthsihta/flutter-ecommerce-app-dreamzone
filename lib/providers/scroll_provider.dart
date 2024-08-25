import 'package:flutter/cupertino.dart';

class ScrollProvider extends ChangeNotifier {
  late ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ScrollProvider(ScrollController scrollController) {
    _scrollController = scrollController;
  }

  Future<void> scrollToTop(int index) async {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
