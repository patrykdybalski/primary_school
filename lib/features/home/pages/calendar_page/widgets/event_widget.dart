import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    required this.eventModel,
    super.key,
  });

  final EventModel eventModel;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(
            color: AppColors.redColor,
            width: 0.6,
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 1.2,
              color: AppColors.accentColor,
            )),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.access_time,
              color: AppColors.secondaryColor,
              weight: 10.0,
            ),
            Text(
              widget.eventModel.selectedTimeFormatted(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Text(
            widget.eventModel.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        trailing: Text(
          widget.eventModel.selectedDayFormatted(),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25,
              top: 10,
              bottom: 25,
            ),
            child: Container(
              width: 280,
              decoration: const BoxDecoration(
                border: Border(
                  // left: BorderSide(
                  //   style: BorderStyle.solid,
                  //   color: AppColors.secondaryColor,
                  //   width: 0.5,
                  // ),
                  top: BorderSide.none,
                  left: BorderSide(
                    color: AppColors.accentColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  bottom: 10,
                  right: 40,
                ),
                child: Text(
                  widget.eventModel.subtitle,
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
