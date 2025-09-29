import 'package:equatable/equatable.dart';

class To extends Equatable {
	final int? day;
	final int? month;
	final int? year;

	const To({this.day, this.month, this.year});

	factory To.fromJson(Map<String, dynamic> json) => To(
				day: json['day'] as int?,
				month: json['month'] as int?,
				year: json['year'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'day': day,
				'month': month,
				'year': year,
			};

	@override
	List<Object?> get props => [day, month, year];
}
