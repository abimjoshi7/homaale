import 'package:dependencies/dependencies.dart';
// this is common public key taken from blog post , need to change this key
// only applying for test purpose

const String testPublicKey = 'test_public_key_dc74e0fd57cb46cd93832aee0a507256';
final config = PaymentConfig(
  amount: 10000, // Amount should be in paisa , this is also test amount need to change all those attribute too.
  productIdentity: 'dell-g5-g5510-2021',
  productName: 'Dell G5 G5510 2021',
  productUrl: 'https://www.khalti.com/#/bazaar',
  additionalData: { // Not mandatory; can be used for reporting purpose
    'vendor': 'Khalti Bazaar',
  },
);
