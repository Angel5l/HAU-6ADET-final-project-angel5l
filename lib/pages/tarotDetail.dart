import 'package:flutter/material.dart';
import '/data/tarotCardModel.dart';

class tarotDetails extends StatelessWidget {
  final TarotCardModel? selectedCard;

  const tarotDetails(this.selectedCard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // 0.0 is fully transparent, 1.0 is fully solid
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: selectedCard!.orientation
                ? AssetImage(selectedCard!.imagePath)
                : AssetImage(
                    selectedCard!.imagePathR,
                  ), // Use the selected card's image as background
            fit: BoxFit.cover,
            opacity: 0.6,
          ), // Set the opacity of the background image
        ),
        child: Center(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  selectedCard!.id.toString(),
                  style: TextStyle(color: Color.fromARGB(255, 41, 41, 41)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  selectedCard!.name,
                  style: TextStyle(color: Color.fromARGB(255, 41, 41, 41)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  selectedCard!.type,
                  style: TextStyle(color: Color.fromARGB(255, 41, 41, 41)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
