import 'package:flutter/material.dart';
import 'package:start_hack_gallen/data/dummy_info.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoList extends StatefulWidget {
  const InfoList({super.key});

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyInfo.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyInfo[index].title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                dummyInfo[index].subtitle,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Indicator",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Icon(
                            dummyInfo[index].isBetter
                                ? Icons.trending_up
                                : Icons.trending_down,
                            color: dummyInfo[index].isBetter
                                ? Colors.green
                                : Colors.red,
                            size: 38,
                          ),
                          dummyInfo[index].isBetter
                              ? Text(
                                  "better than last period",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.green),
                                )
                              : Text(
                                  "Worse than last period",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.red),
                                )
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                if (!dummyInfo[index].isBetter)
                  Card(
                    child: ListTile(
                      onTap: () async {
                        final uri = Uri.parse(
                            "https://www.essen-und-trinken.de/low-fat");

                        await launchUrl(uri);
                      },
                      title:
                          Text("Try our low-${dummyInfo[index].title} recipe!"),
                    ),
                  )
              ],
            ),
          );
        });
  }
}
