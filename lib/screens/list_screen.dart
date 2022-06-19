import 'package:flutter/material.dart';
import 'package:perm_fm/widgets/list_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Список радиостанций'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListItem(
                'Радио России',
                'https://icecast-bulteam.cdnvideo.ru/russia128',
                'assets/images/russia.png',
                '+73422820542',
                'radiorus.ru@yandex.ru',
                'https://vk.com/radiorussia1',
                'https://t.me/radiorossii',
                'radiorus.ru',
                'г. Пермь, ул. Техническая, 7',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Вести FM',
                'https://icecast-bulteam.cdnvideo.ru/vestifm128',
                'assets/images/vesti.png',
                '+73422820542',
                'rc@t7.ru',
                'https://vk.com/vestifm',
                'https://t.me/vestifmplus',
                'radiovesti.ru',
                'г. Пермь, ул. Техническая, 7',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Радио Маяк',
                'https://icecast-bulteam.cdnvideo.ru/mayak128',
                'assets/images/mayak.jpg',
                '+73422820542',
                'rc@t7.ru',
                'https://vk.com/club114818942',
                'https://t.me/mayak_fm',
                'radiomayak.ru',
                'г. Пермь, ул. Техническая, 7',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Радио Болид',
                'https://icecast-bulteam.cdnvideo.ru/bolid128',
                'assets/images/bolidlogo.png',
                '+73422393399',
                'office@bolid.fm',
                'https://vk.com/radiobolid',
                'https://t.me/bolidfm_bot',
                'bolid.fm',
                'г. Пермь, ул. Куйбышева, 37, офис 602',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Радио Nostalgie',
                'https://icecast-bulteam.cdnvideo.ru/Nostalgie',
                'assets/images/nostalgy.jpg',
                '+73422196888',
                'info@nostalgie.perm.ru',
                'https://vk.com/nostalgie_perm',
                '',
                'nostalgie.perm.ru',
                'г. Пермь, ул. Ленина, 50 - 14 этаж',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Пилот FM',
                'http://188.128.117.99:8000/PilotPermAcc',
                'assets/images/pilot.png',
                '+73422591867',
                'irinap@alfafm.ru',
                'https://vk.com/permpilotfm',
                'https://t.me/permpilotfm1036',
                'permpilotfm.ru/',
                'г. Пермь, ул. Тургенева, 33А',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Радио Альфа',
                'http://online.alfafm.ru:8000/alfa_mp3',
                'assets/images/alfa.png',
                '+73422430353',
                'info@alfafm.ru',
                'https://vk.com/alfaperm',
                'https://t.me/alfaradioby',
                'www.alfafm.ru/',
                'г. Пермь, ул. Тургенева, 33а',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Радио Привет',
                'http://62.16.41.97:8000/radioprivet',
                'assets/images/privet.jpg',
                '89091012220',
                '',
                'https://vk.com/radioprivet',
                '',
                '',
                'г. Пермь, ул. Куйбышева, 37, офис 602',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Соль ФМ',
                'http://solfm.ru:8000/online128',
                'assets/images/sol.png',
                '83425334411',
                '',
                'http://vk.com/solfm ',
                '',
                '',
                'г. Соликамск, ул.20-лет Победы, д.121, оф.501',
                false),
            const Divider(
              color: Colors.grey,
            ),
            ListItem(
                'Fine Radio',
                'https://icecast-bulteam.cdnvideo.ru/fineradio128',
                'assets/images/fine_radio_logo.png',
                '+73422334149',
                'office@fineradio.ru',
                'https://vk.com/fineradioru',
                'https://t.me/fineradio',
                'fineradio.ru',
                'г. Пермь, ул. Куйбышева, 37, офис 602',
                false),
            /**/
          ],
        ),
      ),
    );
  }
}
