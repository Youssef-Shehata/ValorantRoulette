import 'dart:math';

class Quotes {
  List<String> quotes = [
    "I'm not playing the game, the game is playing me.",
    "I didn't choose the troll life, the troll life chose me.",
    "I'm not a troll, I'm just better than you.",
    "You have enemies? Good, that means you've stood up for something.",
    "I don't always troll, but when I do, I do it in style.",
    "Keep calm and troll on.",
    "I'm not a griefer, I'm a fun enhancer.",
    "I don't create problems, I create opportunities.",
    "It's not about the game, it's about sending a message.",
    "I'm not trolling, I'm just misunderstood.",
    "I'm not saying I'm Batman, but have you ever seen me and Batman in the same room?",
    "I don't always win, but when I lose, I make sure others do too.",
    "I'm not a player, I'm the game.",
    "I don't need to win, I just need to make sure you don't.",
    "I'm not a troll, I'm a truth teller.",
    "I don't troll, I educate.",
    "I'm not a troll, I'm a free spirit.",
    "I'm not a troll, I'm a challenge seeker.",
    "I'm not a troll, I'm a game mechanic tester.",
    "I'm not a troll, I'm a reality check.",
    "I'm not a troll, I'm a strategic mastermind.",
    "I'm not a troll, I'm a motivational speaker.",
    "I'm not a troll, I'm a performance artist.",
    "I'm not a troll, I'm a philosopher.",
    "I'm not a troll, I'm a social scientist.",
    "I'm not a troll, I'm a life coach.",
    "I'm not a troll, I'm a community service provider.",
    "I'm not a troll, I'm a conversation starter.",
    "I'm not a troll, I'm a professional button pusher.",
    "I'm not a troll, I'm a master of unconventional warfare."
  ];
  String returnRandQuote() {
    Random rand = Random();
    int randomNum = rand.nextInt(30);
    return quotes[randomNum];
  }
}
