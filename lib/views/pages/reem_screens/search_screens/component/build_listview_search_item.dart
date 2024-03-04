import 'package:flutter/cupertino.dart';

class SearchItem{
 late final String title,description,urlImage,price;
 SearchItem({
   required this.title,required this.description,required this.price,required this.urlImage
});
}
var searchItems=[
 SearchItem(title: "Hamburger", description: "big tasty, 1 large french fries, 1 large\n drink", price: "\$4.80", urlImage: "https://www.allrecipes.com/thmb/RTo6ddljby-5lAszPdMRwQ-aVh0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/19863best-burger-everFranceC4x3-c9c7d5cae40b4a58a110a33e04b531d1.jpg"),
  SearchItem(title: "Double Hamburger", description: "big tasty, 1 large french fries, 1 large\n drink", price: "\$4.80", urlImage: "https://www.allrecipes.com/thmb/RTo6ddljby-5lAszPdMRwQ-aVh0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/19863best-burger-everFranceC4x3-c9c7d5cae40b4a58a110a33e04b531d1.jpg"),
  SearchItem(title: "Triple Hamburger", description: "big tasty, 1 large french fries, 1 large\n drink", price: "\$4.80", urlImage: "https://www.allrecipes.com/thmb/RTo6ddljby-5lAszPdMRwQ-aVh0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/19863best-burger-everFranceC4x3-c9c7d5cae40b4a58a110a33e04b531d1.jpg"),
  SearchItem(title: "Single Hamburger", description: "big tasty, 1 large french fries, 1 large\n drink", price: "\$4.80", urlImage: "https://www.allrecipes.com/thmb/RTo6ddljby-5lAszPdMRwQ-aVh0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/19863best-burger-everFranceC4x3-c9c7d5cae40b4a58a110a33e04b531d1.jpg"),
];