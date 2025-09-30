import 'package:equatable/equatable.dart';

import 'character.dart';
import 'voice_actor.dart';

class CharacterModel extends Equatable {
	final Character? character;
	final String? role;
	final int? favorites;
	final List<VoiceActor>? voiceActors;

	const CharacterModel({
		this.character, 
		this.role, 
		this.favorites, 
		this.voiceActors, 
	});

	factory CharacterModel.fromJson(Map<String, dynamic> json) {
		return CharacterModel(
			character: json['character'] == null
						? null
						: Character.fromJson(json['character'] as Map<String, dynamic>),
			role: json['role'] as String?,
			favorites: json['favorites'] as int?,
			voiceActors: (json['voice_actors'] as List<dynamic>?)
						?.map((e) => VoiceActor.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'character': character?.toJson(),
				'role': role,
				'favorites': favorites,
				'voice_actors': voiceActors?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [character, role, favorites, voiceActors];
}
