import 'package:flutter/material.dart';

class CardGraficos extends StatefulWidget {
  const CardGraficos({super.key});

  @override
  State<CardGraficos> createState() => _CardGraficosState();
}

class _CardGraficosState extends State<CardGraficos> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text('Gráficos'),
            SizedBox(
              height: 11,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 105,
                      height: 11,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 90,
                      height: 11,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 32,
                      height: 11,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 66,
                      height: 11,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 77, 76, 76),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 55,
                      height: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
