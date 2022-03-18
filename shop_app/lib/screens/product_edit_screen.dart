import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = '/edit-screen';
  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final form = GlobalKey<FormState>();
  var EditedProduct =
      Product(id: null, title: "", description: "", imageUrl: "", price: 0.0);

  @override
  initState() {
    _imageURLFocusNode.addListener(URLlistener);
    super.initState();
  }

  void URLlistener() {
    if (!_imageURLFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void onSave() {
    var status = form.currentState.validate();
    if (!status) return;
    form.currentState.save();
    Provider.of<Products>(context, listen: false).addProducts(EditedProduct);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _imageURLFocusNode.removeListener(URLlistener);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLFocusNode.dispose();
    _imageURLController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        actions: [
          IconButton(
              onPressed: () {
                onSave();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: form,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text('Product Name')),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  EditedProduct = Product(
                      id: null,
                      title: value,
                      description: EditedProduct.description,
                      imageUrl: EditedProduct.imageUrl,
                      price: EditedProduct.price);
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text('Price')),
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price';
                  } else if (double.tryParse(value) == null) {
                    return 'please enter a valid number';
                  } else if (double.parse(value) <= 0) {
                    return 'please enter a value more than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  EditedProduct = Product(
                      id: null,
                      title: EditedProduct.title,
                      description: EditedProduct.description,
                      imageUrl: EditedProduct.imageUrl,
                      price: double.parse(value));
                },
              ),
              TextFormField(
                  decoration: InputDecoration(label: Text('Description')),
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.length < 10) {
                      return 'Please enter a description more than 10';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    EditedProduct = Product(
                        id: null,
                        title: EditedProduct.title,
                        description: value,
                        imageUrl: EditedProduct.imageUrl,
                        price: EditedProduct.price);
                  }),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    height: 100,
                    width: 100,
                    child: _imageURLController.text.isEmpty
                        ? Text('Enter URL')
                        : Image.network(
                            _imageURLController.text,
                            fit: BoxFit.cover,
                          ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration: InputDecoration(label: Text('Image URL')),
                        focusNode: _imageURLFocusNode,
                        keyboardType: TextInputType.url,
                        controller: _imageURLController,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onFieldSubmitted: (value) {
                          onSave();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an image url';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter an valid url';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          EditedProduct = Product(
                              id: null,
                              title: EditedProduct.title,
                              description: EditedProduct.description,
                              imageUrl: value,
                              price: EditedProduct.price);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
