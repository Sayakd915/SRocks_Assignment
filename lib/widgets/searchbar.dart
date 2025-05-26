import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isListening;
  final VoidCallback onStartListening;
  final VoidCallback onStopListening;

  const SearchBar({
    required this.controller,
    required this.focusNode,
    required this.isListening,
    required this.onStartListening,
    required this.onStopListening,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 12
      ),
      decoration: BoxDecoration(
        color: const Color(0xff2F2F39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Expanded(
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: 'Search "Punjabi Lyrics"',
                    hintStyle: TextStyle(
                        fontFamily: 'Syne', color: Color(0xff61616B), fontSize: 14),
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                );
              },
            ),
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.005),
          ),
          IconButton(
            onPressed: isListening ? onStopListening : onStartListening,
            icon: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}