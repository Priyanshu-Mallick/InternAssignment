
import 'package:assignment/widgets/permission_switch.dart';
import 'package:flutter/material.dart';

class PermissionListItem extends StatefulWidget {
  final String name;

  const PermissionListItem({required this.name});

  @override
  _PermissionListItemState createState() => _PermissionListItemState();
}

class _PermissionListItemState extends State<PermissionListItem> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
          PermissionSwitch(isSwitched: isSwitched, onChanged: toggleSwitch),
        ],
      ),
    );
  }

  void toggleSwitch() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }
}