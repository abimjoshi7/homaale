import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/billing_payment_page/presentation/add_payment_method_form.dart';
import 'package:cipher/features/billing_payment_page/presentation/billing_payment_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/connected_account/connected_account_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/deactivate_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/help_legal_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_details.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_profile.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/presentation/kyc_view.dart';
import 'package:cipher/features/account_settings/presentation/pages/languages_page/languages_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/membership/membership.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/password_and_security.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/account_view.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/pages/edit_profile_page.dart';
import 'package:cipher/features/account_settings/presentation/pages/profile/profile.dart';
import 'package:cipher/features/account_settings/presentation/pages/settings/settings.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/booking_cancel/presentation/pages/booking_cancel_page.dart';
import 'package:cipher/features/bookings/presentation/pages/booked_service_page.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_item_detail_page.dart';
import 'package:cipher/features/bookings/presentation/pages/my_bookings_page.dart';
import 'package:cipher/features/categories/presentation/pages/categories_page.dart';
import 'package:cipher/features/chat/view/chat_listing.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/checkout/presentation/pages/checkout_page.dart';
import 'package:cipher/features/contact_us/presentation/contact_us_page.dart';
import 'package:cipher/features/documents/presentation/pages/edit/edit_portfolio.dart';
import 'package:cipher/features/documents/presentation/pages/pages.dart';
import 'package:cipher/features/event/presentation/pages/event_details_page.dart';
import 'package:cipher/features/following_followers/presentation/following_followers_page.dart';
import 'package:cipher/features/google_maps/presentation/google_maps_page.dart';
import 'package:cipher/features/home/presentation/pages/home.dart';
import 'package:cipher/features/invoice/presentation/pages/invoice_page.dart';
import 'package:cipher/features/notification/presentation/pages/notification_home.dart';
import 'package:cipher/features/notification/presentation/pages/notifications_page.dart';
import 'package:cipher/features/offers/presentation/pages/offers_page.dart';
import 'package:cipher/features/onboarding/presentation/pages/onboarding.dart';
import 'package:cipher/features/order/presentation/pages/order_invoice_page.dart';
import 'package:cipher/features/payment/presentation/pages/add_payment_method_page.dart';
import 'package:cipher/features/payment/presentation/pages/payment_page.dart';
import 'package:cipher/features/payment/presentation/pages/payment_summary_page.dart';
import 'package:cipher/features/preference/presentation/pages/preference.dart';
import 'package:cipher/features/profile/presentation/pages/profile.dart';
import 'package:cipher/features/rating_reviews/presentation/rating_reviews.dart';
import 'package:cipher/features/sandbox/presentation/pages/sandbox_page.dart';
import 'package:cipher/features/saved/presentation/pages/saved_collection_page.dart';
import 'package:cipher/features/saved/presentation/pages/saved_page.dart';
import 'package:cipher/features/services/presentation/pages/post_service_page.dart';
import 'package:cipher/features/categories/presentation/pages/category_professional_service_section.dart';
import 'package:cipher/features/services/presentation/pages/trending_services_page.dart';
import 'package:cipher/features/bookings/presentation/pages/service_booking_page.dart';
import 'package:cipher/features/support/presentation/support_ticket_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/services/presentation/pages/services_page.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/features/sign_up/presentation/pages/pages.dart';
import 'package:cipher/features/splash/presentation/pages/splash_page.dart';
import 'package:cipher/features/task/presentation/pages/all_task_page.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/post_task_page.dart';
import 'package:cipher/features/task/presentation/pages/posted_task_view_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/tasker/presentation/view/tasker.dart';
import 'package:cipher/features/task/presentation/pages/popular_tasker_page_new.dart';
import 'package:cipher/features/tax_calculator/presentation/screens/tax_calculator.dart';
import 'package:cipher/features/transaction/presentation/pages/my_transactions_page.dart';
import 'package:cipher/features/user_location/presentation/choose_location_page.dart';
import 'package:cipher/features/wallet/presentation/wallet_page.dart';
import 'package:cipher/features/wallet/presentation/withdraw_page.dart';
import 'package:flutter/material.dart';
import '../../features/account_settings/presentation/pages/legals/legals_page.dart';
import '../../features/account_settings/presentation/pages/quick_links/horoscope.dart';
import '../../features/account_settings/presentation/pages/quick_links/quick_link_page.dart';
import '../../features/content_client/presentation/pages/pages.dart';
import '../../features/faq_and_data_deletion/data_deletion_policy.dart';
import '../../features/faq_and_data_deletion/faq_page.dart';
import '../../features/payment/presentation/pages/payment_ongoing_page.dart';
import '../../features/redeem/presentation/pages/redeem_page.dart';
import '../../features/support/presentation/widgets/help_and_support.dart';
import '../../features/support/presentation/widgets/report_page.dart';

