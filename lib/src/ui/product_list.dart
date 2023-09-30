import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:retail_app/src/models/category.dart';
import 'package:retail_app/src/models/product.dart';
import 'package:retail_app/src/ui/widgets/custom_dropdown_menu.dart';
import 'package:retail_app/src/ui/widgets/custom_text_field.dart';
import 'package:retail_app/src/utils/extenstions.dart';
import 'package:retail_app/src/utils/utils.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Category> _categoryList = [];
  List<Product> _productList = [];
  Category? selectedCategory;
  int index = 1;
  bool isLoaded = false;
  List<DataColumn> listOfColumns = const [
    DataColumn(label: Text("#")),
    DataColumn(label: Text("Name")),
    DataColumn(label: Text("Price")),
    DataColumn(label: Text("Status")),
    DataColumn(label: Text("Action")),
  ];

  @override
  void initState() {
    context.getAllCategories().then((value) {
      setState(() {
        isLoaded = true;
        _categoryList = value;
        if (value.isNotEmpty) selectedCategory = value[0];
      });
    }).catchError((err) {
      print(err);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) return const Center(child: CircularProgressIndicator());
    if (_categoryList.isEmpty) {
      return const Center(child: Text("Please add Category First"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Products - (${selectedCategory!.name})",
                style: const TextStyle(fontSize: 20)),
            const Spacer(),
            TextButton(
              onPressed: () => _showAddUpdateDialog(),
              child: const Text("Add Product"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text("Select Category:", style: TextStyle(fontSize: 15)),
            const SizedBox(width: 10),
            CustomDropdownMenu<Category>(
              initialSelection: _categoryList.first,
              dropdownMenuEntries: _categoryList.map<DropdownMenuEntry<Category>>((e) {
                return DropdownMenuEntry(value: e, label: e.name);
              }).toList(),
              onSelected: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: context.productStream(selectedCategory!.id),
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
            _productList = snapshot.data != null ? snapshot.data! : [];

            return Expanded(
              child: InteractiveViewer(
                // constrained: false,
                child: DataTable(
                  dataRowColor:
                      MaterialStateProperty.resolveWith(_getDataRowColor),
                  dividerThickness: 1,
                  showCheckboxColumn: false,
                  showBottomBorder: true,
                  columns: listOfColumns,
                  rows: _productList
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

  DataRow _getRow(int index, Product product) {
    List<DataCell> listOfCells = [
      DataCell(Text(index.toString())),
      DataCell(Text(product.name)),
      DataCell(Text(product.price.toStringAsFixed(2))),
      DataCell(
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: product.status
                  ? Colors.green.withOpacity(0.5)
                  : Colors.red.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(
              product.status ? 'Active' : 'Inactive',
              style: TextStyle(
                color: product.status ? Colors.green : Colors.red,
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
            onPressed: () => _showAddUpdateDialog(product: product),
            child: const Icon(Icons.update),
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

  Future<void> _showAddUpdateDialog({Product? product}) async {
    bool isUpdate = product != null;

    final formKey = GlobalKey<FormState>();
    TextEditingController nameController =
        TextEditingController(text: product?.name);
    TextEditingController descriptionController =
        TextEditingController(text: product?.description);
    TextEditingController priceController =
        TextEditingController(text: product?.price.toString());

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${isUpdate ? "Update" : "Add"} Product (${selectedCategory!.name})"),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CustomTextField(
                    label: "Name",
                    controller: nameController,
                    required: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    label: "Price",
                    controller: priceController,
                    required: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    label: "Description",
                    controller: descriptionController,
                    lines: 3,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(isUpdate ? 'Update' : 'Add'),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  if (isUpdate) {
                    product!.name = nameController.text;
                    product!.description = descriptionController.text;
                    product!.updatedAt = DateTime.now();

                    context.updateProduct(product!).then((value) {
                      Navigator.of(context).pop(value);
                    }).catchError((err) {
                      if (err.toString().contains("Unique")) {
                        showAlertDialog(
                          context,
                          title: "Error",
                          message: "Product already exist",
                        );
                      }
                    });
                  } else {
                    product = Product(
                      id: ObjectId().hexString,
                      name: nameController.text,
                      price: double.tryParse(priceController.text) ?? 0,
                      description: descriptionController.text,
                      status: true,
                      category: selectedCategory!.id,
                      createdAt: DateTime.now(),
                    );

                    context.addProduct(product!).then((value) {
                      Navigator.of(context).pop(value);
                    }).catchError((err) {
                      if (err.toString().contains("Unique")) {
                        showAlertDialog(
                          context,
                          title: "Error",
                          message: "Product already exist",
                        );
                      }
                    });
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
