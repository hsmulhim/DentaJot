import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

String ResponseGTP = '';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  GptScreenState createState() => GptScreenState();
}

class GptScreenState extends State<GptScreen> {
  Future<void> sendMessage(String message) async {
    const String apiKey = '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';

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are an excellent dentist. You can answer all dental questions in short answers. As a dentist, the user will send you some of the problems.'
          },
          {'role': 'user', 'content': message}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      ResponseGTP = responseData['choices'][0]['message']['content'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Take some preparation from GPT Dr',
              ),
              ElevatedButton(
                onPressed: () => sendMessage('I have pain in my tooth'),
                child: const Text('Pain in my tooth'),
              ),
              ElevatedButton(
                onPressed: () =>
                    sendMessage('How can I brush my teeth properly?'),
                child: const Text('Brushing teeth'),
              ),
              const SizedBox(height: 20),
              const Text(
                ' Response:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  ResponseGTP,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
