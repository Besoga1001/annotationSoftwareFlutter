import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annotation Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(13, 13, 21, 1),
            title: const Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: Text("Anotações",
                  style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(13, 13, 21, 1)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: ListView(
              children: [
                Anotacao('Aprender Flutter', DateTime.now(),
                    "Lorem ipsum dolor sit amet. Sit voluptas ipsum sed soluta doloremque et exercitationem esse aut amet accusamus nam incidunt suscipit est quia soluta vel delectus magni."),
                Anotacao('Cartão 2', DateTime.now(),
                    "Et dolor corporis et nostrum incidunt cum distinctio aliquid vel possimus corrupti. Eos doloremque quia et impedit earum et dolores ratione eum expedita asperiores et magni cumque?"),
                Anotacao('Flutter 3', DateTime.now(),
                    "Ut dolores exercitationem nam soluta Quis eos obcaecati cupiditate et beatae maxime. 33 omnis excepturi ut ipsum aperiam eos doloribus debitis ea quidem tempora!"),
                Anotacao('Cartão 4', DateTime.now(),
                    "Qui tempora neque non possimus earum eum dolorum porro sed recusandae doloremque et cumque nemo sit alias omnis sed maxime voluptatem. "),
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
            child:
                FloatingActionButton(onPressed: () {}, child: Icon(Icons.add))),
      ),
    );
  }
}

class Anotacao extends StatefulWidget {
  final String title;
  final DateTime date;
  final String desc;

  const Anotacao(this.title, this.date, this.desc, {super.key});

  @override
  State<Anotacao> createState() => _AnotacaoState();
}

class _AnotacaoState extends State<Anotacao> {
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat("d 'de' MMMM", 'pt_BR').format(widget.date);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(26, 33, 45, 1),
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                child: Text(widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, bottom: 5, right: 15.0),
                child: Text(formattedDate,
                    style: const TextStyle(
                        color: Color.fromRGBO(137, 130, 154, 1), fontSize: 10)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, bottom: 10, right: 15.0),
                child: Text(widget.desc,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
