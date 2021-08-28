part of '../search_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _searchController;
  int? productFound = ProductList.allProduct.length;
  late List<ProductModel> productList = ProductList.allProduct;
  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  void searchBook(String query) {
    final _productList = ProductList.allProduct.where((book) {
      final titleLower = book.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      productList = _productList;
      productFound = _productList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.search,
      ),
      body: Column(
        children: [
          _HeaderSection(
            searchController: _searchController,
            onSearchTap: () {},
            onChanged: searchBook,
            productFound: productFound,
            onFilterTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              showFlexibleBottomSheet<dynamic>(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: context,
                builder: (context, scrollController1, bottomSheetOffset) {
                  return FilterScreen(
                    scrollController: scrollController1,
                  );
                },
              );
            },
            onSortTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              showFlexibleBottomSheet<dynamic>(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: context,
                builder: (context, scrollController2, bottomSheetOffset) {
                  return _BuildSortModal(
                    scrollController: scrollController2,
                  );
                },
              );
            },
          ),
        const  SizedBox(height: Const.space15),
          _BodySection(
            itemCount: productList,
          ),
        ],
      ),
    );
  }
}
