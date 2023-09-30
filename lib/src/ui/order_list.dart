import 'package:flutter/material.dart';
import 'package:retail_app/src/models/order.dart';
import 'package:retail_app/src/ui/create_order.dart';
import 'package:retail_app/src/utils/extenstions.dart';
import 'package:retail_app/src/utils/isar_service.dart';
import 'package:retail_app/src/utils/utils.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<Order> _orderList = [];
  int index = 1;
  List<DataColumn> listOfColumns = const [
    DataColumn(label: Text("#")),
    DataColumn(label: Text("Order No")),
    DataColumn(label: Text("Order Name")),
    DataColumn(label: Text("Amount")),
    DataColumn(label: Text("Status")),
    DataColumn(label: Text("Action")),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Orders", style: TextStyle(fontSize: 15)),
            const Spacer(),
            TextButton(
              onPressed: () => _showAddUpdateDialog(),
              child: const Text("New Order"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: context.orderStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            index = 1;
            _orderList = snapshot.data != null ? snapshot.data! : [];

            return Expanded(
              child: InteractiveViewer(
                constrained: false,
                child: DataTable(
                  dataRowColor:
                      MaterialStateProperty.resolveWith(_getDataRowColor),
                  dividerThickness: 1,
                  showCheckboxColumn: false,
                  showBottomBorder: true,
                  columns: listOfColumns,
                  rows: _orderList
                      .map<DataRow>(
                        (e) => _getRow(index++, e),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  DataRow _getRow(int index, Order order) {
    List<DataCell> listOfCells = [
      DataCell(Text(index.toString())),
      DataCell(Text(order.orderNo.toString())),
      DataCell(Text(order.name)),
      DataCell(Text(order.netRound.toStringAsFixed(2))),
      DataCell(
        Center(
          child: InkWell(
            onTap: () {
              showConfirmationDialog(
                context,
                title: "Confirmation",
                message: "Do you want to change order status?",
                onConfirm: () {
                  order.status = !order.status;
                  IsarService().addUpdateOrder(order).then((value) {
                    showSnackMessage(context, "Order updated");
                  }).catchError((err) {
                    showSnackMessage(context, "Error Updating Order");
                  }).whenComplete(() {
                    Navigator.pop(context);
                  });
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: order.status
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                order.status ? 'Completed' : 'On-Going',
                style: TextStyle(
                  color: order.status ? Colors.green : Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    //Actions
    listOfCells.add(DataCell(
      Row(
        children: [
          FilledButton(
            onPressed: () => _showAddUpdateDialog(order: order),
            child: const Icon(Icons.update),
          ),
          const SizedBox(width: 5),
          FilledButton(
            onPressed: () {
              showConfirmationDialog(
                context,
                title: "Confirmation",
                message: "Are you sure you want to delete this Order?",
                onConfirm: () {
                  deleteOrder(order, (err, result) {
                    if (err != null || !result) {
                      printDebug(err);
                      Navigator.pop(context);
                      showAlertDialog(context,
                          title: "Error",
                          message: "Error while deleting order!");
                      return;
                    }
                    Navigator.pop(context);
                    showSnackMessage(context, "Order deleted");
                  });
                },
              );
            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    ));
    return DataRow(
      cells: listOfCells,
      onSelectChanged: (isSelected) => {},
    );
  }

  Color? _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return const Color(0xFF171B2D);
    }

    return null;
  }

  Future<void> _showAddUpdateDialog({Order? order}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Material(
                child: CreateOrderPage(order: order),
              ),
            );
          },
        );
      },
    );
  }

  void deleteOrder(Order order, Function(Error? error, bool status) next) {
    IsarService().deleteOrder(order.id).then((value) {
      next(null, value);
    }).catchError((err) => next(err, false));
  }
}
