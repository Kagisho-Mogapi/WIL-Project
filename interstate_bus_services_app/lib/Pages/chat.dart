import 'package:interstate_bus_services_app/Routes/routes.dart';
import 'package:interstate_bus_services_app/Themes/theme.dart';
import 'package:interstate_bus_services_app/chatt_connect.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/screens/select_user_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

// void main() {

//   runApp(
//     MyApp(
//       client: client,
//     ),
//   );
// }

class Chat extends StatelessWidget {
  Chat({
    Key? key,
    //required this.client,
  }) : super(key: key);

  final client = StreamChatClient(streamKey);
  //final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, RouteManager.home);
          },
        ),
        backgroundColor: Colors.black54,
      ),
      body: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
        title: 'Interstate Bus Line Services',
        builder: (context, child) {
          return StreamChatCore(
            client: client,
            child: ChannelsBloc(
              child: UsersBloc(
                child: child!,
              ),
            ),
          );
        },
        home: const SelectUserScreen(),
      ),
    );
  }
}
