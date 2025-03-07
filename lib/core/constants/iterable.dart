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

const kCategoriesNameList = <String>[
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

const kCategoriesAssetPath = <String>[
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

const kBottomNavItemImagePath = [
  'assets/bottomNavigationItems/home.png',
  'assets/bottomNavigationItems/2.png',
  'assets/bottomNavigationItems/3.png',
  'assets/bottomNavigationItems/1.png',
  'assets/bottomNavigationItems/4.png',
];

const kBottomNavItemName = [
  'Home',
  'Search',
  'Add',
  'Bookings',
  'Account',
];

const kWeekNames = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
];

const kTaskPrefList = [
  'Part-Time',
  'Full-Time',
  'Freelance',
  'Remote',
  'On-site',
];

const kBookmarkTypeList = [
  "All",
  "Users",
  "Services",
  "Taskers",
];

const kTransactionStatus = [
  "Initiated",
  "Pending",
  "Completed",
  "Dispute",
  "Reverted",
  "Settled",
];

List<Widget> kNotableBannerList = [
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

const kBookingDropDownStrings = [
  "All",
  "Tasks",
  "Services",
];

Map<String, dynamic> getStatus(String status, {bool? isService}) {
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
    case "On Progress":
      return {
        "color": kColorGreen,
        "status": "In Progress",
      };
    case "Initiated":
      return {
        "color": kColorDarkBlue,
        "status": "Initiated",
      };
    case "Open":
      return {
        "color": kColorDarkBlue,
        "status": "Open",
      };

    default:
      return {
        "color": kColorPrimary,
        "status": isService ?? false ? "Book" : "Apply",
      };
  }
}

Map<String, dynamic> getBookingStatus(String status) {
  switch (status) {
    case "Open":
      return {
        "color": kColorAmber,
        "status": "Start Task",
      };
    case "Initiated":
      return {
        "color": kColorGrey,
        "status": "Payment pending",
      };
    case "On Progress":
      return {
        "color": kColorGreen,
        "status": "Mark as complete",
      };
    default:
      return {
        "color": kColorPrimary,
        "status": "Apply",
      };
  }
}

Map<String, dynamic> statusToUpdate(String status, bool isAssignee) {
  switch (status) {
    case "initiated":
      return {
        "buttonLabel": isAssignee ? "Payment pending" : "Proceed to orders",
        "color": isAssignee ? kColorGrey : kColorBlue,
        "status": "open",
      };
    case "open":
      return {
        "buttonLabel":
            isAssignee ? "Start Task" : "Waiting for tasker to start",
        "color": isAssignee ? kColorAmber : kColorGrey,
        "status": "on_progress",
      };
    case "on_progress":
      return {
        "buttonLabel":
            isAssignee ? "Mark as Completed" : "Your task is in progress",
        "color": isAssignee ? kColorAmber : kColorGrey,
        "status": "completed",
      };
    case "completed":
      return {
        "buttonLabel":
            isAssignee ? "Waiting for the client to approve" : "Close task",
        "color": isAssignee ? kColorGrey : kColorAmber,
        "status": "closed",
      };
    case "closed":
      return {
        "buttonLabel": isAssignee ? "Close task happy" : "Close task sad ",
        "color": kColorPink50,
        "status": "closed",
      };
    case "cancelled":
      return {
        "buttonLabel": "Cancelled",
        "color": isAssignee ? kColorGrey : kColorAmber,
        "status": "cancelled",
      };

    default:
      return {
        "buttonLabel": status,
        "color": kColorAmber,
        "status": status,
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
        "has_assets": true,
        'assets': 'assets/notification/declined.svg'
      };
    case "completed":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message":
            "Your ${isRequested ? 'task' : 'service'} $serviceName has been completed successfully.",
        "has_assets": true,
        'assets': 'assets/notification/completed_task.svg'
      };
    case "pending":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been booked. Waiting for approval.",
        "has_assets": true,
        'assets': 'assets/notification/completed_task.svg'
      };
    case "accepted":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message":
            "$userName would like to negotiate the price for the $serviceName.",
        "has_assets": false
      };
    case "negotiated":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message": "$userName updated the price for your $serviceName.",
        "has_assets": false
      };
    case "reward_earned":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message": "You have earned a reward.",
        "has_assets": true,
        'assets': 'assets/notification/reward.svg'
      };
    case "completed_task":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message": "You $serviceName has been completed successfully.",
        "has_assets": true,
        'assets': 'assets/notification/completed_task.svg'
      };
    case "approved":
      return {
        "color": Color(0xff1EB2A6),
        "status": "Approved",
        "has_assets": false,
        "message":
            "Congratulations! The ${isRequested ? 'task' : 'service'} $serviceName has been approved.",
      };
    case "approval":
      return {
        "color": Color(0xff1EB2A6),
        "status": "Approved",
        "has_assets": false,
        "message":
            "$userName is interested for the ${isRequested ? 'task' : 'service'} $serviceName.",
      };
    case "booking":
      return {
        "color": kColorBlue,
        "status": "Booking",
        "has_assets": false,
        "message":
            "Outstanding! You have booked the ${isRequested ? 'task' : 'service'} $serviceName.",
      };
    case "created":
      return {
        "color": Colors.red.shade800,
        "status": "Create",
        "message":
            "You have successfully created a ${isRequested ? 'task' : 'service'} $serviceName.",
        "has_assets": true,
        'assets': 'assets/notification/service_created.svg'
      };
    case "waiting":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message":
            "You have successfully applied for ${isRequested ? 'task' : 'service'} $serviceName.",
        "has_assets": true,
        'assets': 'assets/notification/waiting.svg'
      };
    case "rejected":
      return {
        "color": Colors.red.shade800,
        "status": "Rejected",
        "has_assets": false,
        "message":
            "The ${isRequested ? 'task' : 'service'} $serviceName has been rejected.",
      };
    case "cancelled":
      return {
        "color": Colors.red.shade800,
        "status": "Cancelled",
        "has_assets": false,
        "message":
            "${userName} has cancelled the ${isRequested ? 'task' : 'service'} $serviceName.",
      };
    case "payment completed":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message":
            "$userName has paid for the ${isRequested ? 'task' : 'service'} $serviceName.",
        "has_assets": true,
        'assets': 'assets/notification/payment.svg'
      };
    case "followed":
      return {
        "color": kColorPrimary,
        "status": "Followed",
        "message": "You have followed $userName.",
        "has_assets": false,
      };
    case "status closed":
      return {
        "color": kColorPrimary,
        "status": "Closed",
        "message":
            "$userName has closed the ${isRequested ? 'task' : 'service'} $serviceName.",
        "has_assets": false,
      };
    case "status completed":
      return {
        "color": kColorGreen,
        "status": "Completed",
        "message":
            "$userName  has completed the ${isRequested ? 'task' : 'service'} $serviceName.",
        "has_assets": true,
        'assets': 'assets/notification/payment.svg'
      };
    case "kyc_document_submitted":
      return {
        "color": kColorAmber,
        "status": "Waiting",
        "message": "Your Kyc document has been submitted.",
        "has_assets": true,
        'assets': 'assets/notification/payment.svg'
      };
    case "kyc_document_rejected":
      return {
        "color": Colors.red.shade800,
        "status": "Rejected",
        "message": "Your Kyc document has been rejected.",
        "has_assets": true,
        'assets': 'assets/notification/payment.svg'
      };
    case "kyc_document_verified":
      return {
        "color": Color(0xff1EB2A6),
        "status": "Approved",
        "message": "Your Kyc document has been verified.",
        "has_assets": true,
        'assets': 'assets/notification/payment.svg'
      };

    default:
      return {
        "color": kColorPrimary,
        "status": "$status",
        "message": "$status",
        "has_assets": false,
        "assets": "",
      };
  }
}

Map<String, dynamic> BookingTimelineStatus(String status) {
  switch (status) {
    case "initiated":
      return {
        "color": kColorGreen50,
        "textColor": kColorGreen,
        "status": "Initiated",
      };
    case "open":
      return {
        "color": kColorGreen50,
        "textColor": kColorGreen,
        "status": "Open",
      };
    case "on progress":
      return {
        "color": kColorPurple,
        "textColor": kColorDarkPurple,
        "status": "On Progress",
      };
    case "completed":
      return {
        "color": kColorAmber50,
        "textColor": kColorAmber,
        "status": "Completed",
      };
    case "closed":
      return {
        "color": kColorAmber50,
        "textColor": kColorAmber,
        "status": "Closed",
      };
    case "cancelled":
      return {
        "color": kColorPink50,
        "textColor": kColorPink,
        "status": "Cancelled",
      };

    default:
      return {
        "color": kColorAmber50,
        "textColor": kColorAmber,
        "status": status,
      };
  }
}
