import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:damasfollows/screens/network_check.dart';
import 'package:damasfollows/screens/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  var connectedornot;
   HomePage({Key? key,required this.connectedornot}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPage(),

      // StreamProvider<NetworkStatus>(
      //   initialData: widget.connectedornot,
      //   create: (context) =>
      //   NetworkStatusService().networkStatusController.stream,
      //   child: NetworkCheck(
      //     onlineScreen:
      //     offlineScreen: Scaffold(
      //       backgroundColor: Colors.white,
      //       body: Column(
      //         children: <Widget>[
      //           Expanded(
      //             flex: 2,
      //             child: Column(
      //               children: <Widget>[
      //                 Expanded(
      //                   child: Center(
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(15.0),
      //                       child: Image.asset(
      //                         "assets/internt.gif",
      //                         // fit: BoxFit.contain,
      //                         filterQuality: FilterQuality.medium,
      //                         height: MediaQuery.of(context).size.height * 5.7,
      //                         width: MediaQuery.of(context).size.width * 5.7,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 15,
      //                 ),
      //
      //                 /********************** Refresh Button *******************/ //
      //                 // Padding(
      //                 //   padding: const EdgeInsets.all(8.0),
      //                 //   child: ElevatedButton(
      //                 //     style: ButtonStyle(
      //                 //         backgroundColor:
      //                 //             MaterialStateProperty.all(const Color(0xffFE9126))),
      //                 //     onPressed: UiUpdate,
      //                 //     child: const Text("Retry"),
      //                 //   ),
      //                 // ),
      //                 const Padding(
      //                   padding: EdgeInsets.only(bottom: 55.0),
      //                   child: Center(
      //                     child: Text(
      //                       "Please! Check Your Internet Connection.",
      //                       style: TextStyle(color: Colors.blueGrey),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
class NetworkStatusService {
  ///*** Creating Controller For Network Status***///
  StreamController<NetworkStatus> networkStatusController =
  StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }
  NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.wifi) {
      return NetworkStatus.online;
    } else if (status == ConnectivityResult.mobile) {
      return NetworkStatus.online;
    } else if (status == ConnectivityResult.none) {
      return NetworkStatus.offline;
    }
    return NetworkStatus.offline;
  }
}
