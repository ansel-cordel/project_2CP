import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 215, 215, 215),
      ),
      width: 500,
      height: MediaQuery.of(context).size.height * 0.06,
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          // Trigger search with a pre-filled query (you can pass anything here)
          showSearch(
            context: context,
            delegate: SearchDelegateImpl(initialQuery: 'pizza'),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Search for pizza....",
              style: TextStyle(
                color: Color.fromARGB(211, 122, 122, 122),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Stack(
              children: [
                const Icon(
                  Icons.search,
                  color: Color.fromARGB(211, 122, 122, 122),
                ),
                Positioned(
                  top: -16,
                  right: 3,
                  left: -1,
                  child: Image.asset(
                    'img/chef.jpg',
                    height: 40,
                    width: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchDelegateImpl extends SearchDelegate<String> {
  final String initialQuery;

  SearchDelegateImpl({required this.initialQuery}) {
    query = initialQuery;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Suggestions for '$query'"),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text("Showing results for '$query'"),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

}


class CustomSearchPage extends StatefulWidget {
  final String initialQuery;

  const CustomSearchPage({super.key, required this.initialQuery});

  @override
  State<CustomSearchPage> createState() => _CustomSearchPageState();
}

class _CustomSearchPageState extends State<CustomSearchPage> {
  late TextEditingController _controller;
  List<String> allItems = [
    'Turkish BBQ',
    'Pasta Salad',
    'Salad',
    'Cheese Pizza',
    'Salmon'
  ];
  List<String> results = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    _search(widget.initialQuery);
  }

  void _search(String query) {
    setState(() {
      results = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: _search,
        ),
      ),
      body: results.isEmpty
          ? const Center(child: Text('No results found'))
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(results[index]),
              ),
            ), 
    );
  }
}



