class ServiceProvider {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final double hourlyRate;
  final bool isVerified;
  final String category;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.hourlyRate,
    required this.isVerified,
    required this.category,
  });

  ServiceProvider copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? rating,
    double? hourlyRate,
    bool? isVerified,
    String? category,
  }) {
    return ServiceProvider(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      isVerified: isVerified ?? this.isVerified,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'hourlyRate': hourlyRate,
      'isVerified': isVerified,
      'category': category,
    };
  }

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      hourlyRate: (json['hourlyRate'] as num).toDouble(),
      isVerified: json['isVerified'] as bool,
      category: json['category'] as String,
    );
  }

  @override
  String toString() {
    return 'ServiceProvider(id: $id, name: $name, rating: $rating, hourlyRate: $hourlyRate, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServiceProvider && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

final List<ServiceProvider> mockProviders = [
  ServiceProvider(
    id: '1',
    name: 'Sarah Johnson',
    imageUrl: 'https://i.pravatar.cc/150?img=1',
    rating: 4.9,
    hourlyRate: 45.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '2',
    name: 'Michael Chen',
    imageUrl: 'https://i.pravatar.cc/150?img=12',
    rating: 4.8,
    hourlyRate: 50.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '3',
    name: 'Emily Davis',
    imageUrl: 'https://i.pravatar.cc/150?img=5',
    rating: 4.7,
    hourlyRate: 42.0,
    isVerified: false,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '4',
    name: 'James Wilson',
    imageUrl: 'https://i.pravatar.cc/150?img=15',
    rating: 4.6,
    hourlyRate: 48.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '5',
    name: 'Lisa Anderson',
    imageUrl: 'https://i.pravatar.cc/150?img=9',
    rating: 4.9,
    hourlyRate: 55.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '6',
    name: 'Robert Martinez',
    imageUrl: 'https://i.pravatar.cc/150?img=33',
    rating: 4.5,
    hourlyRate: 40.0,
    isVerified: false,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '7',
    name: 'Jennifer Taylor',
    imageUrl: 'https://i.pravatar.cc/150?img=10',
    rating: 4.8,
    hourlyRate: 47.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '8',
    name: 'David Brown',
    imageUrl: 'https://i.pravatar.cc/150?img=52',
    rating: 4.4,
    hourlyRate: 38.0,
    isVerified: false,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '9',
    name: 'Maria Garcia',
    imageUrl: 'https://i.pravatar.cc/150?img=20',
    rating: 4.7,
    hourlyRate: 43.0,
    isVerified: true,
    category: 'Home Cleaning Services',
  ),
  ServiceProvider(
    id: '10',
    name: 'Kevin Thompson',
    imageUrl: 'https://i.pravatar.cc/150?img=60',
    rating: 4.6,
    hourlyRate: 46.0,
    isVerified: false,
    category: 'Home Cleaning Services',
  ),
];

ServiceProvider? getProviderById(String id) {
  try {
    return mockProviders.firstWhere((provider) => provider.id == id);
  } catch (e) {
    return null;
  }
}

List<ServiceProvider> getVerifiedProviders() {
  return mockProviders.where((provider) => provider.isVerified).toList();
}

List<ServiceProvider> getProvidersAboveRating(double minRating) {
  return mockProviders
      .where((provider) => provider.rating >= minRating)
      .toList();
}

List<ServiceProvider> getProvidersByPriceRange(
  double minPrice,
  double maxPrice,
) {
  return mockProviders
      .where(
        (provider) =>
            provider.hourlyRate >= minPrice && provider.hourlyRate <= maxPrice,
      )
      .toList();
}

double getAverageHourlyRate() {
  if (mockProviders.isEmpty) return 0.0;
  final total = mockProviders.fold<double>(
    0.0,
    (sum, provider) => sum + provider.hourlyRate,
  );
  return total / mockProviders.length;
}

double getAverageRating() {
  if (mockProviders.isEmpty) return 0.0;
  final total = mockProviders.fold<double>(
    0.0,
    (sum, provider) => sum + provider.rating,
  );
  return total / mockProviders.length;
}
