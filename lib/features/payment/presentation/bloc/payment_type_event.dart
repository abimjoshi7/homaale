
 import 'package:dependencies/dependencies.dart';

abstract class PaymentTypeListEvent extends Equatable {
   const PaymentTypeListEvent();
 }

 class PaymentTypeListInitiated extends PaymentTypeListEvent {
  // final int? currentIndex;
   const PaymentTypeListInitiated();
   @override
   List<Object?> get props => [];
 }
