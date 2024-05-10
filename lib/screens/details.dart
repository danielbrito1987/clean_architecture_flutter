import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.bookmark),
          onPressed: () {
            daoController.saveEntry(entry: entry);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 24.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                entry.name.toUpperCase(),
                style: const TextStyle(
                  fontFamily: "Philosopher",
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Wrap(
                spacing: 10,
                children: entry
                    .commonLocationsConverter()
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 12,
                  height: 220,
                  child: Image.network(
                    entry.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
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
      ),
    );
  }
}
