import 'package:flutter/material.dart';
import '../quiz_screen.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String quiz;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizScreen(quiz: quiz)),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(1),
                          offset: Offset(1.5, 1.5),
                          blurRadius: 1,
                        )
                      ]),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, color: Colors.white, shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(1),
                      offset: Offset(1.5, 1.5),
                      blurRadius: 1,
                    )
                  ]),
                ),
                // Container(
                //   height: 36,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => QuizScreen(quiz: quiz)),
                //       );
                //     },
                //     child: Text(
                //       'Commencer',
                //       style: TextStyle(
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
