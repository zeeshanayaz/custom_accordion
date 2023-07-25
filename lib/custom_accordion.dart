library custom_accordion;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAccordion extends StatefulWidget {
  CustomAccordion({
    super.key,
    required this.title,
    this.subTitle,
    this.headerBackgroundColor,
    this.titleStyle,
    this.subTitleStyle,
    this.toggleIconOpen,
    this.toggleIconClose,
    this.headerIconColor,
    this.backgroundColor,
    this.accordionElevation,
    this.widgetItems,
    this.widgetItemsPadding,
    this.showContent = false,
    this.disableToggle = false,
  });

  /// title: Title heading of Accordion
  /// required
  final String title;

  /// subTitle: Subtitle
  /// Optional property
  final String? subTitle;

  /// headerBackgroundColor visible at the back of title
  /// Optional property
  /// default: Theme.of(context).splashColor
  final Color? headerBackgroundColor;

  /// titleStyle: Text style of title
  /// Optional property
  /// default: Theme.of(context).textTheme.titleLarge
  final TextStyle? titleStyle;

  /// subTitleStyle: Text style of subTitle
  /// Optional property
  /// default: Theme.of(context).textTheme.titleSmall
  final TextStyle? subTitleStyle;

  /// toggleIconOpen: Icon displayed when the accordion is in collapsed state
  /// Optional property
  /// default: Icons.arrow_drop_down
  final IconData? toggleIconOpen;

  /// toggleIconClose: Icon displayed when the accordion is in expanded state
  /// Optional property
  /// default: Icons.arrow_drop_up
  final IconData? toggleIconClose;

  /// headerIconColor: Toggle Icon color
  /// Optional property
  /// default: Theme.of(context).iconTheme.color
  final Color? headerIconColor;

  /// backgroundColor: Background color of body of accordion
  /// Optional property
  /// default: Theme.of(context).cardColor
  final Color? backgroundColor;

  /// accordionElevation: Elevation of Accordion
  /// Optional property
  /// default: Theme.of(context).cardTheme.elevation
  final double? accordionElevation;

  /// widgetItems: Widget(s)
  /// Optional property
  /// default:
  ///               Center(
  ///                  child: Text(
  ///                    'No Widget available',
  ///                    style: Theme.of(context).textTheme.bodyMedium,
  ///                  ))
  final Widget? widgetItems;

  /// widgetItemsPadding: Padding around body of Accordion
  /// Optional property
  /// default: const EdgeInsets.all(10)
  final EdgeInsetsGeometry? widgetItemsPadding;

  /// showContent: default state of accordion toggle
  /// if 'true', default body visibility will be visible
  /// Optional property
  /// default: false
  bool showContent;

  /// disableToggle: Control the toggle functionality.
  /// if 'true', You won't see toggle icons and accordion won't toggle its state
  /// Optional property
  /// default: false
  bool disableToggle;

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation:
          widget.accordionElevation ?? Theme.of(context).cardTheme.elevation,
      color: widget.backgroundColor ?? Theme.of(context).cardColor,
      child: Column(children: [
        ListTile(
          onTap: widget.disableToggle ? null : () {
            setState(() {
              widget.showContent = !(widget.showContent);
            });
          },
          tileColor:
              widget.headerBackgroundColor ?? Theme.of(context).splashColor,
          title: Text(
            widget.title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.titleStyle ??
                Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: widget.subTitle != null ? Text(
            widget.subTitle ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.subTitleStyle ??
                Theme.of(context).textTheme.titleSmall,
          ) : null,
          trailing: widget.disableToggle ? null : IconButton(
            icon: Icon(
              widget.showContent
                  ? (widget.toggleIconClose ?? Icons.arrow_drop_up)
                  : (widget.toggleIconOpen ?? Icons.arrow_drop_down),
              color:
              widget.headerIconColor ?? Theme.of(context).iconTheme.color,
            ),
            tooltip: 'Toggle Accordion',
            splashRadius: 20,
            onPressed: () {
              setState(() {
                widget.showContent = !(widget.showContent);
              });
            },
          ),
        ),
        widget.disableToggle
          ? Container(
          padding: widget.widgetItemsPadding ?? const EdgeInsets.all(10),
          child: widget.widgetItems ??
              Center(
                  child: Text(
                    'No Widget available',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
        )
          : (widget.showContent)
            ? Container(
                padding: widget.widgetItemsPadding ?? const EdgeInsets.all(10),
                child: widget.widgetItems ??
                    Center(
                        child: Text(
                      'No Widget available',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
              )
            : const SizedBox(),
      ]),
    );
  }
}
