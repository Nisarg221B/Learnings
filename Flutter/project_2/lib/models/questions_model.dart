class QuizQuestion {
  const QuizQuestion(this.text, this.options);

  final String text;
  final List<String> options;

  List<String> getShuffledAnswer() {
    final copyList = List.of(options);
    // of(options) -> creates a copy of options and then shuffle the copy and returns it
    // because we are planning to keep the first options in original option list as
    // the correct answer.
    copyList.shuffle(); // inplace
    return copyList;
  }
}
