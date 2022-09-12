import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(data['desc1']),
              const SizedBox(
                height: 16,
              ),
              data['image1'] != ""
                  ? Image.asset(
                      data['image1'],
                      height: 200,
                    )
                  : Container(),
              const SizedBox(
                height: 16,
              ),
              Text(data['desc2'] ?? ''),
              const SizedBox(
                height: 16,
              ),
              data['image2'] != ""
                  ? Image.asset(
                      data['image2'],
                      height: 200,
                    )
                  : Container(),
              const SizedBox(
                height: 16,
              ),
              Text(data['desc3'] ?? ''),
              const SizedBox(
                height: 16,
              ),
              data['image3'] != ""
                  ? Image.asset(
                      data['image3'],
                      height: 200,
                    )
                  : Container(),
              const SizedBox(
                height: 16,
              ),
              Text(data['desc4'] ?? ''),
              const SizedBox(
                height: 16,
              ),
              data['image4'] != ""
                  ? Image.asset(
                      data['image4'],
                      height: 200,
                    )
                  : Container(),
              const SizedBox(
                height: 16,
              ),
              Text(data['desc5'] ?? ''),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
