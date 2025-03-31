<div align="center">
    <img src="./assets/logos/logoIcon.png.png" width="64" height="64" alt="MoistMeter logo">
    <h1>
        <a href="https://github.com/NathanPerrier/MoistMeter">
            MoistMeter
        </a>
    </h1>
    <p>
        <strong>Flutter</strong> &bull; <strong>Django</strong> &bull; <strong>Firebase</strong> &bull; <strong>Mapbox</strong> &bull; <strong>BOM</strong>
    </p>     
</div>

<br />

<div align="center">
    <img src="./MoistMeterDemo.gif" alt="IA3 Demo">

</div>

<br />

## About The Project

**🥳2025 UQIES SIC WINNER**

MoistMeter is an innovative app aimed to significantly reduce water wastage in agriculture. Through using various APIs and services as well as the option to connect to custom IOT devices out algarithmic ML models determine the minimum amount of water required while still maximising crop yeild. While our app is aimed primarily at farmers, our app also offers cheaper or free plans for gardening enthusiasts as every drop counts!

<br />

## Manual Build 

> 👉 Download code

```bash
git clone https://github.com/NathanPerrier/MoistMeter
cd MoistMeter
```

> 👉 Create `.env` with the following Secret Keys

```env
MAPBOX_ACCESS_TOKEN=""
```

> 👉 Install **Dart** Libraries

```bash
flutter pub get
```

> 👉 Avtivate and configure **FireFlutter**

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

> 👉 Run the App!

```bash
flutter run --release
```

<br />

## Codebase 

```bash
< PROJECT ROOT >
   |
   |-- assets/                 # Project Assets
   |    |-- fonts/             # App Fonts
   |    |-- images/            # App images
   |    |-- logos/             # App Logos
   |
   |-- lib/                    # App Files
   |    |-- components/        # App screen Components
   |    |    |-- intro/        # Compents for intro screen  
   |    |-- firebase_options.dart   # Firebase Options (auto generated on flutterfire configure)
   |    |-- main.dart          # Main file for app
   |
   |-- screens/                # App Screens
   |   
   |-- pubspec.yaml            # App config file
   |-- .env                    # ENV File
   |
   |-- *************************************************      
```   

<br />

## License

@MIT
