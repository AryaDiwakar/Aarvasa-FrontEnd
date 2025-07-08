import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/permission_screen.dart';
import 'screens/buy_rent_screen.dart';
import 'screens/property_type_screen.dart';
import 'screens/location_screen.dart';
import 'screens/main_navigation_wrapper.dart';
import 'screens/ai_landing_page.dart';
import 'screens/ai_chat_page.dart';
import 'screens/content_filtering_page.dart';
import 'screens/property_search_screen.dart';
import 'screens/add_listing_page1.dart';
import 'screens/price_trends_page2.dart';
import 'screens/price_trends_page3.dart';
import 'screens/price_trends_page4.dart';
void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // initial screen

      // ✅ Define routes properly here inside MaterialApp
      routes: {
        '/buyRent': (context) => const BuyRentScreen(),
        '/propertyType': (context) => const PropertyTypeScreen(),
        '/location': (context) => const LocationScreen(),
        '/permission': (context) => const PermissionScreen(),
        '/main': (context) => const MainNavigationWrapper(),
        '/ai-landing': (context) => const AILandingPage(),
  '/ai-chat': (context) => const AIChatPage(),
        '/content-filter': (context) => const ContentFilteringPage(),
                '/property-search': (context) => const PropertySearchScreen(),
               '/price-trends-2': (context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  return PriceTrendsPage2(selectedType: args['selectedType']);
},

  '/price-trends-3': (context) => const PriceTrendsPage3(), // Add this
    '/price-trends-4': (context) => const PriceTrendsPage4(),
   

      },
    );
  }
}




 /*
void main() {
  runApp(MaterialApp(
    home: const PermissionScreen(),
    routes: {
      
      '/buyRent': (context) => const BuyRentScreen(),
      '/propertyType': (context) => const PropertyTypeScreen(),
      '/location': (context) => const LocationScreen(),
    },
  ));
}



 
import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import your home screen file

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), // 👈 Use HomePage if that's the class name
    );
  }
}





import 'package:flutter/material.dart';
import 'screens/emi_calculator_screen.dart';
import 'screens/budget_calculator_screen.dart';
import 'screens/area_converter_screen.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa Calculators',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home:  AreaConverterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'screens/property_detail_1.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aarvasa',
      theme: ThemeData(
        fontFamily: 'SF Pro',
        primarySwatch: Colors.pink,
      ),
      home: const PropertyDetail1(),
    );
  }
}


import 'package:flutter/material.dart';
import 'screens/add_listing_page1.dart';
import 'screens/add_listing_page2.dart';
import 'screens/add_listing_page3.dart';
import 'screens/add_listing_page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa Add Listing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Roboto',
      ),
 
      home: AddListingPage1(),
      routes: {
        '/add2': (context) => AddListingPage2(),
        '/add3': (context) => AddListingPage3(),
        '/add4': (context) => AddListingPage4(),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'screens/floor_plans_main.dart';
import 'screens/floor_plans_location_search.dart';
import 'screens/floor_plans_filtered_locations.dart';
import 'screens/floor_plans_units_grid.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    // home: const FloorPlansMainPage(),
      // home: const FloorPlansLocationSearch(),
       //home: const FloorPlansUnitsGridPage(),
       //home:const FloorPlanDetailPage(),    );
  }
}



import 'package:flutter/material.dart';
import 'screens/contact_us.dart';
import 'screens/notifications_center.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     //home: NotificationsCenterPage(),
      home: ContactUsPage() 
    );
  }
}


import 'package:flutter/material.dart';
import 'screens/property_search_page.dart'; // <- Make sure this file exists
import 'widgets/custom_bottom_nav.dart'; // <- Your reusable nav bar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'YourCustomFont', // Replace if using a custom font
      ),
      home: const PropertySearchPage(), // This is your new animated screen
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/blog_page.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BlogPage(), // set BlogPage as home temporarily
    );
  }
}



import 'package:flutter/material.dart';
import 'package:aarvasa_app/constants/colors.dart';
import 'package:aarvasa_app/screens/profile_screen.dart';
import 'package:aarvasa_app/screens/terms_of_service.dart';
import 'package:aarvasa_app/screens/blog_page.dart';
import 'package:aarvasa_app/screens/property_search_screen.dart';
import 'package:aarvasa_app/screens/your_activity.dart'; 
import 'package:aarvasa_app/screens/notifications_page.dart';
import 'package:aarvasa_app/screens/transaction_price_page.dart'; // Import your signup screen
void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //home: const ProfileScreen(),
      //home: const TermsOfServicePage(),
       //home: const PropertySearchScreen(), 
     // home: const YourActivityPage(),
     //home: const NotificationsPage(),
     home: const TransactionPricePage(), // Set your initial screen here
  
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/news_articles_page.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7A183A)),
      ),
      home: const NewsArticlesPage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'screens/find_my_agent_page.dart';
import 'screens/more_agents_page.dart';
import 'screens/view_agent_profile_page.dart';

void main() {
  runApp(const AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  const AarvasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF7A183A),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FindMyAgentsPage(),
        '/more-agents': (context) => const MoreAgentsPage(),
        '/view-agent': (context) => const ViewAgentProfilePage(
              name: 'Default Agent',
              agency: 'Default Agency',
              imageAsset: 'assets/p1.png',
            ),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/ai_landing_page.dart';
import 'screens/ai_chat_page.dart';
import 'screens/content_filtering_page.dart';

void main() {
  runApp(const AarvasaAIApp());
}

class AarvasaAIApp extends StatelessWidget {
  const AarvasaAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => const AILandingPage(),
        '/ai-chat': (context) => const AIChatPage(),
        '/content-filter': (context) => const ContentFilteringPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/price_trends_page1.dart';
import 'screens/price_trends_page2.dart';
import 'screens/price_trends_page3.dart';
import 'screens/price_trends_page4.dart';
import 'screens/overview_tab.dart';
import 'screens/permission_screen.dart';

void main() {
  runApp(AarvasaApp());
}

class AarvasaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aarvasa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: '/price_trends_1',
      routes: {
        '/price_trends_1': (context) => PriceTrendsPage1(),
        '/price_trends_2': (context) => PriceTrendsPage2(),
        '/price_trends_3': (context) => PriceTrendsPage3(),
        '/price_trends_4': (context) => PriceTrendsPage4(),
        '/overview': (context) => OverviewTab(),
        '/permission': (context) => PermissionScreen(),
      },
    );
  }
}
*/
