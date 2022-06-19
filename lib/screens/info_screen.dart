import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen(this.name, this.number, this.email, this.vk, this.tg, this.website,
      this.adress,
      {Key? key})
      : super(key: key);
  String name;
  String number;
  String email;
  String vk;
  String tg;
  String website;
  String adress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image.asset('assets/images/bolidlogo.png'),
            Container(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 15, bottom: 10),
              child: Center(
                child: Text(
                  'Контакты',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(
              thickness: 2.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.place,
                    size: 21,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      adress,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.phone,
                    size: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () => launch('tel:$number'),
                      child: const Text(
                        'Позвонить',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
            ),
            if (website != '')
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.link,
                      size: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () => launch(website),
                        child: Text(
                          website,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (website != '')
              const Divider(
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
                thickness: 0.5,
              ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => launch(vk),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 50,
                      height: 50,
                      child: const Image(
                        image: AssetImage('assets/images/vk.png'),
                      ),
                    ),
                  ),
                  if (tg != '')
                    GestureDetector(
                      onTap: () => launch(tg),
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 50,
                        height: 50,
                        child: const Image(
                          image: AssetImage('assets/images/telegram.png'),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
