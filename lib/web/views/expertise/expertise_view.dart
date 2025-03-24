import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/all_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/platform/mobile_expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/platform/web_expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExpertiseView extends StatefulWidget {
  const ExpertiseView({super.key});

  @override
  State<ExpertiseView> createState() => _ExpertiseViewState();
}

class _ExpertiseViewState extends State<ExpertiseView> {
  final List<String> expertiseList = <String>[
    AppText.expertiseText1l,
    AppText.expertiseText1r,
    AppText.expertiseText2l,
    AppText.expertiseText2r,
    AppText.expertiseText3l,
    AppText.expertiseText3r,
    AppText.expertiseText4l,
    AppText.expertiseText4r,
    AppText.expertiseText5l,
    AppText.expertiseText5r,
  ];

  final List<String> pianoNotes =
      <String>[
        SoundAssets.gb4,
        SoundAssets.c4,
        SoundAssets.d4,
        SoundAssets.e4,
        SoundAssets.f4,
        SoundAssets.g4,
        SoundAssets.bb4,
        SoundAssets.a4,
        SoundAssets.db4,
        SoundAssets.eb4,
      ].reversed.toList();

  late final List<AudioPlayer> audioPlayers = List<AudioPlayer>.generate(
    pianoNotes.length,
    (final int i) {
      final AudioPlayer audio = AudioPlayer();

      final String note = pianoNotes[i];

      audio.setAudioSource(AudioSource.uri(Uri.parse(note)));

      return audio;
    },
  );

  Future<void> playNote(final int index) async {
    final AudioPlayer audioPlayer = audioPlayers[index];

    unawaited(audioPlayer.seek(Duration.zero).then((_) => audioPlayer.play()));
  }

  @override
  void dispose() {
    audioPlayers.map((final AudioPlayer e) => unawaited(e.dispose()));
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background2),
          fit: BoxFit.cover,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: MobileExpertiseView(expertiseList, pianoNotes, playNote),
        tablet: const RestrictView(withBg: false),
        web: WebExpertiseView(expertiseList, pianoNotes, playNote),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('expertiseList', expertiseList))
      ..add(IterableProperty<String>('pianoNotes', pianoNotes))
      ..add(IterableProperty<AudioPlayer>('audioPlayers', audioPlayers));
  }
}
