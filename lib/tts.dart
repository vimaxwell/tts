extension StringSplitter on String {
  List<String> splitSentence(int maxSentenceLength) {
    if (isEmpty) {
      return [];
    }
    List<String> list = [];
    String replacedText = replaceAll(RegExp(r'[ \u3000\n\r\t\s]+'), ' ');
    List<String> sentences = replacedText.splitByPunctuation();
    var sentenceBuffer = StringBuffer();
    for (var sentence in sentences) {
      var merged = (sentenceBuffer.toString() + sentence).trim();
      if (merged.length <= maxSentenceLength) {
        sentenceBuffer.write(sentence.toString());
      } else {
        if (sentenceBuffer.isNotEmpty) {
          list.add(sentenceBuffer.toString());
          sentenceBuffer.clear();
        }

        if (sentence.length <= maxSentenceLength) {
          sentenceBuffer.write(sentence.toString());
        } else {
          list.addAll(sentence.splitSentenceBySpace(maxSentenceLength));
        }
      }
    }

    if (sentenceBuffer.isNotEmpty) {
      list.add(sentenceBuffer.toString());
    }
    return list;
  }

  List<String> splitSentenceBySpace(int maxSentenceLength) {
    List<String> result = [];

    RegExp pattern = RegExp('.{1,$maxSentenceLength}(\\s+|\$)');
    Iterable<Match> matches = pattern.allMatches(this);

    for (Match match in matches) {
      result.add(match.group(0)!);
    }

    return result;
  }

  List<String> splitByPunctuation() {
    // return split(RegExp("([?.,;:!]( +))|([、。！（），．：；？][ 　]?)"));
    return split(RegExp("([?.;:!]( +))|([、。！（），．：；？][ 　]?)"));
  }
}
