class NumberTrivia {
  String text;
  int number;

  NumberTrivia({required this.text, required this.number});

  factory NumberTrivia.fromJson(Map<String, dynamic> json) => NumberTrivia(
        text: json['text'],
        number: num.parse(json['number']).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'number': number,
      };
}
