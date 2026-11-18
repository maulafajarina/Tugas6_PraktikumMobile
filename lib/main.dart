import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

// Data tempat wisata — foto disimpan sebagai URL langsung di kode
final List<Map<String, String>> data_wisata = [
  {
    'nama': 'Raja Ampat',
    'lokasi': 'Papua Barat Daya',
    'gambar':
    'https://images.unsplash.com/photo-1702664045144-8c97b3034d26?w=800&auto=format&fit=crop&q=60',
    'deskripsi':
        'Pulau dengan keanekaragaman hayati laut yang sangat tinggi. '
        'Raja Ampat terkenal sebagai surga bagi penyelam dan pecinta snorkeling, '
        'dengan air laut jernih dan pemandangan pulau karst yang indah.',
  },
  {
    'nama': 'Kepulauan Seribu',
    'lokasi': 'DKI Jakarta',
    'gambar':
    'https://plus.unsplash.com/premium_photo-1701085275737-99c0abca10a4?w=800&auto=format&fit=crop&q=60',
    'deskripsi':
        'Gugusan pulau di utara Jakarta yang bisa dicapai dengan kapal dari '
        'Muara Angke. Cocok untuk snorkeling,'
        'keliling pulau, dan menikmati pantai berpasir putih.',
  },
  {
    'nama': 'Gunung Bromo',
    'lokasi': 'Jawa Timur',
    'gambar':
    'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?w=800&auto=format&fit=crop&q=60',
    'deskripsi':
        'Gunung berapi aktif dengan lautan pasir yang luas. Wisatawan '
        'biasanya datang dini hari untuk melihat matahari terbit dari '
        'Penanjakan dengan latar Gunung Bromo dan Semeru.',
  },
  {
    'nama': 'Kawah Putih',
    'lokasi': 'Ciwidey, Jawa Barat',
    'gambar':
    'https://images.unsplash.com/photo-1646109900203-50b80ee648a8?w=800&auto=format&fit=crop&q=60',
    'deskripsi':
        'Danau kawah Gunung Patuha dengan air berwarna putih kehijauan, '
        'suasana berkabut, dan udara yang dingin. Terletak sekitar 50 km '
        'di selatan Kota Bandung.',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Wisata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}