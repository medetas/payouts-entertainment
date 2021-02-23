import 'package:payouts/models/radio.dart';
import 'package:payouts/models/transaction.dart';
import 'package:payouts/models/user.dart';

import './models/operation.dart';

const DUMMY_OPERATIONS = const [
  // Operation(
  //   id: 'op1',
  //   title: 'Пополнить',
  //   icon: 'assets/images/vector.svg',
  // ),
  Operation(
    id: 'op2',
    title: 'Отправить',
    icon: 'assets/images/plus.svg',
  ),
  Operation(
    id: 'op3',
    title: 'Перевести',
    icon: 'assets/images/credit-card.svg',
  ),
];

const DUMMY_USERS = const [
  User(
    id: 'u1',
    title: '@username135',
    imageUrl: 'assets/images/photo1.jpg',
    online: false,
  ),
  User(
    id: 'u2',
    title: '@username2',
    imageUrl: 'assets/images/photo2.jpg',
    online: false,
  ),
  User(
    id: 'u3',
    title: '@username13',
    imageUrl: 'assets/images/photo3.jpg',
    online: false,
  ),
  User(
    id: 'u4',
    title: '@username4',
    imageUrl: 'assets/images/photo4.jpg',
    online: false,
  ),
  User(
    id: 'u5',
    title: '@username289',
    imageUrl: 'assets/images/photo5.jpg',
    online: false,
  ),
  User(
    id: 'u6',
    title: '@username6',
    imageUrl: 'assets/images/photo6.jpg',
    online: false,
  ),
];

const DUMMY_TRANSACTIONS = const [
  Transaction(
    id: 't1',
    date: '01.10.2020',
    amount: 1200,
    destinationUser: '**** 9475',
    transactionType: TransactionType.Withdrawal,
  ),
  Transaction(
    id: 't2',
    date: '07.10.2020',
    amount: 50100,
    destinationUser: '@user23',
    transactionType: TransactionType.Transfer,
  ),
  Transaction(
    id: 't3',
    date: '14.10.2020',
    amount: 2500,
    destinationUser: '@kkulmann',
    transactionType: TransactionType.Proceeds,
  ),
  Transaction(
    id: 't4',
    date: '21.11.2020',
    amount: 200,
    destinationUser: '@danilasliv',
    transactionType: TransactionType.Refund,
  ),
  Transaction(
    id: 't5',
    date: '05.12.2020',
    amount: 50,
    destinationUser: '@kkulmann',
    transactionType: TransactionType.Bonus,
  ),
  Transaction(
    id: 't6',
    date: '28.12.2020',
    amount: 124089,
    destinationUser: '**** 9475',
    transactionType: TransactionType.Withdrawal,
  ),
  Transaction(
    id: 't7',
    date: '13.01.2021',
    amount: 5200,
    destinationUser: '@kkulmann',
    transactionType: TransactionType.Proceeds,
  ),
  Transaction(
    id: 't8',
    date: '23.01.2021',
    amount: 2300,
    destinationUser: '@danilasliv',
    transactionType: TransactionType.Transfer,
  )
];

