// ignore_for_file: constant_identifier_names

import 'package:chatdrop/utility/tkdicons.dart';
import 'package:on_audio_query/on_audio_query.dart';

enum ButtonState {
  paused,
  playing,
  loading,
}

enum LoopState {
  off,
  all,
  one,
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

final Map songSortTypes = {
  0: SongSortType.DISPLAY_NAME,
  1: SongSortType.DATE_ADDED,
  2: SongSortType.ALBUM,
  3: SongSortType.ARTIST,
  4: SongSortType.DURATION,
  5: SongSortType.SIZE,
};

final Map songOrderTypes = {
  0: OrderType.ASC_OR_SMALLER,
  1: OrderType.DESC_OR_GREATER,
};

final Map artWorkType = {
  0: ArtworkType.AUDIO,
  1: ArtworkType.ALBUM,
  2: ArtworkType.PLAYLIST,
  3: ArtworkType.ARTIST,
  4: ArtworkType.GENRE,
};

final Map defaultartWorkIconType = {
  0: Tkdicons.musicNoteWave,
  1: Tkdicons.musicAlbum,
  2: Tkdicons.playlistFill,
  3: Tkdicons.artist,
  4: Tkdicons.musicGenreOutline,
};
