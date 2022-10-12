import 'package:flutter/material.dart';
import 'package:random_person_id_generator/screens/helpers/random_id_halper.dart';
import 'package:random_person_id_generator/screens/modals/random_people.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Random Peoples"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: RandomPeople.randomPeople.fetchRandomData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Peoples> data = snapshot.data;

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 380,
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(data[i].large)),
                          ),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Name: ",
                                ),
                                TextSpan(
                                  text:
                                      "${data[i].title}. ${data[i].first} ${data[i].last}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Text("Gender: ${data[i].gender}"),
                          Text("Age: ${data[i].age}"),
                          Text("Phone: ${data[i].phone}"),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Location: ",
                                ),
                                TextSpan(
                                  text:
                                      "${data[i].city}, ${data[i].state}, ${data[i].country}",
                                ),
                              ],
                            ),
                          ),

                          Text(
                              " Date  of Birth: ${data[i].date.split("T")[0]}"),

                          // const Text("   Geo :"),
                          // Text("      Lat: ${data[i].lat}"),
                          // Text("      Lng: ${data[i].lng}"),
                          // Text("Phone: ${data[i].phone}"),
                          // Text("Web site: ${data[i].website}"),
                          // const Text("Company :"),
                          // Text("   Name: ${data[i].companyName}"),
                          // Text("   Catch Phrase: ${data[i].catchPhrase}"),
                          // Text("   Bs: ${data[i].bs}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget _listView(AsyncSnapshot snapshot) {
  if (snapshot.hasData) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(snapshot.data[index].asPascalCase),
        );
      },
    );
  } else {
    return Center(
      child: Text('Loading data...'),
    );
  }
}
