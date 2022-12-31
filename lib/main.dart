import 'package:crudzoo_flutter_web/api/health_check.dart';
import 'package:crudzoo_flutter_web/container.dart';
import 'package:crudzoo_flutter_web/presenter/tasks_presenter.dart';
import 'package:crudzoo_flutter_web/view/pages/health_check.dart';
import 'package:crudzoo_flutter_web/view/pages/home.dart';
import 'package:crudzoo_flutter_web/view/pages/tasks.dart';
import 'package:crudzoo_flutter_web/view/state/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloWorldProvider = StateProvider((_) => 'Hello world');

Future main() async {
  usePathUrlStrategy();
  runApp(ProviderScope(child: MyApp()));
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health Check'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Center(
              child: MyStatelessWidget(),
            )
          ],
        ));
  }
}

class HealthCheck extends StatefulWidget {
  const HealthCheck({super.key});

  @override
  HealthCheckState createState() {
    return HealthCheckState();
  }
}

class HealthCheckState extends State<HealthCheck> {
  String _status = "loading...";

  late Future<ApiStatus> apiStatus;

  @override
  void initState() {
    super.initState();
    apiStatus = fetchHealthCheck();
  }

  void setStatus() {
    setState(() {
      _status = "success";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder<ApiStatus>(
            future: apiStatus,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.status);
              } else if (snapshot.hasError) {
                return const Icon(
                  Icons.signal_cellular_connected_no_internet_0_bar_sharp,
                  color: Colors.red,
                  size: 30.0,
                );
              }
              return const CircularProgressIndicator();
            })
      ],
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'API Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Status',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('bff')),
            DataCell(HealthCheck()),
          ],
        ),
      ],
    );
  }
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/tasks',
        builder: (BuildContext context, GoRouterState state) {
          return const TaskPageView();
        },
      ),
      GoRoute(
          path: '/health_check',
          builder: (BuildContext context, GoRouterState state) {
            return const HealthCheckPage();
          })
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'example',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello World!　日本語テスト',
            ),
            Text('$_counter',
                style: Theme.of(context).textTheme.headline4,
                key: const Key('testable')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
