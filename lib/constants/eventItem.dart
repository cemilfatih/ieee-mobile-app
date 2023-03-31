import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/etkinlik.dart';


class EventItem extends StatelessWidget {
  final etkinlik event;
  final Function() onDelete;
  final Function()? onTap;
  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        event.ad,
      ),
      subtitle: Text(
        event.tarih,
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}