import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:interstate_bus_services_app/services/user_service.dart';
import 'package:provider/provider.dart' as provider;

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.detailName,
    required this.detailHeader,
  }) : super(key: key);

  final String detailHeader;
  final String detailName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailHeader,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        provider.Selector<UserService, BackendlessUser?>(
          selector: (context, value) => value.currentUser,
          builder: (context, value, child) {
            return value == null
                ? Container()
                : Text(
                    value.getProperty(detailName),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.amber[900],
                    ),
                  );
          },
        ),
      ],
    );
  }
}