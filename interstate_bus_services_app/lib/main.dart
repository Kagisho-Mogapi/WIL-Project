import 'package:flutter/material.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart';

import 'Routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // List of providers
          ChangeNotifierProvider(create: (context) => UserService()),
        ],
        child: MaterialApp(
          initialRoute: RouteManager.loading,
          onGenerateRoute: RouteManager.generateRoute,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _status = 'Object is saving to the real time database...';
  String _savedValue = '...';
  Map _savedTestObject = {};
  IDataStore<Map> _testTableDataStore = Backendless.data.of('');
  TextEditingController _controller = TextEditingController();

  static const String SERVER_URL = "https://eu-api.backendless.com";
  static const String APPLICATION_ID = "6C057E8A-5743-1687-FF77-06AE75443400";
  static const String ANDROID_API_KEY = "5771E324-6F0D-4CF2-A813-D9339D3223FD";
  static const String IOS_API_KEY = "6A6097DF-84AC-442F-AEA9-FADDCE16F1CB";
  static const String JS_API_KEY = "CBB3571F-FB60-4DDE-95B3-21615345B79B";

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _controller = TextEditingController();

    await Backendless.setUrl(SERVER_URL);
    await Backendless.initApp(
      applicationId: APPLICATION_ID,
      androidApiKey: ANDROID_API_KEY,
      jsApiKey: JS_API_KEY,
      iosApiKey: IOS_API_KEY,
    );
    //await Backendless.initWebApp(APPLICATION_ID, JS_API_KEY);

    Map testObject = Map();
    testObject['foo'] = 'Hello World';
    _testTableDataStore = Backendless.data.of('TestTable');
    _testTableDataStore.save(testObject).then((response) {
      _savedTestObject = response!;
      _subscribeForObjectUpdate();
      setState(() {
        _status = 'Object has been saved in the real-time database';
        _savedValue = response['foo'];
      });
    });
  }

  void _subscribeForObjectUpdate() {
    _testTableDataStore.rt().addUpdateListener(
        (response) => setState(() => _savedValue = response['foo']),
        whereClause: "objectId='${_savedTestObject["objectId"]}'");
  }

  void _updateValue() {
    _savedTestObject['foo'] = _controller.text;
    _testTableDataStore.save(_savedTestObject).then((response) {
      print("Saved $response");
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: MaterialButton(
              height: 50,
              minWidth: 200,
              color: Colors.red[700],
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.welcome);
              },
              child: Text(
                'bump',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ));
  }
}
