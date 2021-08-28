part of '../payment_page.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(builder: (context, checkout, snapshot) {
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.payment_method,
        ),
        body: ListView.builder(
          itemCount: PaymentList.paymentList.length,
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            final payment = PaymentList.paymentList[index];
            return ListTile(
              contentPadding: const EdgeInsets.only(
                bottom: Const.space15,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: theme.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(Const.space12),
                  child: SvgPicture.asset(
                    payment.icon!,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              title: AutoSizeText(
                payment.name!,
                style: theme.textTheme.headline3,
              ),
              trailing: Radio(
                value: index,
                activeColor: theme.primaryColor,
                groupValue: checkout.paymentSelected,
                onChanged: (int? v) {
                  checkout.paymentSelected = index;
                },
              ),
            );
          },
        ),
      );
    });
  }
}
