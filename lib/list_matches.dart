import 'package:flutter/material.dart';
import 'package:responsi_124200049/data_source.dart';
import 'package:responsi_124200049/matches_model.dart';
import 'package:responsi_124200049/detail_matches.dart';

class ListMatches extends StatefulWidget {
  const ListMatches({Key? key}) : super(key: key);

  @override
  State<ListMatches> createState() => _ListMatchesState();
}

class _ListMatchesState extends State<ListMatches> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Piala Dunia 2022"),
          centerTitle: true,
          backgroundColor: Colors.red[900]
      ),
      body: _buildHome(),
    );
  }

  Widget _buildHome() {
    return Container(
      child: FutureBuilder(
          future: MatchesSource.instance.LoadMatches(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              // MatchesModel1 matchesModel1 = MatchesModel1.fromJson(snapshot.data);
              return _buildSuccessSection(snapshot.data);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(List<dynamic> data) {
    return ListView.builder(
      itemCount: 48,
      itemBuilder: (BuildContext context, int index) {
        MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListMatchesDetail(
                  detail: matchesModel,
                ),
              ),
            );
          },
          child: Container(
            height: 100,
            width: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1), // if you need this
                side: BorderSide(

                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: 100,
                      height: 70,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                              'https://countryflagsapi.com/png/${matchesModel.homeTeam!.name!}')
                      )),

                  Text("${matchesModel.homeTeam!.name!}"),
                  Text("${matchesModel.homeTeam!.goals!} - ${matchesModel.awayTeam!.goals!}"),
                  Text("${matchesModel.awayTeam!.name!}"),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 100,
                    height: 70,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                          'https://countryflagsapi.com/png/${matchesModel.awayTeam!.name!}'),
                    ),
                  ),
                ],
              ),
            ),
          )
        );

      },
      //
    );
  }
}
