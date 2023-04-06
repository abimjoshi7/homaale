
 import 'package:dependencies/dependencies.dart';

abstract class PaymentTypeListEvent extends Equatable {
   const PaymentTypeListEvent();
 }

 class PaymentTypeListInitiated extends PaymentTypeListEvent {
   const PaymentTypeListInitiated();
   @override
   List<Object?> get props => [];
 }

 class PaymentTypeCurrentIndex extends PaymentTypeListEvent {
  final int? currentIndex;
   const PaymentTypeCurrentIndex({this.currentIndex});
   @override
   List<Object?> get props => [
     currentIndex
   ];
 }
