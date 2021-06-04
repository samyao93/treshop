import 'package:treshop/src/models/tracking_model.dart';

class TrackingList {
  static List<TrackingModel> trackingList = [
    TrackingModel(
      title: 'Payment is confirmed',
      subtitle: 'Treshop Center',
      date: DateTime.now(),
    ),
    TrackingModel(
      title: 'Pickup',
      subtitle: 'Treshop Center',
      date: DateTime.now(),
    ),
    TrackingModel(
      title: 'Orders has been sent',
      subtitle: '742 Lyme Street J&T Center',
      date: DateTime.now(),
    ),
    TrackingModel(
      title: 'Orders sent by courier',
      subtitle: '13 Puntadewa Street',
      date: DateTime.now(),
    ),
  ];
}
