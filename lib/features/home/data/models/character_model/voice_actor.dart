import 'package:equatable/equatable.dart';

import 'person.dart';

class VoiceActor extends Equatable {
	final Person? person;
	final String? language;

	const VoiceActor({this.person, this.language});

	factory VoiceActor.fromJson(Map<String, dynamic> json) => VoiceActor(
				person: json['person'] == null
						? null
						: Person.fromJson(json['person'] as Map<String, dynamic>),
				language: json['language'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'person': person?.toJson(),
				'language': language,
			};

	@override
	List<Object?> get props => [person, language];
}
