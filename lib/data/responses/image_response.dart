class ImageResponse {
  final String id;
  final String url;

  ImageResponse({
    required this.id,
    required this.url,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
