import 'package:dima_project/model/categories.dart';
import 'package:dima_project/model/serie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/series.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);
  static const routeName = '/add';

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String status = 'Watching';
  int season = 1;
  int episode = 0;

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Series>(context);
    final serie = ModalRoute.of(context)!.settings.arguments as Serie;

    return Scaffold(
      appBar: AppBar(title: Text(serie.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Menù a tendina per lo stato (category) della serie
          Row(
            children: [
              const Text("Status: "),
              DropdownButton<String>(
                value: status,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    status = newValue!;
                    if (status == "Completed") {
                      season = serie.totalSeasons;
                      episode = serie.seasons[serie.totalSeasons - 1].episodes;
                    } else if (status == "Plan to watch" ||
                        status == "Watching") {
                      season = 1;
                      episode = 0;
                    }
                  });
                },
                items: <String>['Watching', 'Completed', 'Plan to watch']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          //Menù a tendina per la stagione attuale (solo stato watching)
          Row(
            children: [
              const Text("Current Season: "),
              DropdownButton<int>(
                value: season,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: status == "Watching"
                    ? (int? newValue) {
                        setState(() {
                          episode = 0;
                          season = newValue!;
                        });
                      }
                    : null,
                items: serie.seasons.map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem<int>(
                    value: e.number,
                    child: Text(e.number.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Watched Episodes: "),
              //Menù a tendina per l'episodio attuale (solo stato watching)
              DropdownButton<int>(
                value: episode,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: status == "Watching"
                    ? (int? newValue) {
                        setState(() {
                          episode = newValue!;
                          if (season == serie.totalSeasons &&
                              episode == serie.seasons[season - 1].episodes) {
                            status = "Completed";
                          }
                        });
                      }
                    : null,
                items: List<int>.generate(
                    serie.seasons[season - 1].episodes + 1,
                    (index) => index).map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem<int>(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () => {
                        if (status == "Watching")
                          {
                            //TODO buggato, da sistemare
                            serie.changeCategory(Categories.watching),
                            serie.completeSeasons(season - 1),
                            serie.addEpisodes(season, episode)
                          }
                        else if (status == "Completed")
                          {
                            serie.changeCategory(Categories.completed),
                            serie.completeSeasons(serie.totalSeasons + 1)
                          }
                        else if (status == "Plan to watch")
                          {
                            serie.changeCategory(Categories.wishlist),
                            serie.emptySeasons(-1)
                          },
                        db.addSerie(serie),
                        Navigator.pop(context)
                      },
                  child: const Text("Add to list"))
            ],
          )
        ],
      ),
    );
  }
}
