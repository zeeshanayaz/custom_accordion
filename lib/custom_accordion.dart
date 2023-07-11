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
    // this.actionButton,
    this.showContent = false,
    this.disableToggle = false,
  });

  final String title;
  final String? subTitle;
  final Color? headerBackgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final IconData? toggleIconOpen;
  final IconData? toggleIconClose;
  final Color? headerIconColor;
  final Color? backgroundColor;
  final double? accordionElevation;
  final Widget? widgetItems;
  final EdgeInsetsGeometry? widgetItemsPadding;
  // final Widget? actionButton;
  bool showContent;
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
