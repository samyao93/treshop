part of '../checkout_page.dart';


class _BuildPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? _paymentIconSelected(int? val) {
      switch (val) {
        case 0:
          return PaymentList.paymentList[0].icon;
        case 1:
          return PaymentList.paymentList[1].icon;
        case 2:
          return PaymentList.paymentList[2].icon;
        case 3:
          return PaymentList.paymentList[3].icon;

        default:
          return PaymentList.paymentList[0].icon;
      }
    }

    String? _paymentNameSelected(int? val) {
      switch (val) {
        case 0:
          return PaymentList.paymentList[0].name;
        case 1:
          return PaymentList.paymentList[1].name;
        case 2:
          return PaymentList.paymentList[2].name;
        case 3:
          return PaymentList.paymentList[3].name;

        default:
          return PaymentList.paymentList[0].name;
      }
    }

    return Consumer<CheckoutProvider>(builder: (context, checkout, snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BuildLabelSection(
            label: AppLocalizations.of(context)!.payment_method,
            trailing: AppLocalizations.of(context)!.change,
            onViewAllTap: () => Get.toNamed<dynamic>(Routes.payment),
          ),
        const  SizedBox(height: Const.space8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: (checkout.paymentSelected == null)
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Const.space12),
                    child: Center(
                      child: AutoSizeText(
                        AppLocalizations.of(context)!
                            .payment_method_not_selected,
                        style: theme.textTheme.subtitle1,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          color: Colors.white,
                        ),
                        padding:const EdgeInsets.all(Const.space8),
                        child: SvgPicture.asset(
                          _paymentIconSelected(checkout.paymentSelected)!,
                        ),
                      ),
                    const  SizedBox(width: Const.space12),
                      AutoSizeText(
                          _paymentNameSelected(checkout.paymentSelected)!,
                          style: theme.textTheme.bodyText1)
                    ],
                  ),
          ),
        ],
      );
    });
  }
}
