import 'package:flutter/material.dart';
import 'package:flutter_fashion/model/fashion.dart';
import 'package:flutter_fashion/ui/detail_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Fashion> _fashionList = Fashion.fashionList;
  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Moda Haftası',
            style: TextStyle(
                color: (Colors.blue),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text('2022 Moda şovu'),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Keşfetmek',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Image.asset(
                'assets/filter.png',
                height: 30,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Önerilen',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Text('Yeni modeller'),
              Text('2022 Göstermek'),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _fashionList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailView(
                              fashionId: index,
                            )));
                  },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(_fashionList[index].url),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 10,
                            child: Text(
                              _fashionList[index].name,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Text(
                              _fashionList[index].location,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  bool isFavorite = toggleIsFavorite(
                                      _fashionList[index].isFavorite);
                                  _fashionList[index].isFavorite = isFavorite;
                                });
                              },
                              icon: _fashionList[index].isFavorite==true?
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ):
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
