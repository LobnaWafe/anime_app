import 'package:equatable/equatable.dart';

class Licensor extends Equatable {
	final int? malId;
	final String? type;
	final String? name;
	final String? url;

	const Licensor({this.malId, this.type, this.name, this.url});

	factory Licensor.fromJson(Map<String, dynamic> json) => Licensor(
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
