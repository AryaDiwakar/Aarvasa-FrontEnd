import 'package:flutter/material.dart';

class FaqCard extends StatelessWidget {
  final String question;

  const FaqCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.question_answer_outlined, color: Color(0xFF7E1846)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(question,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
