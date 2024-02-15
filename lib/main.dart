import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/services/service_locator/service_locator.dart';
import 'package:ksb/core/theme/app_theme.dart';
import 'package:ksb/data/repository/Information_repo/information_repo.dart';
import 'package:ksb/data/repository/cart_repo/cart_repo.dart';
import 'package:ksb/data/repository/favoutite_repo/favoutite_repo.dart';
import 'package:ksb/data/repository/get_product_repo/gert_product_repo.dart';
import 'package:ksb/data/repository/home_repo/home_repo.dart';
import 'package:ksb/data/repository/profile_repo/profile_repo.dart';
import 'package:ksb/modlue/chat_module/view_model/cubit/bind_channel/bind_cubit.dart';
import 'package:ksb/modlue/chat_module/view_model/cubit/chat_cubit.dart';
import 'package:ksb/modlue/chat_module/view_model/cubit/users_chat_cubit/user_chat_cubit.dart';
import 'package:ksb/notification_module/data/repositories/notification_repo_impl/notification_repo_impl.dart';
import 'package:ksb/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:ksb/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:ksb/view_model/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:ksb/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:ksb/view_model/cubit/information_cubit/information_cubit.dart';
import 'package:ksb/view_model/cubit/internet_cubit/internet_cubit.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/view_model/cubit/location_cubit/location_cubit.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/view_model/cubit/visit_history_cubit/visit_history_cubit.dart';
import 'package:ksb/view_model/cubit/visitor_car_cubit/visitor_car_cubit.dart';
import 'package:lottie/lottie.dart';
import 'core/BlocObserver.dart';
import 'core/services/app_router.dart';
import 'data/repository/visite_history_repo/visit_history_repo.dart';
import 'data/repository/visitor_car_repo.dart';
import 'firebase_options.dart';
import 'modlue/notification_module/helpers/firebase_notification.dart';
import 'notification_module/presentation/manager/notification_controller/notificaiton_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async
{
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initialize FirebaseMessageing
  FirebaseNotification.instance.init();
  // forground message
  FirebaseNotification.instance.onMessage((message) {
    print('onMessage $message');
  });
  // background message
  FirebaseNotification.instance.onBackgroundMessage((message) {
    print('onBackgroundMessage $message');
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // initialize awesome notification
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/ic_launcher',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: ColorsManager.primaryColor,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  // setup service locator
  setup();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('fr')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    // TODO: implement initState
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
            create: (context) => ProductCubit(sl<GetProductRepoImpl>())),
        BlocProvider(
            create: (context) => FavouriteCubit(
                sl<FavouriteRepoImpl>(), sl<GetProductRepoImpl>())),
        BlocProvider(create: (context) => ProfileCubit(sl<ProfileRepoImpl>())),
        BlocProvider(
            create: (context) => VisitHistoryCubit(sl<VisitHistoryRepoImpl>())),
        BlocProvider(
            create: (context) => NotificationCubit(sl<NotificationRepoImpl>())
              ..getNotification(reset: true)
              ..getNotificationCount()
              ..subscribe()
              ..bindNotification()),
        BlocProvider(
            create: (context) => VisitorCarCubit(sl<VisitorCarRepoImpl>())),
        BlocProvider(
            create: (context) => InformationCubit(sl<InformationRepoImpl>())
              ..getTermsAndCondation()
              ..getInfo()),
        BlocProvider(create: (context) => InternetCubit()..checkConnectivity()),
        BlocProvider(create: (context) => sl<CategoryCubit>()..getCategory()),
        BlocProvider(create: (context) => sl<CategoryCubit>()..getCategory()),
        BlocProvider(create: (context) =>LocationCubit()..getLocation()),
        BlocProvider(create: (context) =>sl<ChatCubit>()),
        BlocProvider(create: (context) =>sl<BindCubit>()..subscribe(context)),
        BlocProvider(create: (context) =>sl<UserChatCubit>()..getUserChat(1)),
        
        
        ////////////////////a to z /////////////////////////

        BlocProvider(create: (context) => HomeCubit(sl<HomeRepoImpl>())..getAllBranch(page: 1)),
        BlocProvider(create: (context) => CartCubit(sl<CartRepoImpl>())),

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocListener<BindCubit, BindState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  child: BlocConsumer<LayoutCubit, LayoutState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {},
              builder: (context, state) {
                return
                    state is InternetConnected?
                    MaterialApp.router(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  key: navigatorKey,
                  builder: EasyLoading.init(),
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                  theme: LayoutCubit.get(context).isDark
                      ? AppTheme.dark
                      : AppTheme.light,
                  title: 'A to Z',

                ):   MaterialApp(
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      key: navigatorKey,
                      builder: EasyLoading.init(),
                      home:  Scaffold(
                          body: Column(
                            children:
                            [
                              SizedBox(height: 100.h,),
                              Lottie.asset('assets/json/no_internet.json'),
                              SizedBox(height: 20.h,),
                              Text('no_internet'.tr(), style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          )
                      ),
                      debugShowCheckedModeBanner: false,
                      theme: LayoutCubit.get(context).isDark ?
                      AppTheme.dark:AppTheme.light,
                      title: 'KSB',
                    );

              },
            );
          },
        ),
),
      ),
    );
  }
}
