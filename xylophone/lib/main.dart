import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF111827),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF63E6BE),
          brightness: Brightness.dark,
        ),
      ),
      home: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final AudioPlayer _player = AudioPlayer();

  static const List<Color> _noteColors = [
    Color(0xFFFF6B6B),
    Color(0xFFFF922B),
    Color(0xFFFFC857),
    Color(0xFF51CF66),
    Color(0xFF20C997),
    Color(0xFF339AF0),
    Color(0xFF9775FA),
  ];

  static const List<String> _noteNames = [
    'DO',
    'RE',
    'MI',
    'FA',
    'SOL',
    'LA',
    'SI',
  ];

  Future<void> _playNote(int noteNumber) async {
    await _player.play(AssetSource('note$noteNumber.wav'));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 19),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(
                      Icons.music_note_rounded,
                      color: Color(0xFF63E6BE),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'XYLOPHONE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.8,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tap a bar and play a tune',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.graphic_eq_rounded,
                    color: Color(0xFF63E6BE),
                    size: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                itemCount: _noteColors.length,
                separatorBuilder: (context, index) => const SizedBox(height: 9),
                itemBuilder: (context, index) {
                  final noteNumber = index + 1;
                  return _NoteBar(
                    number: noteNumber,
                    name: _noteNames[index],
                    color: _noteColors[index],
                    onPressed: () => _playNote(noteNumber),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoteBar extends StatelessWidget {
  const _NoteBar({
    required this.number,
    required this.name,
    required this.color,
    required this.onPressed,
  });

  final int number;
  final String name;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(18),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: Color(0xFF18212C),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF18212C),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.play_arrow_rounded,
                  color: const Color(0xFF18212C).withValues(alpha: 0.7),
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
