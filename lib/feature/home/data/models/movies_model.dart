class MoviesModel {
  List<MoviesResults>? results;
  int? page;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.results, this.page, this.totalPages, this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <MoviesResults>[];
      json['results'].forEach((v) {
        results!.add( MoviesResults.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MoviesResults {
  int? id;
  bool? adult;

  MoviesResults({this.id, this.adult});

  MoviesResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adult = json['adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['adult'] = adult;
    return data;
  }
}
