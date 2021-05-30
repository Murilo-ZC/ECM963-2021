import 'package:app_analise_sentimento/components/emiji_widget.dart';

class Source {
  static getAzureHeader() => const <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Ocp-Apim-Subscription-Key": "af621e95313e4d4797c38c5cddb13d1b"
      };

  static getAzureUrl() =>
      "https://ecm963-analise-texto.cognitiveservices.azure.com/text/analytics/v3.0/sentiment";
  static getEmojiWidgetForSentiment(sentiment) {
    switch (sentiment) {
      case 'positive':
        return EmojiWidget("smile");
      case 'neutral':
        return EmojiWidget("neutral_face");
      case 'negative':
        return EmojiWidget("crying_cat_face");
      default:
        return EmojiWidget('thinking_face');
    }
  }
}
