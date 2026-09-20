import 'dart:math';

import 'package:flutter/material.dart';
import '/data/tarotCardModel.dart';

class cardCarousel extends StatefulWidget {
  const cardCarousel({super.key, required this.number});
  final int number;

  @override
  State<cardCarousel> createState() => _cardCarousel();
}

class _cardCarousel extends State<cardCarousel> {
  final List<TarotCardModel> cardsPicked = [];
  final List<bool> cardFlipped = [];

  @override
  void initState() {
    super.initState();
    final deck = TarotDeck();
    cardsPicked.addAll(deck.drawCard(widget.number));
    cardFlipped.addAll(List<bool>.filled(cardsPicked.length, false));
  }

  void _handleCardFlip(int index, bool value) {
    setState(() {
      cardFlipped[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), title: const Text('Angel Tarot')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: cardsPicked.length,
          itemBuilder: (context, index) {
            final card = cardsPicked[index];
            final faceImage = card.orientation
                ? card.imagePath
                : card.imagePathR;

            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cardFlipped[index])
                    Text(
                      '${card.name} • ${card.orientation ? 'Upright' : 'Reversed'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: 12),
                  TarotCardWidget(
                    cardFaceImage: faceImage,
                    cardBackImage: 'assets/images/cardFront.png',
                    isFlipped: cardFlipped[index],
                    onFlip: (value) => _handleCardFlip(index, value),
                  ),
                  const SizedBox(height: 12),
                  if (cardFlipped[index])
                    Text(
                      card.orientation ? card.description : card.descriptionR,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TarotCardWidget extends StatefulWidget {
  final String cardFaceImage;
  final String cardBackImage;
  final bool isFlipped;
  final ValueChanged<bool>? onFlip;

  const TarotCardWidget({
    super.key,
    required this.cardFaceImage,
    required this.cardBackImage,
    required this.isFlipped,
    this.onFlip,
  });

  @override
  State<TarotCardWidget> createState() => TarotCardWidgetState();
}

class TarotCardWidgetState extends State<TarotCardWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _isFlipped = widget.isFlipped;
    if (_isFlipped) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant TarotCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFlipped != widget.isFlipped) {
      _isFlipped = widget.isFlipped;
      if (_isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _toggleCard() {
    final nextValue = !_isFlipped;
    if (nextValue) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFlipped = nextValue;
    widget.onFlip?.call(nextValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: SizedBox(
        height: 420,
        width: 280,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _controller.value * pi;
            final isPastHalfway = angle > pi / 2;

            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: isPastHalfway
                  ? Transform(
                      transform: Matrix4.identity()..rotateY(pi),
                      alignment: Alignment.center,
                      child: Image.asset(
                        widget.cardFaceImage,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(widget.cardBackImage, fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
