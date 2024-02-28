import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fos_scraper/actions/set_info_message_action.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Scraper {
  final String link;
  final dynamic store;

  Scraper({
    required this.link,
    required this.store,
  });

  Future<String> createDownloadFolder(String filename) async {
    var extDir = await getExternalStorageDirectory() as Directory;

    String folderPath = '${extDir.path}/${store.state.keyWord}';

    await Directory(folderPath).create();

    return '$folderPath/$filename';
  }

  void downloadFile(var url, var filepath) async {
    var dio = Dio();
    await dio.download(url, filepath);
  }

  Future<void> getData() async {
    var url = Uri.parse(link);
    var response = await http.get(url);

    var document = html.parse(response.body);
    var resultsElement =
        document.querySelector('#decision_results > div > div > div > p');
    int numberOfResults = int.parse(resultsElement!.text.split(' ')[3]);
    store.dispatch(
        SetInfoMessageAction(infoMessage: 'Found $numberOfResults results'));
    int totalPages = (numberOfResults / 10).ceil();
    int pageID = 0;
    int currentDownload = 1;
    for (var i = 0; i < totalPages; i++) {
      var pageNumber = pageID == 0 ? 0 : pageID / 10;
      var pageResponse = await http.get(Uri.parse('$link&Start=$pageID'));
      var doc = html.parse(pageResponse.body);
      var pdfLinks = doc.querySelectorAll('.search-result');
      for (var pdfLinkElement in pdfLinks) {
        var pdfLink = pdfLinkElement.attributes['href'];
        String downloadLink = 'https://www.financial-ombudsman.org.uk/$pdfLink';
        store.dispatch(SetInfoMessageAction(
            infoMessage:
                'Scraping page number ${pageNumber.toInt() + 1}. Downloading $currentDownload/$numberOfResults...'));

        currentDownload++;
      }

      pageID += 10;
    }
  }
}
