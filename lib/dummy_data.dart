import 'package:payouts/models/radio.dart';
import 'package:payouts/models/transaction.dart';
import 'package:payouts/models/user.dart';

import './models/operation.dart';

const DUMMY_OPERATIONS = const [
  Operation(
    id: 'op1',
    title: 'Пополнить',
    icon: 'assets/images/vector.svg',
  ),
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
  ),
  User(
    id: 'u2',
    title: '@username2',
    imageUrl: 'assets/images/photo2.jpg',
  ),
  User(
    id: 'u3',
    title: '@username13',
    imageUrl: 'assets/images/photo3.jpg',
  ),
  User(
    id: 'u4',
    title: '@username4',
    imageUrl: 'assets/images/photo4.jpg',
  ),
  User(
    id: 'u5',
    title: '@username289',
    imageUrl: 'assets/images/photo5.jpg',
  ),
  User(
    id: 'u6',
    title: '@username6',
    imageUrl: 'assets/images/photo6.jpg',
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
  ),
  User(
    id: 'u2',
    title: '@username2',
    imageUrl: 'assets/images/photo2.jpg',
  ),
  User(
    id: 'u3',
    title: '@username13',
    imageUrl: 'assets/images/photo3.jpg',
  ),
  User(
    id: 'u4',
    title: '@username4',
    imageUrl: 'assets/images/photo4.jpg',
  ),
  User(
    id: 'u5',
    title: '@username289',
    imageUrl: 'assets/images/photo5.jpg',
  ),
  User(
    id: 'u6',
    title: '@username6',
    imageUrl: 'assets/images/photo6.jpg',
  ),
  User(
    id: 'u7',
    title: '@username1123',
    imageUrl: 'assets/images/photo1.jpg',
  ),
  User(
    id: 'u8',
    title: '@username42',
    imageUrl: 'assets/images/photo2.jpg',
  ),
  User(
    id: 'u9',
    title: '@username456',
    imageUrl: 'assets/images/photo3.jpg',
  ),
  User(
    id: 'u10',
    title: '@username867',
    imageUrl: 'assets/images/photo4.jpg',
  ),
  User(
    id: 'u11',
    title: '@username2312',
    imageUrl: 'assets/images/photo5.jpg',
  ),
  User(
    id: 'u12',
    title: '@username655',
    imageUrl: 'assets/images/photo6.jpg',
  ),
];

const DUMMY_RADIOS = const [
  Radio(
    id: 'r1',
    title: 'Счастливо',
    emoji: '☺️',
  ),
  Radio(
    id: 'r2',
    title: 'Возвышено',
    emoji: '🏔',
  ),
  Radio(
    id: 'r3',
    title: 'Медитация',
    emoji: '🦋',
  ),
  Radio(
    id: 'r4',
    title: 'Дождь',
    emoji: '💦',
  ),
  Radio(
    id: 'r5',
    title: 'Спокойно',
    emoji: '🌿',
  ),
  Radio(
    id: 'r6',
    title: 'Бодро',
    emoji: '🔥',
  ),
  Radio(
    id: 'r7',
    title: 'Ностальгия',
    emoji: '🎬',
  ),
  Radio(
    id: 'r8',
    title: 'Мистическое',
    emoji: '🦄',
  ),
  Radio(
    id: 'r9',
    title: 'Позитив',
    emoji: '🎡',
  ),
  Radio(
    id: 'r10',
    title: 'Меланхолия',
    emoji: '🐋',
  ),
  Radio(
    id: 'r11',
    title: 'Весёлое',
    emoji: '😂',
  ),
  Radio(
    id: 'r12',
    title: 'Новый год!',
    emoji: '❄️',
  ),
  Radio(
    id: 'r13',
    title: 'Весна',
    emoji: '🌷',
  ),
  Radio(
    id: 'r14',
    title: 'Красивое',
    emoji: '💎',
  ),
  Radio(
    id: 'r15',
    title: 'Мечта',
    emoji: '🌴',
  ),
];
