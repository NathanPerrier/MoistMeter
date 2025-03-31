import 'package:flutter/material.dart';
import 'package:MoistMeter/components/navbar.dart';   
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: 3),

      body: Center(
        child: Container(
          child: 
            Container(
              child:  SfCalendar(
                view: CalendarView.week,
                headerHeight: 100,
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                dataSource: _getCalendarDataSource(),
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                timeSlotViewSettings: const TimeSlotViewSettings(numberOfDaysInView: 3),
              ) 
            ),
        ),
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: -1)),
    endTime: DateTime.now().add(Duration(days: -1, minutes: 60)),
    subject: 'Field 3 Watering',
    color: Colors.blue,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 150)),
    subject: 'Field 1 - Crops 1-10 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 1)),
    endTime: DateTime.now().add(Duration(days: 1, minutes: 90)),
    subject: 'Field 2 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(hours: 6)),
    endTime: DateTime.now().add(Duration(hours: 6, minutes: 60)),
    subject: 'Field 1 Crops 11-25 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 2, hours: 6)),
    endTime: DateTime.now().add(Duration(days: 2, hours: 6, minutes: 120)),
    subject: 'Field 3 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 3, hours: 2)),
    endTime: DateTime.now().add(Duration(days: 3, hours: 2, minutes: 60)),
    subject: 'Field 2 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 4, hours: 6)),
    endTime: DateTime.now().add(Duration(days: 4, hours: 6, minutes: 60)),
    subject: 'Field 1 - Crops 1-5 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 5)),
    endTime: DateTime.now().add(Duration(days: 5, minutes: 60)),
    subject: 'Field 1 - Crops 6-25 Watering',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  )
);

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}