import 'package:json_annotation/json_annotation.dart';

part 'reviews_response.g.dart';

@JsonSerializable()
class ReviewsResponse {
  int? id;
  int? page;
  @JsonKey(name: 'results')
  List<Review>? reviews;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  ReviewsResponse({this.id, this.page, this.reviews, this.totalPages, this.totalResults});

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) => _$ReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);
}

@JsonSerializable()
class Review {
  String? author;
  @JsonKey(name: 'author_details')
  AuthorDetails? authorDetails;
  String? content;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? id;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  String? url;

  Review({this.author, this.authorDetails, this.content, this.createdAt, this.id, this.updatedAt, this.url});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class AuthorDetails {
  String? name;
  String? username;
  @JsonKey(name: 'avatar_path')
  String? avatarPath;
  double? rating;

  AuthorDetails({this.name, this.username, this.avatarPath, this.rating});

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
