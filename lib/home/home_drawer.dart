import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int category = 1 ;
  static const int settings = 2 ;
  Function onDrawerItemClick ;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          color: Theme.of(context).primaryColor,
          child: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onDrawerItemClick(HomeDrawer.category);

            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              onDrawerItemClick(HomeDrawer.settings);

            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
