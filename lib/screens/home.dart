import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MoistMeter/components/navbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';




class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setSystemUIOverlayStyle(context);
  }


  void setSystemUIOverlayStyle(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, 
        statusBarColor: Colors.transparent, 
        systemNavigationBarColor: Theme.of(context).colorScheme.surface,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Navbar(selectedIndex: 0),
  
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Theme.of(context).colorScheme.surface,  //surface
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/logos/logoIcon.png'), height: 22.5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'MoistMeter',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Theme.of(context).colorScheme.surface, //surface
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.person_2_rounded),
                  ),
                )
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/farm.jpg'), 
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 40,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                                      ),
                                      Text(
                                        "80%",
                                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Temperature",
                                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                                      ),
                                      Text(
                                        "32°C",
                                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 40,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    height: 200,
                                    width: 340,
                                    
                                    color: Colors.white,
                                    child: SfCalendar(
                                      view: CalendarView.week,
                                      headerHeight: 0,
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
                                      backgroundColor: Theme.of(context).colorScheme.surface,
                                      timeSlotViewSettings: const TimeSlotViewSettings(numberOfDaysInView: 1),
                                    ),
                                    ),
                                  ),
                                
                             
                              ],
                      
                            ),
                          )
                        ],
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