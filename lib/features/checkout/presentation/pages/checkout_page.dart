import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_type_bloc.dart';
import 'package:cipher/features/payment/presentation/pages/payment_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../order/presentation/pages/order_page.dart';
import '../../../payment/presentation/bloc/payment_type_event.dart';
import '../../../payment/presentation/pages/payment_summary_page.dart';

class CheckoutPage extends StatefulWidget {
  static const routeName = '/checkout-page';
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _isShowVoucher = false;
  bool _isShowOffer = false;

  final TextEditingController textEditingVoucherController =
      TextEditingController();
  final TextEditingController textEditingOfferController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addVerticalSpace(50),
            CustomHeader(
              leadingWidget: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              trailingWidget: IconButton(
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   CompleteProfilePage.routeName,
                  // );
                },
                icon: const Icon(Icons.search),
              ),
              child: const Text('Checkout'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CommonBillingAddressContainer(),
                ],
              ),
            ),
            // addVerticalSpace(20),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _isShowVoucher = !_isShowVoucher;
                    _isShowOffer =false ;

                  },
                );
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                color:
                    _isShowVoucher ? Colors.blue.shade50 : Colors.grey.shade50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Add voucher or promo code ',
                    style: _isShowVoucher
                        ? kPurpleText16
                        : TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ),
            ),
            _isShowVoucher
                ? Visibility(
                    visible: _isShowVoucher,
                    child: AddVoucherAndOffersContainer(
                      labelText: 'Apply',
                      controller: textEditingVoucherController,
                    ),
                  )
                : SizedBox(),
            _isShowOffer && _isShowVoucher
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _isShowOffer = !_isShowOffer;
                    _isShowVoucher =false;
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: _isShowOffer ? Colors.blue.shade50 : Colors.grey.shade50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10),
                  child: Text(
                    'Select Offer ',
                    style: _isShowOffer
                        ? kPurpleText16
                        : TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ),
            ),
            _isShowOffer
                ? Visibility(
                    visible: _isShowOffer,
                    child: AddVoucherAndOffersContainer(
                        labelText: 'Redeem',
                        controller: textEditingOfferController),
                  )
                : SizedBox(),
            addVerticalSpace(10),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment Details',
                    style: kPurpleText16,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Charge'),
                      Text(
                        'Rs 1,200',
                        style: kPurpleText16,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GST'),
                      Text(
                        'Rs 80',
                        style: kPurpleText16,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                      ),
                      Text(
                        'Rs 100',
                        style: kPurpleText16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'Rs 1,180',
                        style: kPurpleText16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: CustomElevatedButton(
                callback: () {
                  context.read<PaymentTypeBloc>().add(
                      PaymentTypeListInitiated()
                  );
                  Navigator.pushNamed(
                    context,
                    PaymentPage.routeName,
                  );
                },
                label: 'Confirm',
              ),
            ),
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.orangeAccent,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0, left: 5),
                  child: Text(
                    'You have to deposit the required amount to complete.',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddVoucherAndOffersContainer extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? applyTap;
  final String? labelText;
  const AddVoucherAndOffersContainer({
    Key? key,
    this.controller,
    this.applyTap,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter code',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: CustomElevatedButton(
                  label: labelText ?? "",
                  callback: () => applyTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
