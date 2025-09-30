import 'package:equatable/equatable.dart';

class Webp extends Equatable {
	final String? imageUrl;
	final String? smallImageUrl;

	const Webp({this.imageUrl, this.smallImageUrl});

	factory Webp.fromJson(Map<String, dynamic> json) => Webp(
				imageUrl: json['image_url'] as String?,
				smallImageUrl: json['small_image_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'image_url': imageUrl,
				'small_image_url': smallImageUrl,
			};

	@override
	List<Object?> get props => [imageUrl, smallImageUrl];
}
