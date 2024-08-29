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
            Container(
              height: 100,
              child: FutureBuilder(
                  future: databaseNotifier.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List _snapshot = snapshot.data as List;
                      return ListView.builder(
                        shrinkWrap: true,
                          itemCount: _snapshot.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_snapshot[index].title),
                              subtitle: Text(_snapshot[index].description),
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
