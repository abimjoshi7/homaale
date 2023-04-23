import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xffFF8F00),
  Color(0xffAA00DE),
  Color(0xff4CAF50),
  Color(0xffFFC107),
  Color(0xff101EE1),
  Color(0xffD9226F),
  Color(0xff62A2DD),
  Color(0xff9977D9),
];

final categoriesNameList = <String>[
  'Beauty',
  'Fitness',
  'Household',
  'Party Planner',
  'Courier Service',
  'Maintenance',
  'Classes',
  'Health & Care',
  'Creative Arts and Design',
  'Science',
  'Sports',
  'Tourism',
  'Media',
  'Logistics',
  'Utilities',
  'Marketing',
];

final categoriesAssetPath = <String>[
  'assets/categories/self_care.png',
  'assets/categories/fitness_center.png',
  'assets/categories/cleaning_services.png',
  'assets/categories/celebration.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
  'assets/categories/airport_shuttle.png',
  'assets/categories/engineering.png',
  'assets/categories/school.png',
  'assets/categories/medication_liquid.png',
];

List<String> bottomNavItemImagePath = [
  'assets/bottomNavigationItems/home.png',
  'assets/bottomNavigationItems/2.png',
  'assets/bottomNavigationItems/3.png',
  'assets/bottomNavigationItems/1.png',
  'assets/bottomNavigationItems/4.png',
];

List<String> bottomNavItemName = [
  'Home',
  'Search',
  'Add',
  'Bookings',
  'Account',
];

List<String> weekNames = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
];

const bookmarkTypeList = [
  "All",
  "Users",
  "Services",
  "Taskers",
];

List<Widget> notableBannerList = [
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable1.png',
      fit: BoxFit.fill,
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable2.png',
      fit: BoxFit.fill,
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/banners/notable3.png',
      fit: BoxFit.fill,
    ),
  ),
];

List<Widget> offerBanner = [
  SizedBox(
    width: double.infinity,
    child: Image.asset(
      'assets/banners/1.png',
      fit: BoxFit.fitWidth,
    ),
  ),
  SizedBox(
    width: double.infinity,
    child: Image.asset(
      'assets/banners/2.png',
      fit: BoxFit.fitWidth,
    ),
  ),
];

List<String> bookingDropDownStrings = [
  "All",
  "Tasks",
  "Services",
];
Map<String, dynamic> getStatus(String status) {
  switch (status) {
    case "cancelled":
      return {
        "color": Colors.red.shade200,
        "status": "Booking Cancelled",
      };
    case "closed":
      return {
        "color": kColorPurple,
        "status": "Booking Closed",
      };
    case "approved":
      return {
        "color": kColorBlue,
        "status": "Ask Payment",
      };
    case "pending":
      return {
        "color": kColorTeal,
        "status": "Waiting for Approval",
      };
    case "rejected":
      return {
        "color": Colors.red.shade800,
        "status": "Booking Rejected",
      };
    case "On Progess":
      return {
        "color": kColorGreen,
        "status": "In Progress",
      };

    default:
      return {
        "color": kColorPrimary,
        "status": "Apply",
      };
  }
}

Map<String, dynamic> getNotificationStatus(
    {required String status,
    required bool isRequested,
    String? userName,
    String? serviceName}) {
  switch (status) {
    case "declined":
      return {
        "color": Colors.red.shade200,
        "status": "Declined",
        "message":
            "Your ${isRequested ? 'task' : 'service'} $serviceName has been declined.",
        'assets': 'assets/notification/declined.svg'
      };
    case "completed":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message":
            "Your ${isRequested ? 'task' : 'service'} $serviceName has been completed successfully.",
        'assets': 'assets/notification/completed_task.svg'
      };
    case "pending":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been booked. Waiting for approval.",
        'assets': 'assets/notification/completed_task.svg'
      };
    case "completed_task":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message": "You $serviceName has been completed successfully.",
        'assets': 'assets/notification/completed_task.svg'
      };
    case "approved":
      return {
        "color": Color(0xff1EB2A6),
        "status": "Approved",
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been approved.",
      };
    case "approval":
      return {
        "color": Color(0xff1EB2A6),
        "status": "Approved",
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been approved.",
      };
    case "booking":
      return {
        "color": kColorBlue,
        "status": "Booking",
        "message": "$userName has booked your $serviceName.",
      };
    case "created":
      return {
        "color": Colors.red.shade800,
        "status": "Create",
        "message":
            "You have successfully created a ${isRequested ? 'task' : 'service'} $serviceName.",
        'assets': 'assets/notification/service_created.svg'
      };
    case "waiting":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message":
            "You have successfully applied for ${isRequested ? 'task' : 'service'} $serviceName.",
        'assets': 'assets/notification/waiting.svg'
      };
    case "rejected":
      return {
        "color": Colors.red.shade800,
        "status": "Rejected",
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been rejected.",
      };
    case "cancelled":
      return {
        "color": Colors.red.shade800,
        "status": "Cancelled",
        "message":
            " has cancelled the ${isRequested ? 'task' : 'service'} completion.",
      };
    case "payment completed":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message":
            "Your ${isRequested ? 'task' : 'service'} $serviceName has been completed successfully .",
        'assets': 'assets/notification/payment.svg'
      };

    default:
      return {
        "color": kColorPrimary,
        "status": "$status",
        "message": "",
        "assets": "",
      };
  }
}
