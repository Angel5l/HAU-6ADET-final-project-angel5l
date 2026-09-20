import 'dart:math';
import '/data/tarot_json.dart';

class TarotCardModel {
  final int id;
  final String name;
  final String type; // 'Major' or 'Minor'
  final String description;
  final String descriptionR;
  final String imagePath;
  final String imagePathR;
  bool orientation;

  TarotCardModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.descriptionR,
    required this.imagePath,
    required this.imagePathR,
    this.orientation = true,
  });
}

// Deck Manager Logic
class TarotDeck {
  List<TarotCardModel> cards = tarotData.map((data) {
    return TarotCardModel(
      id: data['id'],
      name: data['name'],
      type: data['type'],
      description: data['description'],
      descriptionR: data['descriptionR'],
      imagePath: data['imagePath'],
      imagePathR: data['imagePathR'],
    );
  }).toList();

  // Randomize cards and randomly assign upright/reversed positions
  void shuffleDeck() {
    final random = Random();
    cards.shuffle(random);

    for (var card in cards) {
      card.orientation = random.nextBool();
    }
  }

  List<TarotCardModel> drawCard(int i) {
    if (cards.length > i) shuffleDeck();
    return cards.take(i).toList();
  }
}
