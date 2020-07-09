class Question {
  String question;
  String answer1;
  String answer2;
  // String answer3;
  // String answer4;

  Question({
    this.question,
    this.answer1,
    this.answer2,
    // this.answer3,
    // this.answer4,
  });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer1': answer1,
      'answer2': answer2,
      // 'answer3': answer3,
      // 'answer4': answer4,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Question(
      question: map['question'],
      answer1: map['answer1'],
      answer2: map['answer2'],
      // answer3: map['answer3'],
      // answer4: map['answer4'],
    );
  }
}