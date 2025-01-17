import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;

  const LoginTextField({super.key, required this.controller});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "User name cant be Empty";
        }
        return null;
      },
      decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 300),
          hintText: "Enter username to start chat!",
          hintFadeDuration: const Duration(milliseconds: 300),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

class ChatMessageTextField extends StatefulWidget {
  final VoidCallback onSendMessage;
  final TextEditingController controller;

  const ChatMessageTextField({super.key, required this.onSendMessage, required this.controller});

  @override
  State<ChatMessageTextField> createState() => _ChatMessageTextFieldState();
}

class _ChatMessageTextFieldState extends State<ChatMessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade800),
                    controller: widget.controller,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        constraints: const BoxConstraints(
                          maxHeight: 40,
                        ),
                        fillColor: Colors.black12,
                        filled: true,
                        hintText: 'Message',
                        hintStyle: TextStyle(color: Colors.grey.shade800),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)))),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                  onTap: widget.onSendMessage,
                  child: const Icon(
                    Icons.send,
                    size: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
