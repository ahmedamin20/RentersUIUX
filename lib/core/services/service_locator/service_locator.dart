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
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import '../../../data/repository/about_us_repo/about_us_repo.dart';
import '../../../data/repository/ads_repo/ads_repo.dart';
import '../../../data/repository/favoutite_repo/favoutite_repo.dart';
import '../../../data/repository/get_product_repo/gert_product_repo.dart';
import '../../../data/repository/reset_password_repo/reset_password_repo.dart';
import '../../../data/repository/verify_repo/verify_repo.dart';
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
  sl.registerSingleton<InformationRepoImpl>(InformationRepoImpl());
  sl.registerSingleton<AdsRepoImpl>(AdsRepoImpl());
  sl.registerSingleton<BrandRepoImpl>(BrandRepoImpl());
  sl.registerSingleton<CategoryRepoImpl> (CategoryRepoImpl());
  sl.registerSingleton<ContactUsRepoImpl>(ContactUsRepoImpl());

  sl.registerSingleton<AboutUsRepoImpl>(AboutUsRepoImpl());


  // dio init
  // cache init
  // cubits
  sl.registerFactory(() => InternetCubit());
  sl.registerFactory(() => CategoryCubit(sl<CategoryRepoImpl>()));

  // sl.registerFactory(() => ChatCubit(sl<CategoryRepoImpl>()));
  // sl.registerFactory(() => GetLocatio(sl<CategoryRepoImpl>()));
  ////////////////////////////////a to z/////////////////////////
  sl.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  sl.registerSingleton<CartRepoImpl>(CartRepoImpl());

}