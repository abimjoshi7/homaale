
 import 'package:dependencies/dependencies.dart';

abstract class PaymentTypeListEvent extends Equatable {
   const PaymentTypeListEvent();
 }

 class PaymentTypeListInitiated extends PaymentTypeListEvent {
   const PaymentTypeListInitiated();
   @override
   List<Object?> get props => [];
 }
