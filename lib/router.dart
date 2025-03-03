import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sugar_mill_app/views/Crop_Sampling_screens/add_sampling_view/add_crop_sampling_screen.dart';
import 'package:sugar_mill_app/views/Crop_Sampling_screens/list_completed_sampling_view/list_Completed_sampling_screen.dart';
import 'package:sugar_mill_app/views/Crop_Sampling_screens/list_sampling_view/list_sampling_screen.dart';
import 'package:sugar_mill_app/views/agriculture_screens/add_agri_view/add_agri_screen.dart';
import 'package:sugar_mill_app/views/agriculture_screens/list_agri_view/list_agri_screen.dart';
import 'package:sugar_mill_app/views/cane_screens/add_cane_view/add_cane_screen.dart';
import 'package:sugar_mill_app/views/cane_screens/list_cane_view/list_cane_screen.dart';

import 'package:sugar_mill_app/views/farmer_screens/add_farmer_view/add_farmer_screen.dart';
import 'package:sugar_mill_app/views/home_view/home_view_screen.dart';
import 'package:sugar_mill_app/views/login_view/login_view_screen.dart';
import 'package:sugar_mill_app/views/reports/Cane%20Registration%20Report/cane_registration_screen.dart';
import 'package:sugar_mill_app/views/reports/report_screen.dart';
import 'package:sugar_mill_app/views/reports/userwise%20cane%20register/userwise_registration_screen.dart';
import 'package:sugar_mill_app/views/reports/varitywise%20cane%20registration%20data/varietywise_cane_registration_screen.dart';
import 'package:sugar_mill_app/views/reports/yard_balance/yard_balane_screen.dart';
import 'package:sugar_mill_app/views/splash_screen_view/splash_screen.dart';
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_list/add_tripsheet_list_screen.dart';
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_view/add_tripsheet_screen.dart';
import 'views/farmer_screens/list_farmers_view/list_farmers_screen.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),

    MaterialRoute(page: HomePageScreen),
    MaterialRoute(page: LoginViewScreen),
    // DetailedFarmerScreen
    MaterialRoute(page: AddFarmerScreen),
    // ListFarmerScreen
    MaterialRoute(page: ListFarmersScreen),
    // DetailedCaneScreen
    MaterialRoute(page: AddCaneScreen),
    // ListCaneScreen
    MaterialRoute(page: ListCaneScreen),
    // DetailedAgriScreen
    MaterialRoute(page: AddAgriScreen),
    // ListAgriScreen
    MaterialRoute(page: ListAgriScreen),
    // DetailedSamplingScreen
    MaterialRoute(page: AddCropSamplingScreen),
    // ListSamplingScreen
    MaterialRoute(page: ListSamplingScreen),
    MaterialRoute(page: ListCompletedSamplingScreen),

    MaterialRoute(page: AddTripSheetScreen),
    // ListFarmerScreen
    MaterialRoute(page: TripsheetMaster),
    MaterialRoute(page: UserWiseRegistrationReport),
    MaterialRoute(page: ReportScreen),
    MaterialRoute(page: CaneRegistrationReport),
    MaterialRoute(page: VarietyWiseCaneRegistrationReport),
     MaterialRoute(page: YardBalaneScreen)

  ],
  dependencies: [
    Singleton(classType: NavigationService),
  ],
)
class App {
  //empty class, will be filled after code generation
}
// flutter pub run build_runner build --delete-conflicting-outputs
