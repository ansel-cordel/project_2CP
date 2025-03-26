import 'package:flutter/material.dart';

class search extends StatefulWidget{
  const search({super.key});

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search>{
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:const Color.fromARGB(255, 215, 215, 215)),
        width: 500,
        height: MediaQuery.of(context).size.height*0.06,
        margin: EdgeInsets.only(top:30,bottom: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Text("Search for pizza....",
            style: TextStyle(
              color: const Color.fromARGB(211, 122, 122, 122),
              fontWeight: FontWeight.w400,
              fontSize: 18,
              ),
              ),
            Stack(
              children: [ 
                Icon(Icons.search,
                color:const Color.fromARGB(211, 122, 122, 122),
                ),
                Positioned(
                  top: -16,
                  right: 3,
                  left: -1,
                  child:
                  Image.asset('img/chef.jpg',
                    height: 40,
                    width: 10,
                    )),
                ]
            ),],
        ),
          onPressed:(){
            showSearch(context: context, delegate: Search());
        }),
   );
  }
}

class Search extends SearchDelegate {
  final List<String> searchResults = ["Pizza", "Burger", "Pasta", "Sushi"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text("Results for: $query"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}