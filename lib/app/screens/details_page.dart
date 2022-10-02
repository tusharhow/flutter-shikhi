import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? 'Flutter Shikhi'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(data['desc1'] ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              data['image1'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : const SizedBox(
                      height: 16,
                    ),
              data['image1'] != ""
                  ? Image.asset(
                      data['image1'],
                      height: 200,
                    )
                  : Container(),
              data['image1'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              Text(data['desc2'] ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              data['image2'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(
                      height: 16,
                    ),
              data['image2'] != ""
                  ? Image.asset(
                      data['image2'],
                      height: 200,
                    )
                  : Container(),
              data['image2'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              Text(data['desc3'] ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              data['image3'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              data['image3'] != ""
                  ? Image.asset(
                      data['image3'],
                      height: 200,
                    )
                  : Container(),
              data['image3'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              Text(data['desc4'] ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              data['image4'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              data['image4'] != ""
                  ? Image.asset(
                      data['image4'],
                      height: 200,
                    )
                  : Container(),
              data['desc5'] != ""
                  ? const SizedBox(
                      height: 16,
                    )
                  : SizedBox(),
              Text(data['desc5'] ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                  )),
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
