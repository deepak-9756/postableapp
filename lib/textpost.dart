import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPost extends StatefulWidget {
  const TextPost({super.key});

  @override
  State<TextPost> createState() => _TextPostState();
}

class _TextPostState extends State<TextPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Title
              Text(
                "Exciting News!",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),

              // Post Description
              Text(
                "Check out this amazing content I want to share with you.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 16),

              // Action buttons (Share Button)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Shareable Text", style: TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {
                      Share.share(
                          "https://super-hamster-cf491e.netlify.app/?code=text");
                    },
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
