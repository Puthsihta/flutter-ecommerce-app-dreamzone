import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const bodyPadding = EdgeInsets.all(16);

const paddingHorizontal = EdgeInsets.symmetric(horizontal: 10);
const marginAll = EdgeInsets.all(10);
const marginVerticail = EdgeInsets.symmetric(vertical: 10);
const marginHorizontal = EdgeInsets.symmetric(horizontal: 10);
const paddingVertical = EdgeInsets.symmetric(vertical: 10);

/// The standard body padding for the app.
const kBodyPadding = EdgeInsets.symmetric(horizontal: 20);
const kPadding = EdgeInsets.all(20);

/// The standard button padding for the app.
const kButtonPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 16);

/// The standard app bar button size.
const double kAppBarButtonSize = 56;

/// The standard date format for the app.
final DateFormat kDateFormatter = DateFormat('dd MMM yyyy');

final ShapeBorder kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

final BorderRadius kBorderRadius = BorderRadius.circular(10);

class ProductCategories {
  static const addOns = 'addOns';
  static const ent = 'ent';
  static const ins = 'ins';
  static const vas = 'vas';
  static const bal = 'bal';
  static const tariffplan = 'tariffplan';
}

final List<String> primaryInfo = [
  // ignore: lines_longer_than_80_chars
  'Your primary account is the first phone number that you use to log into the app.',
  // ignore: lines_longer_than_80_chars
  'You can manage all other devices or sessions that are using your primary number.',
  // ignore: lines_longer_than_80_chars
  'You can manage all other devices or sessions that are using your primary number.',
];

class DiscoverComponentType {
  static const bannerCarousel = 'banner_carousel';
  static const bundleCarousel = 'bundle_carousel';
  static const gridDisplay = 'grid_display';
  static const bundleCarouselTitle = 'bundle_carousel_title';
  static const bundleListing = 'bundle_listing';
  static const gradientButton = 'gradient_button';
}

class DiscoverBannerRatio {
  static const double height = 249;
  static const double width = 374;
}

class SubscriptionHeaderStatus {
  static const pendingRenewal = 'Subscription is pending renewal';
  static const planOnHold = 'Plan is on hold';
  static const renewToday = 'Renewing today';
  static const renewTomorrow = 'Renewing tomorrow';
  static const expireToday = 'Expiring today';
  static const expireTomorrow = 'Expiring tomorrow';
}

class HotPromoType {
  static const event = 'event';
  static const game = 'game';
}

class SubscriptionType {
  static const tv = 'tv';
  static const game = 'game';
  static const ktv = 'ktv';
  static const tariffPlan = 'tariffPlan';
  static const edu = 'edu';
  static const addons = 'addons';
  static const vas = 'vas';
  static const ins = 'ins';
  static const bonus = 'bonus';
}

class HotPromoDetailComponentType {
  static const htmlText = 'html_text';
  static const mediaListing = 'media_listing';
  static const text = 'text';
}

class HotPromoDetailMediaType {
  static const youtube = 'youtube';
  static const image = 'image';
  static const video = 'video';
  static const facebook = 'facebook';
}

class TutorialType {
  static const login = 'LOGIN';
  static const topup = 'TOPUP';
  static const product = 'PRODUCT';
}

class InformationType {
  static const companyProifile = 'COMPANY_PROFILE';
  static const termsAndConditions = 'TERMS_AND_CONDITIONS';
  static const userRegisterAndUpdateTerms = 'USER_REGISTER_AND_UPDATE_TERMS';
  static const userRegisterAndUpdatePolicy = 'USER_REGISTER_AND_UPDATE_POLICY';
}

class ActionBehaviorType {
  static const weblink = 'weblink';
  static const call = 'call';
  static const deeplink = 'deeplink';
}

class AppAssetType {
  static const homeTopup = 'HOME_TOPUP';
  static const homeAppbar = 'HOME_APPBAR';
  static const paymentOption = 'PAYMENT_OPTION';
  static const splashScreen = 'SPLASH_SCREEN';
}

class TransactionEvent {
  static const subscription = 'Subscription';
  static const topUp = 'Top up';
  static const other = 'Other';
  static const voice = 'Voice';
  static const sms = 'SMS';
  static const adjustment = 'Adjustment';
  static const data = 'GPRS';
}

class TransactionSubEvent {
  static const sendGift = 'Send Gift';
  static const autoRenewal = 'Auto Renewal';
  static const subscription = 'Subscription';
}

class MaintenanceKey {
  static const appMaintenance = 'APP_MAINTENANCE';
  static const appForceUpdate = 'APP_FORCE_UPDATE';
  static const loginMaintenance = 'LOGIN_MAINTENANCE';
  static const userServiceMaintenance = 'USER_SERVICE_MAINTENANCE';
  static const accountMaintenance = 'ACCOUNT_MAINTENANCE';
}

class PackagePlan {
  static const prepaid = 'prepaid';
  static const postpaid = 'postpaid';
}

class LanguageLocale {
  static const khmer = 'km-KH';
  static const english = 'en-US';
  static const chinese = 'zh-CN';
}

final simLanguage = {
  'km-KH': 'KHMER',
  'en-US': 'ENGLISH',
  'zh-CN': 'CHINESE',
};

class ProfileStatus {
  static const active = 'ACTIVE';
  static const inactive = 'INACTIVE';
  static const valid = 'VALID';
  static const toBeDelete = 'TO BE DELETE';
}

class LinkedType {
  static const master = 'MASTER';
  static const visa = 'VISA';
  static const aba = 'ABA_ACCOUNT';
}

class NotificationType {
  static const information = 'Information';
  static const transaction = 'Transaction';
  static const announcement = 'Announcement';
}

class TopupType {
  static const scratchCard = 'SCRATCH_CARD';
}

class ScratchCardErrorType {
  static const noCard = 'NO_SUCH_CARD';
  static const cardUsed = 'CARD_USED';
  static const unknown = 'UNKNOWN';
  static const invalidCard = 'INVALID_CARD';
}

class ABALinkedOption {
  static const aof = 'ABA_AOF';
  static const cof = 'ABA_COF';
}

class AuthType {
  static const retister = 'Register';
  static const forgetPassword = 'ForgotPassword';
}

class OrderStatus {
  static const pending = 'Pending';
  static const confirm = 'Confirm';
  static const delivery = 'Delivery';
  static const complete = 'Complete';
  static const cancel = 'Cancel';
}
