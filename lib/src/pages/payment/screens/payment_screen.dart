part of '../payment_page.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
         title: AppLocalizations.of(context)!.payment_method,
      ),
    );
  }
}
