import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/scheduler/ticker.dart';

class TabProvider extends ChangeNotifier implements TickerProvider {
  late TabController _tabController;

  TabProvider() {
    _tabController = TabController(length: 2, vsync: this);
  }

  TabController get tabController => _tabController;

  Future<void> setIndex(int index) async {
    _tabController.animateTo(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    try {
      return Ticker(onTick);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
