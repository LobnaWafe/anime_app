import 'package:equatable/equatable.dart';

class Demographic extends Equatable {
	final int? malId;
	final String? type;
	final String? name;
	final String? url;

	const Demographic({this.malId, this.type, this.name, this.url});

	factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
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
