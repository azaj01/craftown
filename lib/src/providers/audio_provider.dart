import 'package:craftown/src/constants.dart';
import 'package:craftown/src/utils/randomization.dart';
import 'package:flame_audio/audio_pool.dart';
import "package:flame_audio/flame_audio.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_provider.g.dart';

enum AudioAsset {
  blip1("blip1.wav"),
  blip2("blip2.wav"),
  blip3("blip3.wav"),
  blip4("blip4.wav"),
  chop("chop.wav"),
  pickaxe("pickaxe.wav"),
  ;

  final String assetName;
  const AudioAsset(this.assetName);
}

@Riverpod(keepAlive: true)
class AudioNotifier extends _$AudioNotifier {
  // late final AudioPool chopAudioPool;
  // late final AudioPool pickaxeAudioPool;

  @override
  double build() {
    _init();
    return 1.0;
  }

  Future<void> _init() async {
    // chopAudioPool = await FlameAudio.createPool(
    //   AudioAsset.chop.assetName,
    //   minPlayers: 2,
    //   maxPlayers: 4,
    // );
    // pickaxeAudioPool = await FlameAudio.createPool(
    //   AudioAsset.pickaxe.assetName,
    //   minPlayers: 2,
    //   maxPlayers: 4,
    // );

    // for (final a in AudioAsset.values) {
    //   play(a);
    // }

    _loadMusic();
  }

  void setVolume(double volume) {
    state = volume;
  }

  void play(AudioAsset asset, [double? volume]) {
    if (!PLAY_AUDIO) return;

    // switch (asset) {
    //   case AudioAsset.chop:
    //     chopAudioPool.start(volume: volume ?? state);
    //     return;
    //   case AudioAsset.pickaxe:
    //     pickaxeAudioPool.start(volume: volume ?? state);
    //     return;
    //   default:
    //     break;
    // }

    FlameAudio.play(asset.assetName, volume: volume ?? state);
  }

  void _loadMusic() {
    // print("TEST");
    // FlameAudio.bgm.play('music/Lost in the Dessert.mp3');
  }

  void playRandomBlip() {
    final blip = randomItemInList([
      AudioAsset.blip1,
      // AudioAsset.blip2,
      // AudioAsset.blip3,
      AudioAsset.blip4,
    ]);

    play(blip, 0.25);
  }
}