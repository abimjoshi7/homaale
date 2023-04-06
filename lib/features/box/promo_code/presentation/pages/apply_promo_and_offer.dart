import 'package:cipher/features/box/promo_code/presentation/bloc/promo_code_apply_bloc.dart';
import 'package:cipher/features/box/promo_code/presentation/bloc/promo_code_apply_event.dart';
import 'package:cipher/features/box/promo_code/presentation/bloc/promo_code_apply_state.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/constants/text.dart';
import '../../../../../core/constants/validations.dart';
import '../../../../../widgets/custom_elevated_button.dart';
import '../../../../../widgets/custom_form_field.dart';
import '../../../../../widgets/custom_text_form_field.dart';
import '../../../../../widgets/custom_toast.dart';

class PromoCodeAddSection extends StatefulWidget {
  const PromoCodeAddSection({Key? key}) : super(key: key);

  @override
  State<PromoCodeAddSection> createState() => _PromoCodeAddSectionState();
}

class _PromoCodeAddSectionState extends State<PromoCodeAddSection> {
  bool _isShowVoucher = false;

  final TextEditingController textEditingVoucherController =
      TextEditingController();
  final TextEditingController textEditingOfferController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final String error = 'Promo Code not available.';
  bool _validate = false;

  @override
  void dispose() {
    textEditingVoucherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PromoCodeApplyBloc, PromoCodeApplyState>(
        listener: (context, state) async {
      final error = await CacheHelper.getCachedString(kErrorLog);
      if (state.theState == TheStates.success) {
        if (!mounted) return;
        await showDialog(
          context: context,
          builder: (context) => CustomToast(
            heading: 'Success',
            content: state.applyPromoCode?.message ?? "Applied promo code.",
            onTap: () {
              Navigator.pop(context);
            },
            isSuccess: true,
          ),
        );
      }
      if (state.theState == TheStates.failure) {
        if (!mounted) return;
        await showDialog(
          context: context,
          builder: (context) => CustomToast(
            heading: 'Failure',
            content: error ?? "Please try again.",
            onTap: () {},
            isSuccess: false,
          ),
        );
      }
    }, builder: (context, state) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _isShowVoucher = !_isShowVoucher;
                },
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              color: _isShowVoucher ? Colors.blue.shade50 : Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 5),
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
                  child: Form(
                    key: _formKey,
                    child: AddVoucherAndOffersContainer(
                      validate: _validate,
                      applyTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<PromoCodeApplyBloc>().add(PromoCodeApply(
                              uuid: '7b8eabe2-82ad-4dc3-ac43-82bbdca64783',
                              offer_type: 'promo_code',
                              code: textEditingVoucherController.text));
                          setState(() {
                            textEditingVoucherController.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                          });
                        }
                        ;
                      },
                      labelText: 'Apply',
                      controller: textEditingVoucherController,
                    ),
                  ),
                )
              : SizedBox(),
          _isShowVoucher
              ? SizedBox(
                  height: 10,
                )
              : SizedBox(),
          // GestureDetector(
          //   onTap: () {
          //     setState(
          //       () {
          //         _isShowOffer = !_isShowOffer;
          //         _isShowVoucher = false;
          //       },
          //     );
          //   },
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     color: _isShowOffer ? Colors.blue.shade50 : Colors.grey.shade50,
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //         left: 25.0,
          //       ),
          //       child: Text(
          //         'Select Offer ',
          //         style: _isShowOffer
          //             ? kPurpleText16
          //             : TextStyle(
          //                 fontWeight: FontWeight.bold, color: Colors.blue),
          //       ),
          //     ),
          //   ),
          // ),
          // _isShowOffer
          //     ? Visibility(
          //         visible: _isShowOffer,
          //         child: AddVoucherAndOffersContainer(
          //             labelText: 'Redeem',
          //             controller: textEditingOfferController),
          //       )
          //     : SizedBox(),
        ],
      );
    });
  }
}

class AddVoucherAndOffersContainer extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? applyTap;
  final String? labelText;
  final bool? validate;
  const AddVoucherAndOffersContainer({
    Key? key,
    this.controller,
    this.applyTap,
    this.labelText,
    this.validate,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 115,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: CustomFormField(
                    child: CustomTextFormField(
                      controller: controller,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Enter Code',
                      validator: validateNotEmpty,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: CustomElevatedButton(
                  label: labelText ?? "",
                  callback: () {
                    applyTap!();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
