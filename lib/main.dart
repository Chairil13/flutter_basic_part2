import 'package:aplikasi_pertamaku/manga_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.pink.shade400,
            centerTitle: true,
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Chairil Ali',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('chairilali@gmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/logo.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/premium-photo/11h-pink-aesthetic-wallpaper-lockscreen_1097265-93242.jpg'))),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: const Text('Read Manga'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MangaScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone_android_outlined),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6282238482847?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Apakah anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text(
                                  'Keluar',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  SystemNavigator.pop();
                                }),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/logo.jpg',
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Chairil Ali',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Mobile Application Engineer',
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SelectableText(
                    'Flutter Developer that loves to learn new things. I am currently working as a Flutter Developer at PT. Kompas Gramedia.',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
