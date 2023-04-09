# Custom Accordion

Custom Accordion (Expandable) widget with lots of customization.

## Demo Preview

| |
| -- |
| ![](/demo/custom_accordion_example.gif) |

### Add to your project
```
flutter pub add custom_accordion
```

### Import and use it!
```
import 'package:custom_accordion/custom_accordion.dart';
```

## How to use

Basic Accordion
```dart
    CustomAccordion(
        title: 'Accordion',
        ),
```

Accordion with no child
```dart
    CustomAccordion(
        title: 'Accordion with no child',
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
        showContent: true,
        ),
```

Accordion with one child
```dart
    CustomAccordion(
        title: 'Accordion with one child',
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
        widgetItems: const Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          ),
        ),
```
Accordion with many child
```dart
    CustomAccordion(
        title: 'Accordion with many child',
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
```

Please see example project for code.


## Properties

The following properties can be set for the widget.

|Property|Description|Type|Required|Default value|
| ---- | ---- | ---- | ---- | ---- |
| title | Title of Accordion | String | Yes |  |
| headerBackgroundColor | Header background color | Color | No | Theme.of(context).splashColor |
| titleStyle | Header text style | TextStyle | No | Theme.of(context).textTheme.titleLarge |
| toggleIconOpen | Toggle icon to expand/open widgets | IconData | No | Icons.arrow_drop_down |
| toggleIconClose | Toggle icon to collapse/close widgets | IconData | No | Icons.arrow_drop_up |
| headerIconColor | Icon Color | Color | No | Theme.of(context).iconTheme.color |
| backgroundColor | Background color of widget | Color | No | Theme.of(context).cardColor |
| accordionElevation | Elevation of accordion widget | double | No | Theme.of(context).cardTheme.elevation |
| widgetItems | Child Widget(s) of accordion | Widget | No | Text() |
| widgetItemsPadding | Padding arround children of accordion | EdgeInsetsGeometry | No | EdgeInsets.all(10) |
| showContent | Make default behaviour of accoordion children visible or hidden | bool | No | false |


