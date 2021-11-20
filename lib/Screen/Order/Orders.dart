import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_deleget/Screen/Home/HomeScreen.dart';
import 'package:food_deleget/Screen/Prodect/ProdectDetails.dart';
import 'package:food_deleget/Screen/data/UserModel.dart';
import 'package:dio/dio.dart';
import '../../constants.dart';

class Data {
  Map fetched_data = {
    "data": [
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": "1200",
        "quantity": "2",
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": "1200",
        "quantity": "10",
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": "1200",
        "quantity": "15",
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": "1200",
        "quantity": "20",
      },
      {
        "id": 111,
        "name": "بازليا بالاندا اليابسة ",
        "price": "1200",
        "quantity": "2",
      },
    ]
  };
  List _data;

//function to fetch the data

  Data() {
    _data = fetched_data["data"];
  }

  int getId(int index) {
    return _data[index]["id"];
  }

  String getName(int index) {
    return _data[index]["name"];
  }

  String getPrice(int index) {
    return _data[index]["price"];
  }

  String getQuantity(int index) {
    return _data[index]["quantity"];
  }

  int getLength() {
    return _data.length;
  }
}

class Order extends StatefulWidget {


  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Data _data = new Data();
  final _userEditTextController = TextEditingController(text: 'Mrs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('__RIKEY1__'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (drawerKey.currentState.isOpened()) {
                          drawerKey.currentState.closeDrawer();
                        } else {
                          drawerKey.currentState.openDrawer();
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_outlined,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (drawerKey.currentState.isOpened()) {
                          drawerKey.currentState.closeDrawer();
                        } else {
                          drawerKey.currentState.openDrawer();
                        }
                      },
                    ),
                  ],
                ),
                if (_data.getLength() <= 0)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 8, left: 8, top: 80, bottom: 8),
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Colors.transparent,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/noOrder.png"))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "لاتوجد طلبات",
                          style: const TextStyle(
                              color: ktextColor,
                              fontSize: 24,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                if (_data.getLength() > 0)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 10),
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text("عربتي",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child:   DropdownSearch<UserModel>(
                            showSelectedItems: true,
                            compareFn: (i, s) => i?.isEqual(s) ?? false,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "الزبون",
                              labelStyle: TextStyle(fontSize: 26),
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              border: UnderlineInputBorder(),
                            ),
                            onFind: (String  filter) => getData(filter),
                            onChanged: (data) {
                              print(data);
                            },
                            dropdownBuilder: _customDropDownExample,
                            popupItemBuilder: _customPopupItemBuilderExample2,
                          ),
                        ),
                      ),


                      createOrderList(),
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "السعر الكلي",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 26),
                              ),
                              Text(
                                "1200 د",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 26),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              kPrimaryColor,
                              kPrimaryColor,
                            ],
                          ),
                        ),
                        child: const Text(
                          'تأكيد الطلب',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              kBadgeColor,
                              kBadgeColor,
                            ],
                          ),
                        ),
                        child: const Text(
                          'الغاء الطلب',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createOrderList() {
    return ListView.builder(

      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      // itemBuilder: (context, position) {
      //   return createOrderListItem(position);
      // },

      itemBuilder: (context, index) {
      //final item = _data[index];
      return Dismissible(
           key:const Key('__RIKEY1__'),
          onDismissed: (direction) {
            setState(() {
           //   items.removeAt(index);
            });
           // Scaffold.of(context)
             //   .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          background: Container(
            color: kPrimaryColor,
            child: Icon(Icons.delete),
          ),
          child: createOrderListItem(index));
    },
      itemCount: _data.getLength(),
    );
  }

  createOrderListItem(int position) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // Route route =
            // MaterialPageRoute(builder: (context) => ProdectDetails());
            // Navigator.pushReplacement(context, route);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: ProdectDetails(),
                    )));

            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(const Radius.circular(5))),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 8, top: 4),
                          child: Text(
                            _data.getQuantity(position),
                            style: const TextStyle(
                                color: ktextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            _data.getName(position),
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                                color: ktextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            _data.getPrice(position),
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _customPopupItemBuilderExample(
    BuildContext context, UserModel item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item?.name ?? ''),
      subtitle: Text(item?.createdAt?.toString() ?? ''),
      leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
          ),
    ),
  );
}
Widget _customDropDownExample(BuildContext context, UserModel  item) {
  if (item == null) {
    return Container();
  }

  return Container(
    child: (item.avatar == null)
        ? ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(),
      title: Text("No item selected"),
    )
        : ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        // this does not work - throws 404 error
        // backgroundImage: NetworkImage(item.avatar ?? ''),
      ),
      title: Text(item.name),
      subtitle: Text(
        item.createdAt.toString(),
      ),
    ),
  );
}

Widget _customPopupItemBuilderExample2(
    BuildContext context, UserModel item, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item?.name ?? ''),
      subtitle: Text(item?.createdAt?.toString() ?? ''),
      leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
          ),
    ),
  );
}

Future<List<UserModel>> getData(filter) async {
  var response = await Dio().get(
    "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
    queryParameters: {"filter": filter},
  );

  final data = response.data;
  if (data != null) {
    return UserModel.fromJsonList(data);
  }

  return [];
}

Widget _customDropDownExampleMultiSelection(
    BuildContext context, List<UserModel> selectedItems) {
  if (selectedItems.isEmpty) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(),
      title: Text("بحث"),
    );
  }

  return Wrap(
    children: selectedItems.map((e) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
                // this does not work - throws 404 error
                // backgroundImage: NetworkImage(item.avatar ?? ''),
                ),
            title: Text(e?.name ?? ''),
            subtitle: Text(
              e?.createdAt.toString() ?? '',
            ),
          ),
        ),
      );
    }).toList(),
  );
}
