import 'package:buisness_test/screens/choose_for_doctor.dart';
import 'package:buisness_test/screens/diagnose_one.dart';
import 'package:buisness_test/screens/patient_list.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen1.dart';
import 'screens/onboarding_screen2.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/sign.dart';
import 'screens/forgot_password.dart';
import 'screens/password_created.dart';
import 'screens/check.dart';
import 'screens/reset.dart';
import 'screens/choose_role.dart';
import 'screens/choose_for_patient.dart';
import 'screens/registration.dart';
import 'screens/upload.dart';
import 'screens/health_history.dart';
import 'screens/confirmaion.dart';
import 'screens/chat.dart';
import 'screens/settings_screen.dart'; // تأكد من إضافة ملف الإعدادات هنا

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
        '/settings': (context) => SettingsScreen(),
        '/choose_for_doctor': (context) => DoctorHomeView(
              userName: '',
              userEmail: '',
            ),
        '/patient_list_view': (context) => PatientListScreen(),
        '/diagnose_one': (context) => DiagnoseOneScreen(),
      },
    );
  }
}
