import 'package:equatable/equatable.dart';

class Studio extends Equatable {
	final int? malId;
	final String? type;
	final String? name;
	final String? url;

	const Studio({this.malId, this.type, this.name, this.url});

	factory Studio.fromJson(Map<String, dynamic> json) => Studio(
				malId: json['mal_id'] as int?,
				type: json['type'] as String?,
				name: json['name'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'mal_id': malId,
				'type': type,
				'name': name,
				'url': url,
			};

	@override
	List<Object?> get props => [malId, type, name, url];
}
