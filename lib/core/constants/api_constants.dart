// * Task Entity Service
const kTaskEntityService = "/task/entity/service/";
const kMyTaskEntityServices = 'task/entity/my-entity-services/';
const kApplicantsPath = "task/entity/service/applicants/";

const taskerPath = "/tasker/";
const careerPath = "/career/vacancy/";
const localePath = "/locale/client/";

// bookmark/saved
const kBookmarkPath = "task/bookmark/";

// * bookings
const kBooking = "/task/entity/service-booking/";
const kBookingList = "task/entity/service/task/list/";
const kCreateBookingsApproval = "/task/entity/service-booking/approval/";
const kCreateBookingsDecline = "/task/entity/service-booking/reject/";
const kCreateBookingsCancel = "/task/entity/service-booking/cancel/";
const kMyBookingList = "/task/entity/service-mybooking/";
const support = "/support/";
const payment = "/payment/";
const offer = "/offer/";
const event = "/event/";

// image upload
const kFileStore = "task/filestore/";

// wallet
const kMyWallet = "wallet/mywallet/";
const kWalletHistory = "/wallet/wallethistory/";

//offers
const kOffersPath = "offer/serviceoffer/all/";

//transactions
const kTransactionPath = "/payment/transaction/";
const kTransactionDownloadPath = "/payment/transaction-csv/";

//search
const kSearchPath = "/search/dashboard/";

//categories
const kParentCategoryList = "/task/cms/task-category/list/";
const kSubCategoryList = "/task/service/list/options/";
const kShareLinks = "https://sandbox.homaale.com";

//portfolio
const kPortfolio = "tasker/portfolio/";

Map<String, Object> kUrls = {
  "user": {
    'login': "/user/login/",
    'signup': "/user/signup/",
    'changePassword': "/user/password/change/",
    'google': "/user/register/social/google-oauth2/",
    'facebook': "/user/register/social/facebook/",
    'activity': "/history/my-activities/",
  },
  "task": {
    'list': kTaskEntityService,
    'myBookings': '$kMyBookingList?is_requested=false',
    'service': '$kTaskEntityService?is_requested=false',
    'service_per_user': '$kTaskEntityService?is_requested=false&user=',
    'task': '$kTaskEntityService?is_requested=true',
    // 'my_task': '$tasks?is_requested=true',
    'requested_task': '$kMyBookingList?is_requested=true',
    // 'taskApplicantsNumber': '${tasks}tasker-count',
    // 'approvedTaskList': '${tasks}task/list/',
    'application': "/task/application",
    'assigneeDetail': "task/asignee-task-detail/",
    'assignerDetail': "task/assigner-task-detail/",
    'assignerApplication': "task",
    'heroCategory': "task/hero-category",
    'status': '${kTaskEntityService}task/status/',
  },
  "profile": {
    'portfolio': '${taskerPath}portfolio/',
    'education': '${taskerPath}education/',
    'experience': '${taskerPath}experience/',
    'certifications': '${taskerPath}certification/',
    'rating': '/task/rating',
    'other_bookings': '/task/entity/service-booking/',
    'my_bookings': '/task/entity/service-mybooking/',
  },
  "tasker": {
    'list': taskerPath,
    'profile': '${taskerPath}profile/',
    'top_tasker': '${taskerPath}top-tasker/',
    'success_story': '${taskerPath}success-story/',
  },
  "followers": {
    'list': '${taskerPath}my-followers/',
  },
  "followings": {
    'list': '${taskerPath}my-following/',
  },
  "follow": '${taskerPath}follow/',
  "category": {
    'list': '/task/task-category/nested/',
    'name': "/task/category/"
  },
  'career': {'list': '${careerPath}list/', 'detail': '${careerPath}detail/'},
  // 'blog': {'list': blogPath, 'detail': '${blogPath}detail/'},
  'wishlist': {
    'list': "task/wishlist/",
  },
  'bookmark': "/task/bookmark/",
  'locale': {
    'city': '${localePath}city/options/?search=',
  },
  // 'trusted_partners': "/landingpage/trusted-partner/",
  'hero_category': "/task/hero-category/",
  'privacyPolicy': "/landingpage/content/privacy-policy/",
  'termsandconditions': "/landingpage/content/terms-conditions/",
  'support': {'help': '${support}help/', 'helpTopics': '${support}help/topic/'},
  payment: {
    'method': '${payment}cms/payment-method/',
    'intent': '${payment}intent/',
    'order': '${payment}order/',
  },
  offer: {
    'offerCode': '${offer}applyoffercode/',
    'reedem': '${offer}redeem/',
    'list': '${offer}offerredeem/list/',
    'all': '${offer}serviceoffer/all/',
  },
  'cart': {
    'list': '/task/pay/task-list/',
    'add': '/task/add/cart/',
  },
  "event": {
    "initial": event,
    "schedule": '${event}schedule/',
  }
};
