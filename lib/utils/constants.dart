class Constants {
  static String emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String baseUrl = 'https://uat-m2.tsprojects.net/taxiappuk/public/api/';
  // static String baseUrlImage = 'https://uat-m2.tsprojects.net/taxiappuk/public/storage/';


  //static String baseUrl = 'https://uat.taxiapp.uk.com/api/';
  static String baseUrlImage = 'https://uat.taxiapp.uk.com/storage/';
  static String goCardLessSuccessUrl = 'https://uat.taxiapp.uk.com/thank-you';

  // static String baseUrl = 'https://dev.taxiapp.uk.com/api/';
  // static String baseUrlImage = 'https://dev.taxiapp.uk.com/storage/';
  // static String goCardLessSuccessUrl = 'https://dev.taxiapp.uk.com/thank-you';

  static String defaultCountryCode = '+44';
  static String defaultCurrencyCode = 'GBP';


  // Socket Stuff
  static String socketBaseUrl = 'http://dev.taxiapp.uk.com:3200/';


  // GoCardLess Stuff
  static String baseUrlGoCardLess = 'https://api-sandbox.gocardless.com/';
  static String goCardLessVersion = '2015-07-06';
  static String goCardLessBearerToken = 'sandbox_OQAzGcoG4YpNztZQx6UNphWdw181Ti5QZkpkZpIx';
  static String redirectFlow = 'redirect_flows';
  // static String goCardLessSuccessUrl = 'https://www.google.com/';
  static String complete = 'complete';
  static String saveCustomerDetails = 'driver-register-cardless';
  static String payments = 'payments';


  static String baseAssetPathAuthPng = 'packages/auth_package/images/images1/';
  static String baseAssetPathAuthSvg = 'packages/auth_package/images/svgs/';
  static String baseAssetPathBookingSvg = 'packages/booking_package/images/svgs/';
  static String baseAssetPathBookingPng = 'packages/booking_package/images/pngs/';
  static String baseAssetPathSvg = 'images/pngs/';

  static String googleMapApiKey = 'AIzaSyAUTcxq_15HxdIoMK4N1f3LljTDUoTDr-A';

  static String googleDirectionsApi = 'https://maps.googleapis.com/maps/api/directions/json?travelMode=transit&avoidHighways=false&avoidFerries=true&avoidTolls=false';

  static String generateOtp = 'generate-otp';
  static String checkOtp = 'check-otp';

  static String uploadProfilePic = 'update-profile-picture';
  static String updateProfile = 'update-profile';
  static String getProfile = 'personal-details';

  static String changePassword = 'add-password';

  static String getTaxiList = 'taxi-type-list';
  static String getSectorList = 'sector-list';
  static String getCityList = 'city-list';

  static String saveCabDetails = 'driver-register-two';

  static String saveCardDetails = 'driver-register-cardless';
  static String savePayoutDetails = 'driver-register-direct-debit';

  static String login = 'login';
  static String logout = 'logout';

  static String updateOnlineStatus = 'available-mode';
  static String updateCurrentLocation = 'driver-location-update';

  static String getRideDetails = 'ride-details';
  static String driverRespondToRide = 'driver-response-to-job';
  static String driverMarkAsArrived = 'driver-ride-status-arrived';
  static String driverStartRide = 'took-pickup';
  static String driverNoShow = 'no-show-pickup';
  static String rideComplete = 'ride-complete';
  static String doPayment = 'fare';

  static String getInstantRidesList = 'instant-ride-history';
  static String getPreBookRidesList = 'prebook-ride-history';

  static String getEarnings  = 'earning-stat';


  static int userTypePassenger = 0;
  static int userTypeDriver = 1;

  static String loginTypeRegistration = '0';
  static String loginTypeForgetPassword = '1';
  static String loginTypeUpdateProfilePhone = '2';
  static String loginTypeUpdateProfileEmail = '3';

  static int uploadImageTypeProfileImage = 0;
  static int uploadImageTypeLicense = 1;
  static int uploadImageTypePhotoIdFront = 2;
  static int uploadImageTypePhotoIdBack = 3;

  static int badgeTypeGreen = 0;
  static int badgeTypeYellow = 1;
  static int badgeTypeGrey = 2;

  static String bookingTypeInstant = '0';
  static String bookingTypePreBook = '1';

  static String paymentMethodCash = '0';
  static String paymentMethodFraud = '1';

  static String rideStatusAccept = '1';
  static String rideStatusReject = '2';
  static String rideStatusNoResponse = '3'; // AutoReject

  static int rideAutoRejectTimer = 15;

  static String notificationTypeNewRide = '0'; // 0 => 'New Ride Request'
  static String notificationTypeAccepted = '1'; // 1 => 'Driver Is Allocated'
  static String notificationTypeNoRideFound = '2'; // 2 => "Could not find ride!"
  static String notificationTypeDriverArrived = '3'; // 3 => "Driver Arrived."
  static String notificationTypeRideStarted = '4'; // 4 => "Ride Started"
  static String notificationTypePassengerNotAtLocation = '5'; // 5 => "No Person At Pickup Location"
  static String notificationTypeRideCancelled = '6'; // 6 => "Ride Cancelled"
  static String notificationTypeRideCompleted = '7'; // 7 => "Ride Finished"
  static String notificationTypePaymentFraud = '16'; // 16 => "Fraud Payment"
  static String notificationTypePaymentSuccess = '18'; // 18 => "Payment Success"
  static String notificationTypeRidePaymentFailed = '19'; // 19 => "Payment Failed"
  static String notificationTypeRidePendingPaymentPaid = '9'; // 19 => "Pending Payment Paid"

  static String notificationTypePreBookConfirmation = '11'; // 19 => "PreBook Confirmation"


  static String dateFormat = 'YYYY-MM-DD';
  static String otpHashKey = '6H6uNwT7Ioy';

  static int defaultMarkerIconSize = 100;
  static double kmToMiles = 0.621371;

  static int versionNumber = 2;

}