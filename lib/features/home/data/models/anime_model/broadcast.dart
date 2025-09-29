import 'package:equatable/equatable.dart';

class Broadcast extends Equatable {
	final String? day;
	final String? time;
	final String? timezone;
	final String? string;

	const Broadcast({this.day, this.time, this.timezone, this.string});

	factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
				day: json['day'] as String?,
				time: json['time'] as String?,
				timezone: json['timezone'] as String?,
				string: json['string'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'day': day,
				'time': time,
				'timezone': timezone,
				'string': string,
			};

	@override
	List<Object?> get props => [day, time, timezone, string];
}
