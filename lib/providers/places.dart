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
            "Di sini kita bisa menemukan batuan yang membentuk 2 tebing, yang terlihat seperti layer kapal. Dari sinilah kemudian diberi nama Pantai Tanjung Layar. Yang menarik lagi ditemukannya bongkah bongkah batu besar di dalam batuan ini, yang diduga merupakan produk letusan gunung api. Di bagian atas:  graded bedding, paralel lamination, bagian bawah: perselingan batupasir-batulempung, cross lamination. Batulempung karbonatan, batupasir karbonatan. Diatas endapan turbidit diendapkan volcanic rock- dengan fragmen batulempung, batupasir; matriks tuff lapili; struktur nendatan, tuff memperlihatkan normal graded bedding."),
    Place(
        latLng: LatLng(-6.990582797082761, 106.32620181492456),
        name: "Karang Taraje",
        desc:
            "Karang Taraje masih merupakan bagian dari Formasi Cimapag, selayaknya Pantai Tanjung Layar. Di sisi utara dari Pantai Karang Taraje kita akan menemukan endapan turbidit. Semakin ke sisi selatan kita akan menemukan lebih banyak batuan hasil endapan vulkanik. Umumnya berupa breksi. Batuan breksi ini lebih resisten terhadap pelapukan dan ombak, sehingga membentuk bebatuan yang tinggi yang senantiasa diterjang ombak pantai selatan. Bagian bawah singkapan ini didominasi oleh batupasir-batulempung dengan lensa lapisan tuff lapili. Struktur sedimen cross lamination pada batupasir ditemukan pada bagian bawah singkapan. Bagian atas terdapat trend penebalan piroklastik breksi, yang mengindikasikan adanya peningkatan aktivitas vulkanisme. Kemunculan mata air kontak pada kontak antara batupasir halus/lempung dengan tuff diatasnya Beberapa ombak mampu menembus bebatuan , dibantu oleh keberadaan struktur geologi berupa kekar-kekar, dan mungkin juga sesar")
  ];

  List<Place> get places => _places;

  void setCurrent(int index) {
    _currentPlace = _places[index];
    notifyListeners();
  }
}
