import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

class RandomGifs extends StatefulWidget {
  @override
  State<RandomGifs> createState() => _RandomGifsState();
}

class _RandomGifsState extends State<RandomGifs> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gif?.title ?? 'Giphy Picker Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? const Text('Pick a gif..')
              : GiphyImage.original(gif: _gif!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.search),
        onPressed: () async {
          final gif = await GiphyPicker.pickGif(
            context: context,
            apiKey: 'ENTER YOUR API KEY',
            fullScreenDialog: false,
            previewType: GiphyPreviewType.previewWebp,
            decorator: GiphyDecorator(
              showAppBar: false,
              searchElevation: 4,
              giphyTheme: ThemeData.dark().copyWith(
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          );

          if (gif != null) {
            setState(() => _gif = gif);
          }
        },
      ),
    );
  }
}
