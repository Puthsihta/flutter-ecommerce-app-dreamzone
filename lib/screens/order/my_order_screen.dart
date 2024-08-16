// ignore: file_names
import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/order-_ist_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/order/my_order_controller.dart';
import 'package:dreamzone/screens/order_detail/order_detail_screen.dart';
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
  late MyOrderController orderListController;
  final scrollController = ScrollController();
  double boundaryOffset = 0.8;

  void scrollListener() {
    scrollController.addListener(() {
      final nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        orderListController.onFetchNextPage();
      }
    });
  }

  @override
  void initState() {
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          MyOrderController(orderListRepo: locator<OrderListRepo>())
            ..onGetOrderList(),
      child: Consumer<MyOrderController>(
          builder: (context, orderListController, child) {
        if (orderListController.loadingInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (orderListController.error != null) {
          return SizedBox(
            child: FetchError(
              errorMessage: orderListController.error.toString(),
              onRetry: () => orderListController.onGetOrderList(),
            ),
          );
        }
        if (orderListController.orderLists.isEmpty) {
          return const SizedBox(
            child: NoItem(),
          );
        }
        return RefreshIndicator(
          onRefresh: () => orderListController.onGetOrderList(refresh: true),
          child: ListView.builder(
              itemCount: orderListController.orderLists.length,
              itemBuilder: (context, index) {
                if (index == orderListController.orderLists.length) {
                  if (orderListController.loadingFetchNext) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (!orderListController.hasNextPage) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: Text("No more data"),
                      ),
                    );
                  }
                  return const SizedBox();
                }
                return renderOrderItem(context, index, orderListController);
              }),
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
