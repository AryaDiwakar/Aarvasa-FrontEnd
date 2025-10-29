import 'package:flutter/material.dart';

class LanguageSelectionModal extends StatefulWidget {
  const LanguageSelectionModal({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionModal> createState() => _LanguageSelectionModalState();
}

class _LanguageSelectionModalState extends State<LanguageSelectionModal> {
  String selectedLanguage = "English";

  final List<String> languages = ["English", "Hindi", "Tamil"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.expand_more, size: 30, color: Colors.black54),
          const SizedBox(height: 10),
          const Text(
            "Change Language",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            children: languages.map((lang) {
              final isSelected = selectedLanguage == lang;
              return ChoiceChip(
                label: Text(lang),
                selected: isSelected,
                onSelected: (_) => setState(() => selectedLanguage = lang),
                selectedColor: const Color(0xFFECBFD9),
                backgroundColor: const Color(0xFFF3F3F3),
                labelStyle: TextStyle(
                  color: isSelected ? Color(0xFF5D0E41) : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
                side: BorderSide(
                  color: isSelected ? Color(0xFF5D0E41) : Colors.transparent,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Save selected language logic here
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5D0E41),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text("Save Changes"),
          ),
        ],
      ),
    );
  }
}
