import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/category_details/category_details.dart';
import 'package:news/category_details/category_fragments.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/home/model/NewsResponse.dart';
import 'package:news/home/model/SourceResponse.dart';
import 'package:news/home/model/category.dart';
import 'package:news/home/myTheme.dart';
import 'package:news/search/news_search_delegate.dart';
import 'package:news/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  List<News> searchResults = [];
  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: isSearching
                  ? TextField(
                controller: searchController,
                decoration: InputDecoration(

                    hintText: AppLocalizations.of(context)!.searchHint,
                    hintStyle: TextStyle(color: MyTheme.whiteColor),
                    enabled: true,
                    filled: true,
                    fillColor: MyTheme.whiteColor,
                    border: InputBorder.none),
                onSubmitted: (text) {
                  onSearchSubmitted(text);
                },
              )
                  : Text(
                selectedDrawerItem == HomeDrawer.settings
                    ? AppLocalizations.of(context)!.settings
                    : selectedCategory == null
                    ? AppLocalizations.of(context)!.app_title
                    : selectedCategory!.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.whiteColor),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate:NewsSearchDelegate() );
                      // setState(() {
                      //   isSearching = !isSearching;
                      //   if (!isSearching) {
                      //     searchController.clear();
                      //   }
                      // });
                    },
                    icon: Icon(isSearching ? Icons.close : Icons.search))
              ],
            ),
            drawer: Drawer(
              child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
            ),
            body: selectedDrawerItem == HomeDrawer.settings
                ? SettingsTab()
                : selectedCategory == null
                ? CategoryFragment(
              onCategoryClick: onCategoryClick,
            )
                : CategoryDetails(category: selectedCategory!))
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.category;

  void onDrawerItemClick(int newSelectDrawerItem) {
    selectedDrawerItem = newSelectDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onSearchSubmitted(String query) async {
    if (query.isNotEmpty) {
      try {
        final response = await ApiManager.searchArticle(query);
        setState(() {
          searchResults = response.articles ?? [];
        });
      } catch (e) {

      }
    }
  }



}
