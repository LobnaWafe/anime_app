import 'package:equatable/equatable.dart';

class Theme extends Equatable {
	final int? malId;
	final String? type;
	final String? name;
	final String? url;

	const Theme({this.malId, this.type, this.name, this.url});

	factory Theme.fromJson(Map<String, dynamic> json) => Theme(
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