class AppRouter {
  Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case Onboarding.routeName:
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
        );
      case Root.routeName:
        return MaterialPageRoute(
          builder: (context) => const Root(),
          settings: settings,
        );
      case SignInPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
          settings: settings,
        );
      case SupportTicketPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SupportTicketPage(),
          settings: settings,
        );
      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
          settings: settings,
        );
      case GoogleMapsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const GoogleMapsPage(),
          settings: settings,
        );
      case ChooseLocationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChooseLocationPage(),
          settings: settings,
        );
      case ConfirmOtpPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ConfirmOtpPage(),
          settings: settings,
        );
      case OtpSignUp.routeName:
        return MaterialPageRoute(
          builder: (context) => const OtpSignUp(),
          settings: settings,
        );
      case ResendVerificationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ResendVerificationPage(),
          settings: settings,
        );
      case TermsOfUsePage.routeName:
        return MaterialPageRoute(
          builder: (content) => const TermsOfUsePage(),
          settings: settings,
        );
      case PrivacyPolicyPage.routeName:
        return MaterialPageRoute(
          builder: (content) => const PrivacyPolicyPage(),
          settings: settings,
        );
      case FacebookLogin.routeName:
        return MaterialPageRoute(
          builder: (context) => const FacebookLogin(),
        );
      case GoogleLogin.routeName:
        return MaterialPageRoute(
          builder: (context) => const GoogleLogin(),
        );
      case SignUpPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case Profile.routeName:
        return MaterialPageRoute(
          builder: (context) => const Profile(),
        );
      case TaskerProfileView.routeName:
        return MaterialPageRoute(
          builder: (context) => const TaskerProfileView(),
        );
      case AddPortfolio.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddPortfolio(),
        );
      case AddExperience.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddExperience(),
        );
      case AddEducation.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddEducation(),
        );
      case AddCertifications.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddCertifications(),
        );
      case Preference.routeName:
        return MaterialPageRoute(
          builder: (context) => const Preference(),
        );
      case Home.routeName:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case AccountSettings.routeName:
        return MaterialPageRoute(
          builder: (context) => const AccountSettings(),
        );
      case QuickLinksPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const QuickLinksPage(),
        );
      case HoroscopePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HoroscopePage(),
        );
      case LegalsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LegalsPage(),
        );
      case HelpAndSupportPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HelpAndSupportPage(),
        );
      case CommonReportPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CommonReportPage(),
          settings: settings,
        );
      case AccountView.routeName:
        return MaterialPageRoute(
          builder: (context) => const AccountView(),
          settings: settings,
        );
      case Settings.routeName:
        return MaterialPageRoute(
          builder: (context) => const Settings(),
        );
      case PasswordAndSecurity.routeName:
        return MaterialPageRoute(
          builder: (context) => const PasswordAndSecurity(),
        );
      case CompleteProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CompleteProfilePage(),
        );
      case EditProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const EditProfilePage(),
        );
      case KycDetails.routeName:
        return MaterialPageRoute(
          builder: (context) => const KycDetails(),
        );
      case KycProfile.routeName:
        return MaterialPageRoute(
          builder: (context) => const KycProfile(),
        );
      case KycView.routeName:
        return MaterialPageRoute(
          builder: (context) => const KycView(),
        );
      case SavedPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SavedPage(),
        );
      case SavedCollectionPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SavedCollectionPage(),
          settings: settings,
        );
      case Membership.routeName:
        return MaterialPageRoute(
          builder: (context) => const Membership(),
        );
      case ConnectedAccountPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ConnectedAccountPage(),
        );
      case NotificationsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const NotificationsPage(),
        );
      case LanguagesPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LanguagesPage(),
        );
      case BillingAndPaymentPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const BillingAndPaymentPage(),
        );
      case HelpAndLegalPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HelpAndLegalPage(),
        );
      case AdditionalAccountInfoPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AdditionalAccountInfoPage(),
        );
      case DeactivatePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const DeactivatePage(),
        );
      case MyBookingsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyBookingsPage(),
        );
      case TaskEntityServicePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const TaskEntityServicePage(),
          settings: settings,
        );
      case CategoriesPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CategoriesPage(),
          settings: settings,
        );
      case ServicesPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ServicesPage(),
          settings: settings,
        );
      case CategoryProfessionalServiceSection.routeName:
        return MaterialPageRoute(
          builder: (context) => const CategoryProfessionalServiceSection(),
          settings: settings,
        );
      case EditPortfolio.routeName:
        return MaterialPageRoute(
          builder: (context) => const EditPortfolio(),
          settings: settings,
        );
      case PostServicePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PostServicePage(),
          settings: settings,
        );
      case CheckoutPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CheckoutPage(),
          settings: settings,
        );
      case ChatListingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChatListingPage(),
          settings: settings,
        );
      case ChatPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
          settings: settings,
        );
      case PaymentPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PaymentPage(),
          settings: settings,
        );
      case AddPaymentMethodPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddPaymentMethodPage(),
          settings: settings,
        );
      case PaymentSummaryPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PaymentSummaryPage(),
          settings: settings,
        );
      case OrderInvoicePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const OrderInvoicePage(),
          settings: settings,
        );
      case PaymentOnGoingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PaymentOnGoingPage(),
          settings: settings,
        );
      case InvoicePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const InvoicePage(),
          settings: settings,
        );
      case PostedTaskViewPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PostedTaskViewPage(),
          settings: settings,
        );
      case PostTaskPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const PostTaskPage(),
          settings: settings,
        );
      case TaxCalculator.routeName:
        return MaterialPageRoute(
          builder: (context) => const TaxCalculator(),
          settings: settings,
        );
      case TrendingServicesPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const TrendingServicesPage(),
          settings: settings,
        );
      case ApplyTaskPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ApplyTaskPage(),
          settings: settings,
        );
      case SingleTaskPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SingleTaskPage(),
          settings: settings,
        );
      // case PopularTaskerPage.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const PopularTaskerPage(),
      //     settings: settings,
      //   );
      case PopularTaskerNew.routeName:
        return MaterialPageRoute(
          builder: (context) => const PopularTaskerNew(),
        );
      case OffersPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const OffersPage(),
          settings: settings,
        );
      case AllTaskPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AllTaskPage(),
          settings: settings,
        );
      case ContactUsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ContactUsPage(),
        );
      case FaqPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const FaqPage(),
        );
      case DataDeletionPolicy.routeName:
        return MaterialPageRoute(
          builder: (context) => const DataDeletionPolicy(),
        );
      case RatingReviewsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const RatingReviewsPage(),
        );
      case RedeemPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const RedeemPage(),
        );
      case ServiceBookingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ServiceBookingPage(),
          settings: settings,
        );
      case FollowingFollowersPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const FollowingFollowersPage(),
        );
      case SandboxPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SandboxPage(),
        );
      case NotificationFromHome.routeName:
        return MaterialPageRoute(
          builder: (context) => const NotificationFromHome(),
          settings: settings,
        );
      case BookedServicePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const BookedServicePage(),
          settings: settings,
        );
      case BookingItemDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const BookingItemDetailPage(),
          settings: settings,
        );
      case BookingCancelPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const BookingCancelPage(),
          settings: settings,
        );
      case EventDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const EventDetailsPage(),
          settings: settings,
        );
      case MyTransactionsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyTransactionsPage(),
          settings: settings,
        );
      case WalletPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const WalletPage(),
          settings: settings,
        );
      case WithdrawPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const WithdrawPage(),
          settings: settings,
        );
      case AddPaymentMethodForm.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddPaymentMethodForm(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
