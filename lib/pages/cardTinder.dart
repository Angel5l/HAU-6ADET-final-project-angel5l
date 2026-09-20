import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '/pages/cardCarousel.dart';

class cardTinder extends StatefulWidget {
  const cardTinder({super.key});
  @override
  State<cardTinder> createState() => _cardTinder();
}

class _cardTinder extends State<cardTinder> {
  int counter = 0;
  void _addCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), title: Text('Angel Tarot')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(child: Text('Cards: $counter')),
            SizedBox(
              height: 400,
              width: 300,
              child: CardSwiper(
                cardBuilder: (context, index, horizontal, vertical) {
                  return ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset('assets/images/cardFront.png'),
                  );
                },
                cardsCount: 78,
                allowedSwipeDirection: AllowedSwipeDirection.only(
                  left: true,
                  right: true,
                ),
                onSwipe: (previousIndex, currentIndex, direction) {
                  if (direction == CardSwiperDirection.right) {
                    _addCounter();
                  }
                  return true;
                },
              ),
            ),
            if (counter > 0)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cardCarousel(number: counter),
                    ),
                  );
                },
                child: Text('To Reading'),
              ),
          ],
        ),
      ),
    );
  }
}
