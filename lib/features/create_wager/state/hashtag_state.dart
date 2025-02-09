import 'package:flutter_riverpod/flutter_riverpod.dart';

//----------------------------------------------- HASHTAG NOTIFIER ----------------------------------------------- //
class HashtagsNotifier extends StateNotifier<Set<String>> {
  HashtagsNotifier() : super({});

  void toggleHashtag(String hashtag) {
    if (state.contains(hashtag)) {
      state = Set.from(state)..remove(hashtag);
    } else {
      state = Set.from(state)..add(hashtag);
    }
  }

  void clearHashtags() {
    state = {};
  }
}

//----------------------------------------------- WAGER TITLE NOTIFIER ----------------------------------------------- //
class WagerTitleNotifier extends StateNotifier<String> {
  WagerTitleNotifier() : super('');

  void setTitle(String title) {
    state = title;
  }
}
