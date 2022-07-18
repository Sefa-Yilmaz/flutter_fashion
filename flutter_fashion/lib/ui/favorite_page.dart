import 'package:flutter/material.dart';
import 'package:flutter_fashion/model/fashion.dart';
import 'package:flutter_fashion/ui/detail_view.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final List<Fashion> _mainfashionList = Fashion.fashionList;
    final List<Fashion> _fashionList = _mainfashionList
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: _fashionList.length == 0
            ? Center(
                child: Text('Favoriniz yok'),
              )
            : ListView.builder(
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
                              icon: _fashionList[index].isFavorite == true
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    )
                                  : Icon(
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
    );
  }
}
