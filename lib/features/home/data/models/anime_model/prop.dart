import 'package:equatable/equatable.dart';

import 'from.dart';
import 'to.dart';

class Prop extends Equatable {
	final From? from;
	final To? to;

	const Prop({this.from, this.to});

	factory Prop.fromJson(Map<String, dynamic> json) => Prop(
				from: json['from'] == null
						? null
						: From.fromJson(json['from'] as Map<String, dynamic>),
				to: json['to'] == null
						? null
						: To.fromJson(json['to'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'from': from?.toJson(),
				'to': to?.toJson(),
			};

	@override
	List<Object?> get props => [from, to];
}
