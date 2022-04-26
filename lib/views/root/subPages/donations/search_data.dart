
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/models/donation_model.dart';

class SearchFeed extends StatefulWidget {
  const SearchFeed({Key? key}) : super(key: key);

  @override
  _SearchFeedState createState() => _SearchFeedState();
}

class _SearchFeedState extends State<SearchFeed> {
  @override
  Widget build(BuildContext context) {
    return FirestoreSearchScaffold(
      firestoreCollectionName: 'donate',
      searchBy: 'tool',
      scaffoldBody: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              Expanded(
                  child: FirestoreSearchBar(
                    tag: 'test',
                  )),
              const SizedBox(
                width: 40.0,
              ),
            ],
          ),
          Expanded(
            child: FirestoreSearchResults.builder(
              tag: 'test',
              firestoreCollectionName: 'donate',
              searchBy: 'tool',
              initialBody: const Center(child: Text('Initial body'),),
              dataListFromSnapshot: DonationModel().dataListFromSnapshot,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DonationModel>? dataList = snapshot.data;
                  if (dataList!.isEmpty) {
                    return const Center(
                      child: Text('No Results Returned'),
                    );
                  }
                  return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final DonationModel data = dataList[index];

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${data.name}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, left: 8.0, right: 8.0),
                              child: Text('${data.project}',
                                  style: Theme.of(context).textTheme.bodyText1),
                            )
                          ],
                        );
                      });
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No Results Returned'),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
      dataListFromSnapshot: DonationModel().dataListFromSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DonationModel>? dataList = snapshot.data;
          if (dataList!.isEmpty) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
          return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final DonationModel data = dataList[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${data.name}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0),
                      child: Text('${data.project}',
                          style: Theme.of(context).textTheme.bodyText1),
                    )
                  ],
                );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}