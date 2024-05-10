import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, required this.isSaved});
  final Entry entry;
  final bool isSaved;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey<int>(entry.id),
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(entry: entry),
                  ),
                );
              },
              child: Ink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 112.0,
                        height: 180.0,
                        child: Image.network(
                          entry.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.name.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: "Philosopher",
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            entry.description,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3B4858),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(6),
              width: MediaQuery.of(context).size.width - 12,
              child: Expanded(
                child: Wrap(
                  spacing: 10,
                  children: entry
                      .commonLocationsConverter()
                      .map(
                        (e) => Chip(
                          backgroundColor: const Color(0xFF3B4858),
                          label: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
