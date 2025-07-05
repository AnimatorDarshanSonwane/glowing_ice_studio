// lib/widgets/client_testimonial_section.dart

import 'package:flutter/material.dart';
import 'package:glowing_ice_studio/providers/testimonial_data.dart';
import 'package:provider/provider.dart';

class ClientTestimonialSection extends StatelessWidget {
  const ClientTestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: 'WHAT OUR ',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'CLIENTS SAY',
                style: TextStyle(
                  color: Color(0xFFFFA500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Consumer<TestimonialData>(
          builder: (BuildContext context, TestimonialData testimonialData, Widget? child) {
            final testimonial = testimonialData.currentTestimonial;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: testimonialData.previousTestimonial,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2125),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 180,
                          child: Image.network(
                            testimonial.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                testimonial.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                testimonial.author,
                                style: const TextStyle(
                                  color: Color(0xFF1ECBE1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                testimonial.designation,
                                style: const TextStyle(
                                  color: Color(0xFF1ECBE1),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: testimonialData.nextTestimonial,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
