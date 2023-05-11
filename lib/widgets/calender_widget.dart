import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalenderState();
}

class _CalenderState extends State<Calendar> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          if (events.isNotEmpty) {
            return Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                '${events.length}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
      locale: 'ko_KR',
      focusedDay: DateTime.now(),
      firstDay: DateTime(2020, 10, 16),
      lastDay: DateTime(2030, 3, 14),
      daysOfWeekHeight: 30,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMMd(locale).format(date),
        formatButtonVisible: false,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        headerPadding: const EdgeInsets.all(4),
        leftChevronIcon: const Icon(
          Icons.arrow_left,
          size: 40,
          color: Colors.white,
        ),
        rightChevronIcon: const Icon(
          Icons.arrow_right,
          size: 40,
          color: Colors.white,
        ),
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.amber,
            width: 1.5,
          ),
        ),
        outsideDaysVisible: false,
        weekendTextStyle: TextStyle(color: Colors.red),
        defaultTextStyle: TextStyle(color: Colors.white),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.lightBlue,
            width: 1.5,
          ),
        ),
        cellAlignment: Alignment.center,
        tableBorder: TableBorder(
          top: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
          bottom: BorderSide(color: Colors.white),
          left: BorderSide(color: Colors.white),
          horizontalInside: BorderSide(color: Colors.white),
          verticalInside: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.zero,
        ),
        rowDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
