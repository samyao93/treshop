part of '../address_page.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late TextEditingController _searchController;
  late List<AddressModel> _addressList = AddressList.addressList;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void searchBook(String query) {
    final _query = AddressList.addressList.where((address) {
      final titleLower = address.address!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _addressList = _query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.address,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: TextField(
              controller: _searchController,
              autocorrect: false,
              style: _theme.textTheme.bodyText2,
              onChanged: searchBook,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.find_an_address,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                  borderSide: BorderSide(color: _theme.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                  borderSide: BorderSide(color: _theme.primaryColor),
                ),
                prefixIcon: Icon(Icons.search, color: _theme.primaryColor),
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _addressList.length,
              padding: const EdgeInsets.all(Const.margin),
              itemBuilder: (context, index) {
                final address = _addressList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: Const.space12),
                  padding: const EdgeInsets.all(Const.space8),
                  decoration: BoxDecoration(
                    color: _theme.cardColor,
                    borderRadius: BorderRadius.circular(Const.radius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _theme.primaryColor,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              (address.location == 'Home')
                                  ? CustomIcon.house
                                  : CustomIcon.office,
                              width: 17,
                              height: 17,
                            ),
                          ),
                          const SizedBox(width: Const.space12),
                          Text(
                            address.location ?? '',
                            style: _theme.textTheme.headline3,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: ()=> _onModalBottomSheetTap(context),
                            icon: const Icon(FeatherIcons.moreVertical),
                            color: _theme.primaryColor,
                          )
                        ],
                      ),
                      const SizedBox(height: Const.space12),
                      _BuildListTile(
                        icon: Icons.location_on,
                        value: address.address ?? '',
                      ),
                      const SizedBox(height: Const.space5),
                      _BuildListTile(
                        icon: Icons.phone,
                        value: address.phoneNumber.toString(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _theme.primaryColor,
        onPressed: () =>Get.toNamed<dynamic>(Routes.addressAdd),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
