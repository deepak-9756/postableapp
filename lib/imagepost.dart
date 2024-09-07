import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({super.key});

  @override
  State<ImagePost> createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  final String imageUrl =
      "https://imgs.search.brave.com/BPGrWvO060L673OTMfNekwVsAY6vn2zEwVvfwghv0dg/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9idWZm/ZXIuY29tL2Nkbi1j/Z2kvaW1hZ2Uvdz03/MDAwLGZpdD1jb250/YWluLHE9OTAsZj1h/dXRvL2xpYnJhcnkv/Y29udGVudC9pbWFn/ZXMvMjAyNC8wMy9n/ZXR0eS1pbWFnZXMt/bGwzejBtV0pEaXct/dW5zcGxhc2guanBn";

  final String shareUrl =
      "https://super-hamster-cf491e.netlify.app/?code=image";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.error, size: 50, color: Colors.red),
                ),
              ),
            ),

            // Image description
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sample Image Post",
              ),
            ),

            // Share button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Share this image"),
                  IconButton(
                    onPressed: () {
                      Share.share(shareUrl);
                    },
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
