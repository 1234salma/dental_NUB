import 'package:buisness_test/screens/choose_for_doctor.dart';
import 'package:buisness_test/screens/diagnose_one.dart';
import 'package:buisness_test/screens/patient_list.dart';
import 'package:flutter/material.dart';

import 'screens/about_us.dart'; // إضافة الـ import بتاع AboutUs.dart
import 'screens/add_tools_screen.dart';
import 'screens/chat.dart';
import 'screens/check.dart';
import 'screens/choose_for_patient.dart';
import 'screens/choose_role.dart';
import 'screens/community_free_screen.dart';
import 'screens/community_groups.dart';
import 'screens/community_store.dart';
import 'screens/completed_cases.dart';
import 'screens/confirmaion.dart';
import 'screens/contact.dart';
import 'screens/forgot_password.dart';
import 'screens/health_history.dart';
// سكرييناتك الخاصة
import 'screens/home_stu.dart';
import 'screens/login.dart';
import 'screens/onboarding_screen1.dart';
import 'screens/onboarding_screen2.dart';
import 'screens/password_created.dart';
import 'screens/patient_list_screen.dart'; // MyPatientListScreen هنا
import 'screens/product_details.dart';
import 'screens/registration.dart';
import 'screens/reset.dart';
import 'screens/settings_screen.dart';
import 'screens/sign.dart';
import 'screens/splash_screen.dart';
import 'screens/upload.dart';
import 'screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding1': (context) => OnboardingScreen1(),
        '/onboarding2': (context) => OnboardingScreen2(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/choose_role': (context) => ChooseRoleScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/check_email': (context) => CheckEmailScreen(),
        '/reset_password': (context) => ResetPasswordScreen(),
        '/password_success': (context) => PasswordSuccessScreen(),
        '/choose_patient': (context) => ChooseForPatientScreen(
              userName: '',
              userEmail: '',
            ),
        '/registration': (context) => RegistrationScreen(),
        '/upload_xray': (context) => UploadScreen(),
        '/health_history': (context) => HealthHistoryScreen(),
        '/appointment_confirmation': (context) => ConfirmationScreen(),
        '/chat': (context) => ChatScreen(),
        '/settings': (context) => SettingsScreen(
              userName: '',
              userEmail: '',
              role: '',
              academicYear: '',
              phone: '',
              clinic: '',
              id: '',
            ),
        '/choose_for_doctor': (context) => DoctorHomeView(
              userName: '',
              userEmail: '',
              role: '',
            ),
        '/patient_list_view': (context) => PatientListScreen(),
        '/diagnose_one': (context) => DiagnoseOneScreen(),

        // ⬇ سكرييناتك الخاصة الجديدة ⬇
        '/home_stu': (context) => HomeScreen(),
        '/my_patient_list': (context) =>
            MyPatientListScreen(), // المسار الجديد بدون تعارض
        '/community_store': (context) => CommunityStore(),
        '/community_free': (context) => CommunityFreeScreen(),
        '/add_tools': (context) => AddToolsScreen(
              onAddProduct: (product) {
                print('Product added: $product');
              },
            ),
        '/product_details': (context) => const ProductDetails(
              image: '',
              title: '',
              price: '',
              description: '',
              brand: '',
              isNew: false,
            ),
        '/contact': (context) => const ContactDetailsScreen(),
        '/community_groups': (context) => const CommunityGroupsScreen(),
        '/about_us': (context) => const AboutUs(),
        '/completed_cases': (context) => const CompletedCases(),
      },
    );
  }
}
