import 'package:tts/tkk.dart';
import 'package:tts/tts.dart';

void main(List<String> arguments) async {
  String text = '''
Demand for AI via consumer mobile apps has been climbing, with market leader OpenAI’s ChatGPT mobile app topping half a million downloads in its first six days. Now, another AI app is touting its own launch success, as the a16z-backed Character.AI app is claiming to have pulled in over 1.7 million new installs in less than a week on the market. The AI app maker, which announced a whopping \$150 million in Series A funding earlier this year, valuing its business at \$1 billion, offers customizable AI companions with distinct personalities, as well as the ability for users to create their own characters.

While there are a number of these AI character generators available on today’s app stores, interest in Character.AI has a lot to do with its founders. The Palo Alto–based startup was created by Noam Shazeer and Daniel De Freitas, AI experts who previously led a team of researchers at Google that built LaMDA (Language Model for Dialogue Applications), a language model that helps power conversational AI experiences.

At Google, the founders had become frustrated with the company’s hesitancy to roll out AI chatbots to other researchers and the general public, including through integrations with other Google products, like Assistant, The Wall Street Journal reported. Believing AI would revolutionize search and other areas, the duo ultimately decided to leave Google in late 2021, despite pleas from CEO Sundar Pichai to stay and continue their work on LaMDA. That same November, Shazeer and De Freitas founded Character Technologies, now home to Character.AI.

The mobile version of the AI chatbot platform launched globally to iOS and Android users on May 23, where it had a strong showing on Google Play in particular. Within the first 48 hours, the app saw more than 700,000 Android installs, putting it ahead of top entertainment apps like Netflix, Disney+, and Prime Video, for example. That trend is continuing in the days following the launch, the company confirmed to TechCrunch, thanks to installs in large Android markets like Indonesia, the Philippines, and Brazil. The U.S. is also a leading market for Android downloads, the company said.


Image Credits: Character.AI


Interest in the mobile app was also heightened by the popularity of the web experience that preceded it. Ahead of the app’s launch, the Character.AI web app was topping 200 million visits per month, Character.AI claims, and users were spending on average 29 minutes per visit — a figure the company says eclipses ChatGPT by 300%.

In addition, Character.AI reports that users quickly become engaged after first use. For instance, the company noted this month that once users send their first message to a character, their engagement rates jump to more than 2 hours average time on platform. To date, users have created over 10 million custom AI characters, the company added.

The team, still just 30 people, has been particularly busy this month, having launched its premium service c.ai+, which offers a similar set of perks as ChatGPT Plus, like faster response times, access during peak periods of usage, and early access to new features. It also announced a strategic partnership with Google Cloud for building and training its AI models. The deal will see the startup using Google Cloud’s Tensor Processor Units to train and infer LLMs (large language models) faster and more efficiently, it said.

While some startups massage their reported download figures to make them sound better than they are, it seems Character.AI’s numbers are likely accurate. We asked third-party app intelligence provider data.ai to compare Character.AI’s numbers with their own estimates and data.ai came back with figures that actually showed the apps had a higher number of downloads. (The apps are so new, third-party estimates may not be accurate at this time — but, if anything, these third-party metrics do confirm there is initial consumer demand.)

However, while ChatGPT has demonstrated staying power following its launch — it’s still No. 3 today on the top free apps chart in the U.S. — Character.AI demand seems to have declined slightly post-launch. As of the time of writing, the iOS app is charting at No. 13 in the U.S. App Store’s Entertainment category. On U.S. iOS, the app was No. 4 overall for its first two days, but declined since to a rank of No. 89 overall. On U.S. Android, it reached No. 5 on May 27 but dropped to No. 27 as of today, data.ai told us.

Asked if Character.AI was blowing some of its huge chunk of change on marketing spend to generate its initial installs, the company claims that was not the case. The app launched without a dedicated marketing budget and 99% of its downloads were organic, the startup said.
''';
  // print(text.splitSentence(100).join('\n'));

  String text2 = '''
In addition, Character.AI reports that users quickly become engaged after first use. For instance, the company noted this month that once users send their first message to a character, their engagement rates jump to more than 2 hours average time on platform. To date, users have created over 10 million custom AI characters, the company added.
''';
  print(text.splitSentence(200).join(' * \n'));
  var value = await TKK.value;
  print('abc ${value}');
}
