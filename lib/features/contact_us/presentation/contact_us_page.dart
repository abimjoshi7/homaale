import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/contact_card.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  static const String routeName = '/contact-us';
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Contact Us',trailingWidget: SizedBox()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SvgPicture.asset('assets/contact_us.svg'),
          Text(
            'Get Support for the App',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          addVerticalSpace(16),
          ContactCard(
            iconData: Icons.perm_contact_calendar,
            label: 'Support Contact',
            subLabel: '+977-9805674418',
          ),
          ContactCard(
            iconData: Icons.email,
            label: 'Email',
            subLabel: 'homaale@gmail.com',
          ),
          ContactCard(
            iconData: Icons.web_rounded,
            label: 'Website',
            subLabel: 'www.homaale.com',
          )
        ],
      ),
    );
  }
}
