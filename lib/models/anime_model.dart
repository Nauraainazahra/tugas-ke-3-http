class Anime {
  final int id;
  final String name;
  final String imageUrl;
  final String familyCreator;

  Anime({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.familyCreator,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown', // Mengubah default dari 0 menjadi 'Unknown'
      imageUrl: (json['images'] != null && json['images'] is List && json['images'].isNotEmpty)
          ? json['images'][0] as String
          : 'https://placehold.co/150', // Placeholder jika tidak ada gambar
      familyCreator: json['family'] != null && json['family'] is Map<String, dynamic>
          ? json['family']['creator'] ?? 'Family Creator kosong'
          : 'Gaada keluarga!', // Teks default jika family tidak ada
    );
  }
}
