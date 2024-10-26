import 'package:daar/models/item_model.dart';
import 'package:daar/widgets/recomend_list.dart';
import 'package:daar/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daar/widgets/vertical_recomend_list.dart';
import 'package:daar/screens/profile_page.dart'; // تأكد من استيراد صفحة الملف الشخصي
import 'package:daar/screens/Add1.dart';
import 'package:daar/screens/predict.dart';
import 'package:daar/screens/notif.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // المتغير لتتبع الفهرس الحالي

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // تحديث الفهرس الحالي
    });

    // التحقق من الفهرس الحالي
    if (index == 3) {
      // إذا كان الفهرس 3، انتقل إلى صفحة الملف الشخصي
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProfilePage()), // استبدل بـ ProfilePage
      );
    }

    if (index == 2) {
      // إذا كان الفهرس 3، انتقل إلى صفحة الملف الشخصي
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyApp()), // استبدل بـ ProfilePage
      );
    }

    if (index == 1) {
      // إذا كان الفهرس 3، انتقل إلى صفحة الملف الشخصي
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const predictpage()), // استبدل بـ ProfilePage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color(0xFF180a44),
        toolbarHeight: 70.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // الانتقال إلى صفحة notif
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NotifPage()), // التأكد من استخدام اسم الصفحة الصحيح
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            Image.asset(
              'assets/images/logow.png',
              height: 25.0,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF180A44),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'مرحبًا بك، مستخدم',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Arial',
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10.0),
              const SearchField(),
              const SizedBox(height: 20.0),
              recomendList("التوصيات", Item.recomend),
              const SizedBox(height: 40.0),
              VerticalRecomendList("العقارات", Item.normal),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF180A44),
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _currentIndex, // استخدم الفهرس الحالي
        onTap: _onItemTapped, // استدعاء الدالة عند الضغط على أي عنصر
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "الصفحة الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "التنبؤ"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add), label: "إضافة عقار"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "الحساب الشخصي"),
        ],
     ),
);
}
}
