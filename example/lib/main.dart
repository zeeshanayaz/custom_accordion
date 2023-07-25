import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Accordion Demo',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Custom Accordion Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Basic Accordion
            CustomAccordion(
              title: 'Accordion',
            ),

            /// Accordion with no child
            CustomAccordion(
              title: 'Accordion with no child',
              subTitle: 'Accordion Sub Title',
              headerBackgroundColor: Colors.blue,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              subTitleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              toggleIconOpen: Icons.keyboard_arrow_down_sharp,
              toggleIconClose: Icons.keyboard_arrow_up_sharp,
              headerIconColor: Colors.white,
              accordionElevation: 0,
              showContent: true,
            ),

            /// Accordion with one child
            CustomAccordion(
              title: 'Accordion with one child',
              subTitle: 'Accordion Sub Title',
              headerBackgroundColor: Colors.blue,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              subTitleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              toggleIconOpen: Icons.keyboard_arrow_down_sharp,
              toggleIconClose: Icons.keyboard_arrow_up_sharp,
              headerIconColor: Colors.white,
              accordionElevation: 0,
              widgetItems: const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              ),
            ),

            /// Accordion with many children
            CustomAccordion(
              title: 'Accordion with many children',
              headerBackgroundColor: Colors.blue,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              toggleIconOpen: Icons.keyboard_arrow_down_sharp,
              toggleIconClose: Icons.keyboard_arrow_up_sharp,
              headerIconColor: Colors.white,
              accordionElevation: 0,
              widgetItems: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Lorem Ipsum',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'ELEVATED BUTTON',
                    ),
                  )
                ],
              ),
            ),

            /// Accordion with List Items and Toggle Disabled
            CustomAccordion(
              title: 'Accordion with List Items',
              subTitle: 'Accordion toggle disabled',
              headerBackgroundColor: Colors.blue,
              titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              subTitleStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              toggleIconOpen: Icons.keyboard_arrow_down_sharp,
              toggleIconClose: Icons.keyboard_arrow_up_sharp,
              headerIconColor: Colors.white,
              accordionElevation: 0,
              disableToggle: true,
              widgetItems: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List<Widget>.generate(5, (int index) {
                  return Text('Item $index');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
