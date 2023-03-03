import 'package:flutter/material.dart';
import '../resources/dimens.dart';

class FilterDropdownView extends StatefulWidget {
  List<String> filterArrayObj;

  FilterDropdownView(this.filterArrayObj);

  @override
  _FilterDropdownState createState() => _FilterDropdownState(filterArrayObj);
}

class _FilterDropdownState extends State<FilterDropdownView> {
  List<String> filterArrayObj = [];

  _FilterDropdownState(this.filterArrayObj);

  String _selectedItem = "";
  @override
  Widget build(BuildContext context) {
    _selectedItem =
        _selectedItem.isEmpty ? filterArrayObj[0].toString() : _selectedItem;

    final List<String> _ItemName = filterArrayObj;

    return IntrinsicWidth(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(top: 8.0, right: 8.0),
        height: 35,
        // padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
        // width: MediaQuery.of(context).size.width,
        // color: Colors.white,
        child: DropdownButton<String>(
          underline: Container(),
          value: _selectedItem,
          dropdownColor: Colors.white,
          icon: const Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black, //
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              _selectedItem = newValue ?? "";
            });
          },
          items: _ItemName.map((countryCode) {
            return DropdownMenuItem<String>(
              value: countryCode,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: MARGIN_MEDIUM),
                child: Text(
                  countryCode,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
