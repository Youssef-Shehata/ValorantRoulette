import 'dart:math';

class Quotes {
  List<String> quotes = [
    "You have enemies? Good, that means you've stood up for something.",
    "I don't always troll, but when I do, I do it in style.",
    "I'm not a griefer, I'm a fun enhancer.",
    "I don't create problems, I create opportunities.",
    "It's not about the game, it's about sending a message.",
    "I don't always win, but when I lose, I make sure others do too.",
    "The most important thing more than work is to adjust the work. -Omar Salah",
    "I don't need to win, I just need to make sure you don't.",
  ];
  String returnRandQuote() {
    Random rand = Random();
    int randomNum = rand.nextInt(quotes.length);
    return quotes[randomNum];
  }
}
