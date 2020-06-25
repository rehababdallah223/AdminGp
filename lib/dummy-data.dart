/*import 'package:flutter/material.dart';

import 'models/book.dart';
import 'models/category.dart';
import 'models/user.dart';

 var DUMMY_USERS =  [
  User(
    id: 'u1',
    name: 'maha ramdan',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    rate: 5,
  ),
  User(
    id: 'u2',
    name: 'rehab abdallah',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 4,
  ),
  User(
    id: 'u3',
    name: 'rehab abdallah',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 3,
  ),
  User(
    id: 'u4',
    name: 'fatma kamal',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 2,
  ),
  User(
    id: 'u5',
    name: 'toqa ellithy',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 5,
  ),
  User(
    id: 'u6',
    name: 'amr zaki',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 4,
  ),
  User(
    id: 'u7',
    name: 'ghada osamma ',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',

    rate: 1,
  ),
];


 var DUMMY_BOOKS =  [
  Book(
    id: 'b1',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b2',

    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b3',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b4',

    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b5',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b6',

    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b7',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b8',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b9',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b10',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b11',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b12',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b13',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b14',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),
  Book(
    id: 'b15',
    title: 'Torab Al mas',
    authorName: 'Ahmed mourad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  ),

];

var DUMMY_CATEGORIES =  [
  Categoreey(
    id: 'c7',
    title: 'Romance',
  ),
  Categoreey(
    id: 'c8',
    title: 'Short Story',
  ),
  Categoreey(
    id: 'c9',
    title: 'Sceience Fiction',
  ),
  Categoreey(
    id: 'c10',
    title: 'Action And Adventure',
  ),
  Categoreey(
    id: 'c11',
    title: 'Crime and Detective',
  ),
  Categoreey(
    id: 'c12',
    title: 'Comic and Graphic',
  ),
];
*/