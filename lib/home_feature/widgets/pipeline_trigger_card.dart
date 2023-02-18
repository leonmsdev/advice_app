import 'package:bloc_app/theme.dart';
import 'package:flutter/material.dart';

enum TileMenuItem { itemOne, itemTwo }

class PipelineTriggerCard extends StatefulWidget {
  const PipelineTriggerCard({
    super.key,
  });

  @override
  State<PipelineTriggerCard> createState() => _PipelineTriggerCardState();
}

class _PipelineTriggerCardState extends State<PipelineTriggerCard> {
  TileMenuItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.tileBackgroundColor,
        ),
        width: 300,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                      // backgroundImage: NetworkImage(
                      //     'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ'),
                      ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'CI/CD Pipeline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<TileMenuItem>(
                  elevation: 6,
                  color: Theme.of(context).colorScheme.tileBackgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  onSelected: (TileMenuItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<TileMenuItem>>[
                    PopupMenuItem<TileMenuItem>(
                      value: TileMenuItem.itemOne,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          Text('edit'),
                        ],
                      ),
                    ),
                    PopupMenuItem<TileMenuItem>(
                      value: TileMenuItem.itemTwo,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.delete,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          Text('delete'),
                        ],
                      ),
                    ),
                  ],
                  child: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).colorScheme.ligthGrey,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
