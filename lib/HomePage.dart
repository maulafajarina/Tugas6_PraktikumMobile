import 'package:flutter/material.dart';
import 'main.dart';
import 'DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false; 

  // Navigasi ke halaman detail (dipakai oleh list dan grid)
  void bukaDetail(Map<String, String> wisata) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(wisata: wisata),
      ),
    );
  }

  // Widget gambar dari URL, dengan loading & fallback kalau gagal dimuat
  Widget gambarWisata(String url, {double? width, double? height}) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          width: width,
          height: height,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Wisata'),
        actions: [
          IconButton(
            tooltip: isGrid ? 'Ubah ke List' : 'Ubah ke Grid',
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: isGrid ? buildGridView() : buildListView(),
    );
  }

  // ---------- TAMPILAN LIST ----------
  Widget buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data_wisata.length,
      itemBuilder: (context, index) {
        final wisata = data_wisata[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Hero(
              tag: wisata['nama']!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: gambarWisata(wisata['gambar']!, width: 80, height: 80),
              ),
            ),
            title: Text(
              wisata['nama']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.location_on, size: 14),
                const SizedBox(width: 2),
                Text(wisata['lokasi']!),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => bukaDetail(wisata), // klik item -> halaman detail
          ),
        );
      },
    );
  }

  // ---------- TAMPILAN GRID ----------
  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data_wisata.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final wisata = data_wisata[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => bukaDetail(wisata), // klik item -> halaman detail
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: wisata['nama']!,
                    child: gambarWisata(
                      wisata['gambar']!,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata['nama']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              wisata['lokasi']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}