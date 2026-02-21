import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final status = controller.status;
        final progress = controller.progress;
        final size = controller.ressource.size;
        //Trailing icon when not yet downloaded, downloading, and downloaded, with & without press-able button
        final trailing = status == DownloadStatus.notDownloaded
            ? IconButton(
                icon: const Icon(Icons.download),
                onPressed: controller.startDownload,
              )
            : status == DownloadStatus.downloading
            ? const Icon(Icons.downloading_outlined)
            : const Icon(Icons.folder);

        return Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: Text(
              '${(progress * 100).toStringAsFixed(0)}% completed - ${(progress * size).toStringAsFixed(1)} MB of $size MB',
            ),
            trailing: trailing,
          ),
        );
      },
    );
  }
}
