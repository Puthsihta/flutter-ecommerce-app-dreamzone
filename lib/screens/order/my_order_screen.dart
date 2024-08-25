// ignore: file_names
import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/order-_ist_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/order/my_order_controller.dart';
import 'package:dreamzone/screens/order_detail/order_detail_screen.dart';
import 'package:dreamzone/widgets/butoom_loading.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render_order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  late MyOrderController _orderListController;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _orderListController.getOrderList();
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              MyOrderController(orderListRepo: locator<OrderListRepo>())
                ..getOrderList(),
        ),
      ],
      child: Consumer<MyOrderController>(
          builder: (context, orderListController, child) {
        _orderListController = orderListController;
        if (orderListController.status == HomeStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (orderListController.status == HomeStatus.error) {
          return SizedBox(
            child: FetchError(
              errorMessage: orderListController.error.toString(),
              onRetry: () => orderListController.getOrderList(),
            ),
          );
        }
        if (orderListController.orderLists.isEmpty) {
          return const SizedBox(
            child: NoItem(),
          );
        }
        return RefreshIndicator(
          onRefresh: () => orderListController.getOrderList(refresh: true),
          child: ListView.builder(
            controller: scrollController,
            itemCount: orderListController.hasReachedMax
                ? orderListController.orderLists.length + 1
                : orderListController.orderLists.length,
            itemBuilder: (context, index) {
              return index >= orderListController.orderLists.length
                  ? const BottomLoader()
                  : renderOrderItem(context, index, orderListController);
            },
          ),
        );
      }),
    );
  }

  Widget renderOrderItem(
      BuildContext context, int index, MyOrderController orders) {
    return RenderOrderItem(
      order: orders.orderLists,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          OrderDetailScreen.routeName,
          arguments: OrderDetailArgument(orders.orderLists[index].id!),
        );
      },
    );
  }
}
