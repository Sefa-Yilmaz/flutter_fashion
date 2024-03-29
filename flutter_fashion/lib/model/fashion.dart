class Fashion {
  final int id;
  final String url; //resimlerrimn url'si
  final String name;
  final String location;
  final String description;
  bool isFavorite;

  Fashion(this.id, this.url, this.name, this.location, this.description,
      this.isFavorite);

  static List<Fashion> fashionList = [
//id,url,name,location,description,isFavorite diye sıralanıyor
    Fashion(
        1,
        'assets/img1.jpg',
        'Jane Doe',
        'Paris',
        'A model who is very fit in terms of health and other financial matters and has good taste for clothes ',
        false),
    Fashion(
        2,
        'assets/img2.jpg',
        'Mercy Doe',
        'New York',
        'Mercy is well-groomed with very good taste of fashion and clothes as well as travelling globally.',
        false),
    Fashion(
        3,
        'assets/img3.jpg',
        'Brown Doe',
        'London',
        'Brown maintains a positive and healthy lifestyle everytime and spreads good energy to fellow cohorts',
        false),
    Fashion(
        4,
        'assets/img4.jpg',
        'Juliet Doe',
        'Brussels',
        'Juliet is a force to reckon with. She has won several awards in the fashion industry including the recent Fobes Woman.',
        false),
    Fashion(
        5,
        'assets/img5.jpg',
        'Beatrice Doe',
        'Paris',
        'A 21st Century model who is very fit in terms of health and other financial matters and has good taste for clothes',
        false),
    Fashion(
        6,
        'assets/img6.jpg',
        'Kaisy Doe',
        'Tokyo',
        'She is very sassy and well-groomed with very good taste of fashion and clothes as well as travelling globally.',
        false),
    Fashion(
        7,
        'assets/img7.jpg',
        'Diana Doe',
        'Berlin',
        'Berlin poses are out of this world. She maintains a good lifestyle everytime and spreads good energy to fellow cohorts',
        false),
    Fashion(
        8,
        'assets/img8.jpg',
        'Janet Doe',
        'Accra',
        'Janet is a force to reckon with. She has won several awards in the fashion industry including the recent Fobes Woman.',
        false),
  ];
}
