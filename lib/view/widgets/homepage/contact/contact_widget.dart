import 'package:flutter/material.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        //padding for only in right side
        padding: const EdgeInsets.only(right: 20),
        
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONTACT US vertical bar
            Container(
              width: 30,
              color: Colors.cyan,
              child: const RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Text(
                    'CONTACT US',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                      
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Form Fields
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInputField('Name*'),
                    _buildInputField('E-Mail*'),
                    _buildInputField('Mobile*'),
                    _buildInputField(
                      'Share Your Requirement!*',
                      maxLines: 3,
                      italic: true,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton.icon(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {},
                        //icon: const Icon(Icons.arrow_circle_right_sharp, color: Colors.black),
                        label: const Text(
                          "REQUEST A QUOTE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildInputField(String label,
      {int maxLines = 1, bool italic = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white70,
            fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
