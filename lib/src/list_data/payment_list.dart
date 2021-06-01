import '../helpers/constants.dart';
import '../models/payment_model.dart';

class PaymentList {
  static List<PaymentModel> paymentList = [
    PaymentModel(
      id: 1,
      icon: CustomIcon.mastercard,
      name: 'Master Card',
    ),
    PaymentModel(
      id: 2,
      icon: CustomIcon.paypal,
      name: 'PayPal',
    ),
    PaymentModel(
      id: 3,
      icon: CustomIcon.visa,
      name: 'VISA',
    ),
    PaymentModel(
      id: 4,
      icon: CustomIcon.bca,
      name: 'BCA Virtual Account',
    ),
  ];
}
