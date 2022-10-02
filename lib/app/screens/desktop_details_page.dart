import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BigScreenDetailsPage extends StatelessWidget {
  const BigScreenDetailsPage({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd-MM-yyyy : hh-mm').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? 'Flutter Shikhi'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    data['image1'],
                    height: 400,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(formatDate.toString()),
              const SizedBox(
                height: 16,
              ),
              Text(
                data['title'] ?? '',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc1'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image2'],
                height: 200,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc2'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image3'],
                height: 200,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc3'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                data['image4'],
                height: 200,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc4'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  data['desc5'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
