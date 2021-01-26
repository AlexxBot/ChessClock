import 'package:ChessClockApp/database/clock.dart';
import 'package:ChessClockApp/provider/themeBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class ChessListPage extends StatefulWidget {
  @override
  _ChessListPageState createState() => _ChessListPageState();
}

class _ChessListPageState extends State<ChessListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chess Options"),
        actions: [
          Switch(
            value: context.watch<ThemeBloc>().tema == ThemeData.dark(),
            onChanged: (oscuro) => oscuro
                ? context.read<ThemeBloc>().tema = ThemeData.dark()
                : context.read<ThemeBloc>().tema = ThemeData.light(),
          )
        ],
      ),
      body: FutureBuilder(
          future: Hive.openBox("Clocks"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return ChessList(lista: snapshot.data);
            } else
              return Scaffold();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _agregarClock(this.context),
      ),
    );
  }

  Future<bool> _agregarClock(BuildContext context) {
    TextEditingController _description = TextEditingController();
    TextEditingController _duration = TextEditingController();
    TextEditingController _increment = TextEditingController();
    TextEditingController _movesToIncrement = TextEditingController();

    _guardar() async {
      var clockBox = await Hive.openBox("Clock");
      var clock = Clock()
        ..description = _description.text
        ..duration = int.parse(_duration.text)
        ..increment = int.parse(_increment.text)
        ..movesToIncrement = int.parse(_movesToIncrement.text);
      clockBox.add(clock);

      /* print(box.getAt(0)); // Dave - 22

      person.age = 30;
      person.save();

      print(box.getAt(0)) // Dave - 30 */
    }

    return showDialog(
        context: context,
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _description),
              TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _duration),
              TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _increment),
              TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: _movesToIncrement),
              RaisedButton(
                child: Text("Guardar"),
                onPressed: _guardar,
              )
            ],
          ),
        ));
  }
}

class ChessList extends StatelessWidget {
  final List<Clock> lista;
  const ChessList({Key key, this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(title: Text(lista[index].description));
      },
      itemCount: lista.length,
    );
  }
}
