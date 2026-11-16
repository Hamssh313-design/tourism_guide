import 'package:flutter/material.dart';
import '../models/attraction.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Attraction> _favoritePlaces = [];

  List<Attraction> get favoritePlaces => _favoritePlaces;

  bool isFavorite(dynamic place) {
    if (place is Attraction) {
      return _favoritePlaces.any((p) => p.id == place.id);
    } else if (place is int) {
      return _favoritePlaces.any((p) => p.id == place);
    }
    return false;
  }

  void toggleFavorite(dynamic place) {
    if (place is Attraction) {
      if (isFavorite(place)) {
        _favoritePlaces.removeWhere((p) => p.id == place.id);
      } else {
        _favoritePlaces.add(place);
      }
      notifyListeners();
    } else if (place is int) {
      if (isFavorite(place)) {
        _favoritePlaces.removeWhere((p) => p.id == place);
      }
      notifyListeners();
    }
  }

  void clearFavorites() {
    _favoritePlaces.clear();
    notifyListeners();
  }
}

typedef FavoriteProvider = FavoritesProvider;
