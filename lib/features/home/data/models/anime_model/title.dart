import 'package:equatable/equatable.dart';

class Title extends Equatable {
	final String? type;
	final String? title;

	const Title({this.type, this.title});

	factory Title.fromJson(Map<String, dynamic> json) => Title(
				type: json['type'] as String?,
				title: json['title'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'title': title,
			};

	@override
	List<Object?> get props => [type, title];
}
