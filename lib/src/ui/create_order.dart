import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/models/order.dart';
import 'package:retail_app/src/models/product.dart';
import 'package:retail_app/src/models/settings.dart';
import 'package:retail_app/src/ui/widgets/custom_dropdown_menu.dart';
import 'package:retail_app/src/ui/widgets/custom_text_field.dart';
import 'package:retail_app/src/utils/isar_service.dart';
import 'package:retail_app/src/utils/utils.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key, this.order});

  final Order? order;

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  Order? order;
  bool firstLoadDone = false;
  List<Product> _productList = [];
  late Settings settings;
  bool isUpdate = false;
  late Product selectedProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController(text: "1");
  List<OrderItems> orderItems = [];
  double totalAmount = 0;
  int index = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAllProducts();
    });
  }

  List<DataColumn> listOfColumns = const [
    DataColumn(label: Text("#")),
    DataColumn(label: Text("Name")),
    DataColumn(label: Text("Price")),
    DataColumn(label: Text("Qty")),
    DataColumn(label: Text("Amount")),
    DataColumn(label: Text("Action")),
  ];

  @override
  Widget build(BuildContext context) {
    if (!firstLoadDone) return const Center(child: CircularProgressIndicator());
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${isUpdate ? "Update" : "Create"} Order",
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: "Order Name",
                  controller: nameController,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomDropdownMenu<Product>(
                      initialSelection: selectedProduct,
                      dropdownMenuEntries:
                          _productList.map<DropdownMenuEntry<Product>>((e) {
                        return DropdownMenuEntry(value: e, label: e.name);
                      }).toList(),
                      onSelected: (value) {
                        selectedProduct = value!;
                      },
                    ),
                    CustomTextField(
                      label: "Qty",
                      controller: qtyController,
                      keyboardType: TextInputType.number,
                    ),
                    TextButton(
                        onPressed: () {
                          int existingProduct = orderItems.indexWhere(
                              (element) =>
                                  element.product == selectedProduct.id);
                          if (existingProduct > -1) {
                            setState(() {
                              index = 1;
                              OrderItems oldOi = orderItems[existingProduct];
                              int qty = oldOi.qty +
                                  (int.tryParse(qtyController.text) ?? 1);
                              double price = selectedProduct.price;
                              double gross = price * qty;
                              double net = gross;
                              double netRound = net.roundToDouble();
                              oldOi.qty = qty;
                              oldOi.price = price;
                              oldOi.gross = gross;
                              oldOi.net = net;
                              oldOi.netRound = netRound;
                              orderItems[existingProduct] = oldOi;
                              calculateTotalAmount();
                            });
                          } else {
                            index = 1;
                            setState(() {
                              int qty = int.tryParse(qtyController.text) ?? 1;
                              double price = selectedProduct.price;
                              double gross = price * qty;
                              double net = gross;
                              double netRound = net.roundToDouble();
                              OrderItems oi = OrderItems(
                                id: ObjectId().hexString,
                                product: selectedProduct.id,
                                qty: qty,
                                price: price,
                                gross: gross,
                                net: net,
                                netRound: netRound,
                              );
                              orderItems.add(oi);
                              calculateTotalAmount();
                            });
                          }
                        },
                        child: const Text("Add")),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: DataTable(
                      dataRowColor:
                          MaterialStateProperty.resolveWith(_getDataRowColor),
                      dividerThickness: 1,
                      showCheckboxColumn: false,
                      showBottomBorder: true,
                      columns: listOfColumns,
                      rows: orderItems
                          .map<DataRow>(
                            (e) => getOIRow(index++, e, (idx) {
                              setState(() {
                                index = 1;
                                orderItems.removeAt(idx - 1);
                              });
                            }),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Total Amount: ${totalAmount.toStringAsFixed(2)}"),
                const Spacer(),
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(isUpdate ? 'Update' : 'Add'),
                  onPressed: () {
                    if(orderItems.isEmpty) {
                      showAlertDialog(context, title: "Error", message: "No items found in order. Please add atleast one item to this order.");
                      return;
                    }
                    if (isUpdate) {
                      order!.items = orderItems;
                      int totalQty = 0;
                      double gross = 0;
                      double net = 0;
                      double netRound = 0;
                      for (var oi in orderItems) {
                        totalQty += oi.qty;
                        gross += oi.gross;
                        net += oi.net;
                        netRound += oi.netRound;
                      }
                      order!.name = nameController.text;
                      order!.qty = totalQty;
                      order!.gross = gross;
                      order!.net = net;
                      order!.netRound = netRound;
                      order!.updatedAt = DateTime.now();
                    } else {
                      int totalQty = 0;
                      double gross = 0;
                      double net = 0;
                      double netRound = 0;
                      int orderNo = settings.orderNo;
                      for (var oi in orderItems) {
                        totalQty += oi.qty;
                        gross += oi.gross;
                        net += oi.net;
                        netRound += oi.netRound;
                      }
                      order = Order(
                        id: ObjectId().hexString,
                        name: nameController.text,
                        orderNo: orderNo,
                        status: false,
                        items: orderItems,
                        qty: totalQty,
                        gross: gross,
                        net: net,
                        netRound: netRound,
                        createdAt: DateTime.now(),
                      );
                    }
                    IsarService().addUpdateOrder(order!).then((value) {
                      settings.orderNo++;
                      IsarService()
                          .addUpdateSettings(settings)
                          .then((value) => Navigator.of(context).pop(value))
                          .catchError((err) {
                        printDebug(err);
                        Navigator.of(context).pop(value);
                      });
                    }).catchError((err) {
                      printDebug(err);
                      showAlertDialog(
                        context,
                        title: "Error",
                        message: "Error Creating Order",
                      );
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void calculateTotalAmount() {
    totalAmount = 0;
    for (var oi in orderItems) {
      totalAmount += oi.netRound;
    }
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

  DataRow getOIRow(int index, OrderItems order, Function(int index) onDelete) {
    List<DataCell> listOfCells = [
      DataCell(Text(index.toString())),
      DataCell(Text(_productList
          .firstWhere((element) => element.id == order.product)
          .name)),
      DataCell(Text(order.price.toStringAsFixed(2))),
      DataCell(Text(order.qty.toString())),
      DataCell(Text(order.netRound.toStringAsFixed(2))),
      DataCell(
        Row(
          children: [
            FilledButton(
              onPressed: () => {onDelete(index)},
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    ];
    return DataRow(
      cells: listOfCells,
      onSelectChanged: (isSelected) => {},
    );
  }

  loadSettings() async {
    settings = await IsarService().getSettings();
  }

  loadAllProducts() async {
    await loadSettings();
    List<Category> categoryList = await IsarService().getAllCategories();
    List<Product> productList = await IsarService().getAllProducts();

    _productList = productList.map((e) {
      e.categoryData =
          categoryList.firstWhere((element) => element.id == e.category);
      return e;
    }).toList();

    order = widget.order;
    isUpdate = order != null;
    selectedProduct = _productList.first;
    nameController.text = order?.name ?? "";
    orderItems = order?.items ?? [];
    totalAmount = order?.netRound ?? 0;
    firstLoadDone = true;
    index = 1;
    setState(() {});
  }
}
