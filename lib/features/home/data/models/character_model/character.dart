import 'package:equatable/equatable.dart';

import 'images.dart';

class Character extends Equatable {
	final int? malId;
	final String? url;
	final Images? images;
	final String? name;

	const Character({this.malId, this.url, this.images, this.name});

	factory Character.fromJson(Map<String, dynamic> json) => Character(
				malId: json['mal_id'] as int?,
				url: json['url'] as String?,
				images: json['images'] == null
						? null
						: Images.fromJson(json['images'] as Map<String, dynamic>),
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'mal_id': malId,
				'url': url,
				'images': images?.toJson(),
				'name': name,
			};

	@override
	List<Object?> get props => [malId, url, images, name];
}
