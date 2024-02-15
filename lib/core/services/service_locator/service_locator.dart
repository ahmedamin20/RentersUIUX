import 'package:get_it/get_it.dart';
import 'package:ksb/data/repository/Information_repo/information_repo.dart';
import 'package:ksb/data/repository/brand_repo/brand_repo.dart';
import 'package:ksb/data/repository/cart_repo/cart_repo.dart';
import 'package:ksb/data/repository/category_repo/category_repo.dart';
import 'package:ksb/data/repository/change_password_repo/change_password_repo.dart';
import 'package:ksb/data/repository/contact_us_repo/conatct_us_repo.dart';
import 'package:ksb/data/repository/home_repo/home_repo.dart';
import 'package:ksb/data/repository/login_repo/login_repo.dart';
import 'package:ksb/data/repository/profile_repo/profile_repo.dart';
import 'package:ksb/data/repository/register_repo/register_repo.dart';
import 'package:ksb/modlue/chat_module/view_model/cubit/chat_cubit.dart';
import 'package:ksb/modlue/chat_module/view_model/repo/get_messages_repo/get_message_repo.dart';
import 'package:ksb/modlue/chat_module/view_model/repo/get_users_chat_repo/get_user_chat_repo.dart';
import 'package:ksb/modlue/chat_module/view_model/repo/make_alll_message_seen_repo/make_alll_message_seen_repo.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import '../../../data/repository/about_us_repo/about_us_repo.dart';
import '../../../data/repository/ads_repo/ads_repo.dart';
import '../../../data/repository/car_fixes_repo/car_fixes_repo.dart';
import '../../../data/repository/favoutite_repo/favoutite_repo.dart';
import '../../../data/repository/get_product_repo/gert_product_repo.dart';
import '../../../data/repository/grage_car_repo/grage_car_repo.dart';
import '../../../data/repository/reset_password_repo/reset_password_repo.dart';
import '../../../data/repository/verify_repo/verify_repo.dart';
import '../../../data/repository/visite_history_repo/visit_history_repo.dart';
import '../../../data/repository/visitor_car_repo.dart';
import '../../../modlue/chat_module/view_model/cubit/bind_channel/bind_cubit.dart';
import '../../../modlue/chat_module/view_model/cubit/users_chat_cubit/user_chat_cubit.dart';
import '../../../modlue/chat_module/view_model/repo/send_message_repo/send_message_repo.dart';
import '../../../notification_module/data/repositories/notification_repo_impl/notification_repo_impl.dart';
import '../../../view_model/cubit/internet_cubit/internet_cubit.dart';

final sl = GetIt.instance;
void setup()
{

  sl.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
  sl.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl());
  sl.registerSingleton<VerifyRepoImpl>(VerifyRepoImpl());
  sl.registerSingleton<GetProductRepoImpl>(GetProductRepoImpl());
  sl.registerSingleton<FavouriteRepoImpl>(FavouriteRepoImpl());
  sl.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
  sl.registerSingleton<ChangePasswordRepoImpl>(ChangePasswordRepoImpl());
  sl.registerSingleton<ResetPasswordRepoImpl>(ResetPasswordRepoImpl());
  sl.registerSingleton<VisitHistoryRepoImpl>(VisitHistoryRepoImpl());
  sl.registerSingleton<CarFixesRepoImpl>(CarFixesRepoImpl());
  sl.registerSingleton<GrageCarRepoImpl>(GrageCarRepoImpl());
  sl.registerSingleton<NotificationRepoImpl>(NotificationRepoImpl());
  sl.registerSingleton<VisitorCarRepoImpl>(VisitorCarRepoImpl());
  sl.registerSingleton<InformationRepoImpl>(InformationRepoImpl());
  sl.registerSingleton<AdsRepoImpl>(AdsRepoImpl());
  sl.registerSingleton<BrandRepoImpl>(BrandRepoImpl());
  sl.registerSingleton<CategoryRepoImpl> (CategoryRepoImpl());
  sl.registerSingleton<ContactUsRepoImpl>(ContactUsRepoImpl());

  sl.registerSingleton<SendMessageRepoImpl>(SendMessageRepoImpl());
  sl.registerSingleton<GetMessagesRepoImpl>(GetMessagesRepoImpl());
  sl.registerSingleton<MakeAllMessageSeenRepoImpl>(MakeAllMessageSeenRepoImpl());
  sl.registerSingleton<GetUserChatRepoImpl>(GetUserChatRepoImpl());
  sl.registerSingleton<AboutUsRepoImpl>(AboutUsRepoImpl());


  // dio init
  // cache init
  // cubits
  sl.registerFactory(() => InternetCubit());
  sl.registerFactory(() => CategoryCubit(sl<CategoryRepoImpl>()));
  sl.registerFactory(() =>
      ChatCubit(
    sendMessageRepo: sl<SendMessageRepoImpl>(),
    getMessagesRepo: sl<GetMessagesRepoImpl>(),
    makeAllMessageSeenRepo: sl<MakeAllMessageSeenRepoImpl>(),
  ));
  sl.registerFactory(() =>
      BindCubit(

  ));
  sl.registerFactory(() =>
      UserChatCubit(
         sl<GetUserChatRepoImpl>(),
  ));
  // sl.registerFactory(() => ChatCubit(sl<CategoryRepoImpl>()));
  // sl.registerFactory(() => GetLocatio(sl<CategoryRepoImpl>()));
  ////////////////////////////////a to z/////////////////////////
  sl.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  sl.registerSingleton<CartRepoImpl>(CartRepoImpl());

}