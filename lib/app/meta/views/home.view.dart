import 'package:flutter/material.dart';
import 'package:flutter_supabase_tutorial/core/notifier/database.notifier.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    final TextEditingController descriptionController = TextEditingController();

    final DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);

    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          databaseNotifier.fetchData();
        }),
        appBar: AppBar(
          title: const Text('Home View'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'title'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'description'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  databaseNotifier.insertData(
                      title: titleController.text,
                      description: descriptionController.text);
                },
                child: const Text('Add Data')),
            SizedBox(
              height: 100,
              child: FutureBuilder(
                  future: databaseNotifier.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List snapShot = snapshot.data as List;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapShot.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapShot[index].title),
                              subtitle: Text(snapShot[index].description),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Edit Data'),
                                          content: Column(
                                            children: [
                                              TextField(
                                                controller: titleController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'title'),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                controller:
                                                    descriptionController,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText:
                                                            'description'),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    databaseNotifier.updateData(
                                                        // we can get the id from the snapshot so we don't need to
                                                        // pass the id from the UI
                                                        id: snapShot[index].id,
                                                        title: titleController
                                                            .text,
                                                        description:
                                                            descriptionController
                                                                .text);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Update'))
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ),
                            );
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ));
  }
}
