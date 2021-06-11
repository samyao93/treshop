part of '../checkout_page.dart';

class _BuildAddress extends StatelessWidget {
  const _BuildAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BuildLabelSection(
          label: AppLocalizations.of(context)!.address,
          trailing: AppLocalizations.of(context)!.add_address,
          onViewAllTap: (){}
        ),
        const SizedBox(height: Const.space8),
        SizedBox(
          width: Screens.width(context),
          height: 120.0,
          child: ListView.builder(
            itemCount: AddressList.addressList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
            ),
            itemBuilder: (context, index) {
              var address = AddressList.addressList[index];

              return AddressCard(
                address: address,
                index: index,
                onAddressTap: () {
                  context.read<CheckoutProvider>().addressSelected = index;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
