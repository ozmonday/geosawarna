import 'package:flutter/foundation.dart';
import 'package:geosawarna/models/palce.dart';
import 'package:latlong/latlong.dart';

class PlacesProvider with ChangeNotifier {
  Place _currentPlace;
  Place get currentPlace => _currentPlace;

  List<Place> _places = [
    Place(
        latLng: LatLng(-6.993997639908964, 106.307128381556),
        name: "Pantai Tanjung Layar",
        desc:
            "Di sini kita bisa menemukan batuan yang membentuk 2 tebing, yang terlihat seperti layer kapal. Dari sinilah kemudian diberi nama Pantai Tanjung Layar. Yang menarik lagi ditemukannya bongkah bongkah batu besar di dalam batuan ini, yang diduga merupakan produk letusan gunung api. Di bagian atas:  graded bedding, paralel lamination, bagian bawah: perselingan batupasir-batulempung, cross lamination. Batulempung karbonatan, batupasir karbonatan. Diatas endapan turbidit diendapkan volcanic rock- dengan fragmen batulempung, batupasir; matriks tuff lapili; struktur nendatan, tuff memperlihatkan normal graded bedding.",
        pic: ["assets/picaset/1.jpg", "assets/picaset/2.jpg"],
    ),
    Place(
        latLng: LatLng(-6.990582797082761, 106.32620181492456),
        name: "Karang Taraje",
        desc: "Karang Taraje masih merupakan bagian dari Formasi Cimapag, selayaknya Pantai Tanjung Layar. Di sisi utara dari Pantai Karang Taraje kita akan menemukan endapan turbidit. Semakin ke sisi selatan kita akan menemukan lebih banyak batuan hasil endapan vulkanik. Umumnya berupa breksi. Batuan breksi ini lebih resisten terhadap pelapukan dan ombak, sehingga membentuk bebatuan yang tinggi yang senantiasa diterjang ombak pantai selatan. Bagian bawah singkapan ini didominasi oleh batupasir-batulempung dengan lensa lapisan tuff lapili. Struktur sedimen cross lamination pada batupasir ditemukan pada bagian bawah singkapan. Bagian atas terdapat trend penebalan piroklastik breksi, yang mengindikasikan adanya peningkatan aktivitas vulkanisme. Kemunculan mata air kontak pada kontak antara batupasir halus/lempung dengan tuff diatasnya Beberapa ombak mampu menembus bebatuan , dibantu oleh keberadaan struktur geologi berupa kekar-kekar, dan mungkin juga sesar",
        pic: ["assets/picaset/4.jpg", "assets/picaset/3.jpg", "assets/picaset/5.jpg", "assets/picaset/6.jpg", "assets/picaset/7.jpg"]
    ),
    Place(
        latLng: LatLng(-6.987126254843529, 106.3224758195732),
        name: "Pantai Legon Pari",
        desc: "Pantai Legon Pari berlokasi di antara Karang Taraje, dan Karang Beureum. Pasir di Pantai Legon Pari berwarna putih krem, tapi tidak seputih pasir di Pantai Pasir Putih. Pasirnya berwarna putih krem karena tersusun terutama oleh fragmen cangkang bivalvia dan gastropod. Selain itu terdapat material litik berwarna hitam, coklat dan mineral kuarsa. Pasir dari Pantai Legon Pari berwarna putih krem karena tersusun terutama oleh fragmen cangkang bivalvia dan gastropod. Selain itu terdapat material litik berwarna hitam, coklat dan mineral kuarsa." ,
        pic: ["assets/picaset/8.jpg", "assets/picaset/9.jpg"]
    ),
    Place(
        latLng: LatLng(-6.991635759111573, 106.31947088342486),
        name: "Karang Beureum",
        desc: "Karang Beureum terdiri dari perselingan batupasir dan batulempung dibagian bawah dan bagian atas terdiri dari piroklastik tuff lapili hingga breccia. Secara biodiversity, kehidupan recent marine ini didominasi oleh brain coral, branching  coral dan coraline algae",
        pic: ["assets/picaset/12.jpg", "assets/picaset/10.jpg", "assets/picaset/11.jpg"]
    ),
    Place(
        latLng: LatLng(-6.975269952383646, 106.29490153924408),
        name: "Goa Langir",
        desc: "Goa ini terbentuk karena proses pelarutan oleh air. Bagian bawah singkapan ini adalah floatstone dengan matrix wackstone, grains didominasi oleh benthic foram, alga merah dan ostracoda. Setempat ditemukan intraclast yang membundar, sebagai hasil reworked batuan yang relatif lebih tua. Pada batugamping ini berkembang vuggy dan cavernous porosity. Selain dari Goa Langir, ditemukan banyak gua di daerah ini, ada goa kakasan, goa seribu candi, dan goa harta karun. Pada bagian dalam gua tidak terdapat stalagtit dan stalagmit. Kemungkinan karena terbentuknya gua lebih disebabkan oleh terbentuknya retakan pada batuan.",
        pic: ["assets/picaset/13.jpg"]
    ),
    Place(
        latLng: LatLng(-6.987126254843529, 106.3224758195732),
        name: "Pantai Muara",
        desc: "Pantai Muara memiliki pasir putih krem serupa dengan Pantai Legon Pari, yang juga tidak seputih pasir dari Pantai Pasir Putih.",
        pic: ["assets/picaset/14.jpg"]
    ),
    Place(
        latLng: LatLng(-6.982066906606158, 106.30550864109381),
        name: "Pantai Pasir Putih",
        desc: "Secara geomorfologi merupakan dataran landai yang berkembang gumuk pasir. High energy system, dipengaruhi oleh gelombang laut dan arus pasang-surut. Channel-channel kecil (lebar sekitar 1 meter) berkembang dan bermuara ke laut. Struktur sedimen ripple berkembang pada recent sediment pasir pantai. Sedimen pasir terdiri dari fragmen litik, kuarsa, beberapa cangkang bivalve. Di pantai pasir putih juga merupakan pusat keramaian dari pantai Sawarna. Di sini terdapat information center, penginapan, suvenir dan tempat makan, serta lifeguard.",
        pic: ["assets/picaset/15.jpg"]
    ),
      Place(
        latLng: LatLng(-6.979138423293903, 106.32303776028253),
        name: "Goa Lalay",
        desc: "Merupakan gua dengan mulut gua yang cukup besar yang dibentuk terutama oleh proses pelarutan batu gamping. Batuan yang ditemukan pada mulut goa tersusun oleh batuan packstone. Air masih mengalir deras ke luar dari mulut goa lalay, membentuk sungai kecil. Goa Lalay sendiri merupakan bagian dari jaringan gua yang lebih luas lagi.",
        pic: ["assets/picaset/16.jpg"]
    ),
  ];

  List<Place> get places => _places;

  void setCurrent(int index) {
    _currentPlace = _places[index];
    notifyListeners();
  }
}