const DUMMY_MATCHES = const [
  User(
    id: 'u1',
    title: '@username135',
    imageUrl: 'assets/images/photo1.jpg',
    online: false,
  ),
  User(
    id: 'u2',
    title: '@username2',
    imageUrl: 'assets/images/photo2.jpg',
    online: true,
  ),
  User(
    id: 'u3',
    title: '@username13',
    imageUrl: 'assets/images/photo3.jpg',
    online: false,
  ),
  User(
    id: 'u4',
    title: '@username4',
    imageUrl: 'assets/images/photo4.jpg',
    online: false,
  ),
  User(
    id: 'u5',
    title: '@username289',
    imageUrl: 'assets/images/photo5.jpg',
    online: true,
  ),
  User(
    id: 'u6',
    title: '@username6',
    imageUrl: 'assets/images/photo6.jpg',
    online: false,
  ),
  User(
    id: 'u7',
    title: '@username1123',
    imageUrl: 'assets/images/photo1.jpg',
    online: true,
  ),
  User(
    id: 'u8',
    title: '@username42',
    imageUrl: 'assets/images/photo2.jpg',
    online: false,
  ),
  User(
    id: 'u9',
    title: '@username456',
    imageUrl: 'assets/images/photo3.jpg',
    online: true,
  ),
  User(
    id: 'u10',
    title: '@username867',
    imageUrl: 'assets/images/photo4.jpg',
    online: false,
  ),
  User(
    id: 'u11',
    title: '@username2312',
    imageUrl: 'assets/images/photo5.jpg',
    online: true,
  ),
  User(
    id: 'u12',
    title: '@username655',
    imageUrl: 'assets/images/photo6.jpg',
    online: false,
  ),
];

const DUMMY_RADIOS = const [
  Radio(
    id: 'r1',
    title: 'Счастливо',
    emoji: '☺️',
    url: 'https://uk7.internet-radio.com/proxy/simonyates44?mp=/stream',
  ),
  Radio(
    id: 'r2',
    title: 'Возвышено',
    emoji: '🏔',
    url: 'http://ca10.rcast.net:8036/;stream/1',
  ),
  Radio(
    id: 'r3',
    title: 'Медитация',
    emoji: '🦋',
    url: 'https://us2.internet-radio.com/proxy/mattjohnsonradio?mp=/stream',
  ),
  Radio(
    id: 'r4',
    title: 'Дождь',
    emoji: '💦',
    url: 'http://www.partyviberadio.com:8056/;stream/1',
  ),
  Radio(
    id: 'r5',
    title: 'Спокойно',
    emoji: '🌿',
    url: 'https://uk5.internet-radio.com/proxy/ambiesphere?mp=/stream',
  ),
  Radio(
    id: 'r6',
    title: 'Бодро',
    emoji: '🔥',
    url: ' https://uk7.internet-radio.com/proxy/movedahouse?mp=/stream',
  ),
  Radio(
    id: 'r7',
    title: 'Ностальгия',
    emoji: '🎬',
    url: 'https://us5.internet-radio.com/proxy/mcems?mp=/live',
  ),
  Radio(
    id: 'r8',
    title: 'Мистическое',
    emoji: '🦄',
    url: 'https://uk6.internet-radio.com/proxy/realdanceradio?mp=/live',
  ),
  Radio(
    id: 'r9',
    title: 'Позитив',
    emoji: '🎡',
    url:
        'http://198.100.145.187:18304/;?type=http&nocache=1613846422?0.8311101468444864',
  ),
  Radio(
    id: 'r10',
    title: 'Меланхолия',
    emoji: '🐋',
    url: 'https://us3.internet-radio.com/proxy/topblues?mp=/stream',
  ),
  Radio(
    id: 'r11',
    title: 'Весёлое',
    emoji: '😂',
    url: 'https://uk5.internet-radio.com/proxy/mixfmonline?mp=/live',
  ),
  Radio(
    id: 'r12',
    title: 'Новый год!',
    emoji: '❄️',
    url: 'https://uk3.internet-radio.com/proxy/majesticjukebox?mp=/live',
  ),
  Radio(
    id: 'r13',
    title: 'Весна',
    emoji: '🌷',
    url: 'https://us4.internet-radio.com/proxy/radioestiloleblon?mp=/stream',
  ),
  Radio(
    id: 'r14',
    title: 'Красивое',
    emoji: '💎',
    url: 'https://uk1.internet-radio.com/proxy/undergroundfm?mp=/stream',
  ),
  Radio(
    id: 'r15',
    title: 'Мечта',
    emoji: '🌴',
    url: 'https://ssl1.viastreaming.net:7005/;listen.mp3',
  ),
];
