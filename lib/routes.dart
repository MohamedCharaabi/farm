import 'package:farm_mobile/screens/farmer/views/alimentation_screen.dart';
import 'package:farm_mobile/screens/farmer/call_transporter_form.dart';
import 'package:farm_mobile/screens/farmer/daily_process_form.dart';
import 'package:farm_mobile/screens/Auth/reset_pass_screen.dart';
import 'package:farm_mobile/screens/Auth/signin_screen.dart';
import 'package:farm_mobile/screens/Auth/signup_screen.dart';
import 'package:farm_mobile/screens/farmer/add_process.dart';
import 'package:farm_mobile/screens/farmer/views/all_animals_screen.dart';
import 'package:farm_mobile/screens/buyer/buyer_main_screen.dart';
import 'package:farm_mobile/screens/calculation/calculate_screen.dart';
import 'package:farm_mobile/screens/calculation/result_screen.dart';
import 'package:farm_mobile/screens/farmer/views/lait/lait_screen.dart';
import 'package:farm_mobile/screens/farmer/my_farm_screen.dart';
import 'package:farm_mobile/screens/farmer/main_screen.dart';
import 'package:farm_mobile/screens/farmer/processing_screen.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard2.dart';
import 'package:farm_mobile/screens/profile/buyer_profile.dart';
import 'package:farm_mobile/screens/profile/farmer_profil_screen.dart';
import 'package:farm_mobile/screens/profile/transporter_profil_screen.dart';
import 'package:farm_mobile/screens/farmer/sell_post_detail_screen.dart';
import 'package:farm_mobile/screens/farmer/sell_post_response_screen.dart';
import 'package:farm_mobile/screens/farmer/settings_screen.dart';
import 'package:farm_mobile/screens/farmer/shop_screen.dart';
import 'package:farm_mobile/screens/farmer/splash_screen.dart';
import 'package:farm_mobile/screens/farmer/transport_call_screen.dart';
import 'package:farm_mobile/screens/transporter/car_transport_history.dart';
import 'package:farm_mobile/screens/transporter/cars_screen.dart';
import 'package:farm_mobile/screens/transporter/feed_screen.dart';
import 'package:farm_mobile/screens/transporter/transports_screen.dart';
import 'package:farm_mobile/screens/transporter/transporter_main_screen.dart';

final routes = {
  // '/': (context) => const SplashScreen(),
  '/signup': (context) => const SignupScreen(),
  '/signin': (context) => const SigninScreen(),
  '/resetpass': (context) => const ResetPasswordScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/main': (context) => const MainScreen(),
  '/farmer_dash': (context) => const FarmerDashbord(),
  '/farmer_dash_2': (context) => const FarmerDashbord2(),
  '/myfarm': (context) => const MyFarmScreen(),
  '/shop': (context) => const ShopScreen(),
  '/add_process': (context) => const AddProcess(),
  '/all_animals': (context) => AllAnimals(),
  '/alimentation': (context) => AlimentationScreen(),
  '/lait': (context) => LaitScreen(),
  '/result': (context) => const ResultCalculationScreen(),
  '/transport_call': (context) => const TransportCallScreen(),
  '/farmer_profile': (context) => const FarmerProfileScreen(),
  '/daily_process': (context) => const DailyProcessForm(),
  '/call_transporter_form': (context) => const CallTransporterForm(),
  '/sell_post_responses': (context) => const SellPostResponses(),
  '/sell_post_detail': (context) => const SellPostDetailScreen(),
  // transporter
  '/transporter_main': (context) => const TransporterMainScreen(),
  '/transporter_feed': (context) => const TransporterFeedScreen(),
  '/transporter_transports': (context) => const TransportsScreen(),
  '/transporter_cars': (context) => const CarsScreen(),
  '/transporter_profil': (context) => const TransporterProfileScreen(),
  '/transporter_car_history': (context) => const CarTransportHistory(),
  // buyer
  '/buyer_main': (context) => const BuyerMainScreen(),
  '/buyer_profile': (context) => const BuyerProfileScreen(),
};
