import 'package:equatable/equatable.dart';

import 'aired.dart';
import 'broadcast.dart';
import 'demographic.dart';
import 'genre.dart';
import 'images.dart';
import 'licensor.dart';
import 'producer.dart';
import 'studio.dart';
import 'theme.dart';
import 'title.dart';
import 'trailer.dart';

class AnimeModel extends Equatable {
	final int? malId;
	final String? url;
	final Images? images;
	final Trailer? trailer;
	final bool? approved;
	final List<Title>? titles;
	final String? title;
	final String? titleEnglish;
	final String? titleJapanese;
	final List<String>? titleSynonyms;
	final String? type;
	final String? source;
	final int? episodes;
	final String? status;
	final bool? airing;
	final Aired? aired;
	final String? duration;
	final String? rating;
	final double? score;
	final int? scoredBy;
	final int? rank;
	final int? popularity;
	final int? members;
	final int? favorites;
	final String? synopsis;
	final String? background;
	final String? season;
	final int? year;
	final Broadcast? broadcast;
	final List<Producer>? producers;
	final List<Licensor>? licensors;
	final List<Studio>? studios;
	final List<Genre>? genres;
	final List<dynamic>? explicitGenres;
	final List<Theme>? themes;
	final List<Demographic>? demographics;

	const AnimeModel({
		this.malId, 
		this.url, 
		this.images, 
		this.trailer, 
		this.approved, 
		this.titles, 
		this.title, 
		this.titleEnglish, 
		this.titleJapanese, 
		this.titleSynonyms, 
		this.type, 
		this.source, 
		this.episodes, 
		this.status, 
		this.airing, 
		this.aired, 
		this.duration, 
		this.rating, 
		this.score, 
		this.scoredBy, 
		this.rank, 
		this.popularity, 
		this.members, 
		this.favorites, 
		this.synopsis, 
		this.background, 
		this.season, 
		this.year, 
		this.broadcast, 
		this.producers, 
		this.licensors, 
		this.studios, 
		this.genres, 
		this.explicitGenres, 
		this.themes, 
		this.demographics, 
	});

	factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
				malId: json['mal_id'] as int?,
				url: json['url'] as String?,
				images: json['images'] == null
						? null
						: Images.fromJson(json['images'] as Map<String, dynamic>),
				trailer: json['trailer'] == null
						? null
						: Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
				approved: json['approved'] as bool?,
				titles: (json['titles'] as List<dynamic>?)
						?.map((e) => Title.fromJson(e as Map<String, dynamic>))
						.toList(),
				title: json['title'] as String?,
				titleEnglish: json['title_english'] as String?,
				titleJapanese: json['title_japanese'] as String?,
				titleSynonyms: json['title_synonyms'] as List<String>?,
				type: json['type'] as String?,
				source: json['source'] as String?,
				episodes: json['episodes'] as int?,
				status: json['status'] as String?,
				airing: json['airing'] as bool?,
				aired: json['aired'] == null
						? null
						: Aired.fromJson(json['aired'] as Map<String, dynamic>),
				duration: json['duration'] as String?,
				rating: json['rating'] as String?,
				score: (json['score'] as num?)?.toDouble(),
				scoredBy: json['scored_by'] as int?,
				rank: json['rank'] as int?,
				popularity: json['popularity'] as int?,
				members: json['members'] as int?,
				favorites: json['favorites'] as int?,
				synopsis: json['synopsis'] as String?,
				background: json['background'] as String?,
				season: json['season'] as String?,
				year: json['year'] as int?,
				broadcast: json['broadcast'] == null
						? null
						: Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
				producers: (json['producers'] as List<dynamic>?)
						?.map((e) => Producer.fromJson(e as Map<String, dynamic>))
						.toList(),
				licensors: (json['licensors'] as List<dynamic>?)
						?.map((e) => Licensor.fromJson(e as Map<String, dynamic>))
						.toList(),
				studios: (json['studios'] as List<dynamic>?)
						?.map((e) => Studio.fromJson(e as Map<String, dynamic>))
						.toList(),
				genres: (json['genres'] as List<dynamic>?)
						?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
						.toList(),
				explicitGenres: json['explicit_genres'] as List<dynamic>?,
				themes: (json['themes'] as List<dynamic>?)
						?.map((e) => Theme.fromJson(e as Map<String, dynamic>))
						.toList(),
				demographics: (json['demographics'] as List<dynamic>?)
						?.map((e) => Demographic.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'mal_id': malId,
				'url': url,
				'images': images?.toJson(),
				'trailer': trailer?.toJson(),
				'approved': approved,
				'titles': titles?.map((e) => e.toJson()).toList(),
				'title': title,
				'title_english': titleEnglish,
				'title_japanese': titleJapanese,
				'title_synonyms': titleSynonyms,
				'type': type,
				'source': source,
				'episodes': episodes,
				'status': status,
				'airing': airing,
				'aired': aired?.toJson(),
				'duration': duration,
				'rating': rating,
				'score': score,
				'scored_by': scoredBy,
				'rank': rank,
				'popularity': popularity,
				'members': members,
				'favorites': favorites,
				'synopsis': synopsis,
				'background': background,
				'season': season,
				'year': year,
				'broadcast': broadcast?.toJson(),
				'producers': producers?.map((e) => e.toJson()).toList(),
				'licensors': licensors?.map((e) => e.toJson()).toList(),
				'studios': studios?.map((e) => e.toJson()).toList(),
				'genres': genres?.map((e) => e.toJson()).toList(),
				'explicit_genres': explicitGenres,
				'themes': themes?.map((e) => e.toJson()).toList(),
				'demographics': demographics?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				malId,
				url,
				images,
				trailer,
				approved,
				titles,
				title,
				titleEnglish,
				titleJapanese,
				titleSynonyms,
				type,
				source,
				episodes,
				status,
				airing,
				aired,
				duration,
				rating,
				score,
				scoredBy,
				rank,
				popularity,
				members,
				favorites,
				synopsis,
				background,
				season,
				year,
				broadcast,
				producers,
				licensors,
				studios,
				genres,
				explicitGenres,
				themes,
				demographics,
		];
	}
}
