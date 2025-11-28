import 'package:dio/dio.dart';
import 'package:fitness_app_project/secrets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiCoachPage extends StatefulWidget {
  const AiCoachPage({super.key});

  @override
  State<AiCoachPage> createState() => _AiCoachPageState();
}

class _AiCoachPageState extends State<AiCoachPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> messages = [
    {
      "sender": "ai",
      "text":
          "Hey! I'm your AI Fitness Coach. Ask me anything — cutting, bulking, calories, meals, workouts!",
    },
  ];

  void sendMessage() {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": userMessage});
      _controller.clear();
    });

    scrollToBottom();
    generateAiResponse(userMessage);
  }

  Future<void> generateAiResponse(String userMessage) async {
    setState(() {
      messages.add({"sender": "ai", "text": "Typing..."});
    });

    final dio = Dio();

    try {
      final response = await dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$geminiApiKey",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: {
          "contents": [
            {
              "parts": [
                {"text": "You are an AI fitness coach. $userMessage"},
              ],
            },
          ],
        },
      );

      final aiText =
          response.data["candidates"][0]["content"]["parts"][0]["text"];

      setState(() {
        messages.removeLast();
        messages.add({"sender": "ai", "text": aiText});
      });
    } catch (e) {
      print("ERROR: $e");
      setState(() {
        messages.removeLast();
        messages.add({"sender": "ai", "text": "AI Error: $e"});
      });
    }

    scrollToBottom();
  }

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 200), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "AI Fitness Coach",
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUser = messages[index]["sender"] == "user";

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(maxWidth: 280),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.pinkAccent
                          : Colors.pinkAccent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      messages[index]["text"]!,
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: GoogleFonts.jetBrainsMono(),
                    decoration: InputDecoration(
                      hintText: "Ask anything about food, calories, cutting...",
                      hintStyle: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
