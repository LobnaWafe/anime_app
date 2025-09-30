import 'package:equatable/equatable.dart';

class Jpg extends Equatable {
	final String? imageUrl;

	const Jpg({this.imageUrl});

	factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
				imageUrl: json['image_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'image_url': imageUrl,
			};

	@override
	List<Object?> get props => [imageUrl];
}
