import 'package:equatable/equatable.dart';

import 'prop.dart';

class Aired extends Equatable {
	final String? from;
	final String? to;
	final Prop? prop;
	final String? string;

	const Aired({this.from, this.to, this.prop, this.string});

	factory Aired.fromJson(Map<String, dynamic> json) => Aired(
				from: json['from'] as String?,
				to: json['to'] as String?,
				prop: json['prop'] == null
						? null
						: Prop.fromJson(json['prop'] as Map<String, dynamic>),
				string: json['string'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'from': from,
				'to': to,
				'prop': prop?.toJson(),
				'string': string,
			};

	@override
	List<Object?> get props => [from, to, prop, string];
}
