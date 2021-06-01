import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/models/address_model.dart';
import 'package:treshop/src/providers/checkout_provider.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.address,
    this.onAddressTap,
    required this.index,
  }) : super(key: key);

  final AddressModel address;
  final VoidCallback? onAddressTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(builder: (context, checkout, snapshot) {
      return Padding(
        padding: const EdgeInsets.only(right: Const.space15),
        child: InkWell(
          onTap: onAddressTap,
          borderRadius: BorderRadius.circular(Const.radius),
          child: Container(
            width: 250.0,
            padding: EdgeInsets.all(Const.space12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Const.radius),
              color: (checkout.addressSelected == index)
                  ? theme.primaryColor.withOpacity(.5)
                  : theme.cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(address.location!,
                    style: theme.textTheme.headline3),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        address.fullName!,
                        style: theme.textTheme.bodyText2,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    AutoSizeText(
                      address.phoneNumber.toString(),
                      style: theme.textTheme.bodyText2,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                AutoSizeText(
                  address.address!,
                  style: theme.textTheme.subtitle2,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
