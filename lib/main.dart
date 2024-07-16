import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MaterialApp(
        home: DataScreen(),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dashboard'),
      ),
      body: FutureBuilder(
        future: dataProvider.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: dataProvider.data.length,
              itemBuilder: (context, index) {
                final data = dataProvider.data[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text('Value: ${data.value}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
