import 'package:flutter/material.dart';

import 'add_tools_screen.dart';
import 'community_store.dart';
import 'contact_us.dart'; // استبدلنا ProductDetails بـ ContactUSScreen
import 'home_stu.dart';

class CommunityFreeScreen extends StatefulWidget {
  const CommunityFreeScreen({super.key});

  @override
  _CommunityFreeScreenState createState() => _CommunityFreeScreenState();
}

class _CommunityFreeScreenState extends State<CommunityFreeScreen> {
  String selectedTab = "For Free";

  final List<Map<String, String>> freeProducts = [
    {
      "image": "images/img10.png",
      "title": "Dental Tool C",
      "price": "Free",
      "isNew": "true",
      "description": "Tool available for donation.",
      "brand": "Dental Co.",
    },
    {
      "image": "images/img11.png",
      "title": "Dental Brush X",
      "price": "Free",
      "isNew": "false",
      "description": "Gently used dental brush.",
      "brand": "BrushX",
    },
    {
      "image": "images/img12.png",
      "title": "Free Whitening Kit",
      "price": "Free",
      "isNew": "true",
      "description": "Giveaway whitening kit.",
      "brand": "Bright Smile",
    },
    {
      "image": "images/img13.png",
      "title": "Child Oral Kit",
      "price": "Free",
      "isNew": "false",
      "description": "For child dental care.",
      "brand": "KidDent",
    },
    {
      "image": "images/img14.png",
      "title": "Dental Set D",
      "price": "Free",
      "isNew": "false",
      "description": "Set includes mirror and pick.",
      "brand": "SetDent",
    },
    {
      "image": "images/img15.png",
      "title": "Oral Mirror",
      "price": "Free",
      "isNew": "true",
      "description": "Dental oral mirror available.",
      "brand": "DentView",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  buildStyledTab("All"),
                  buildStyledTab("For Free"),
                  buildStyledTab("Add your tools"),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: freeProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = freeProducts[index];
                  return GestureDetector(
                    onTap: () {
                      // غيرنا التنقل لشاشة ContactUSScreen بدل ProductDetails
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ContactUSScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product["image"]!,
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          Text(
                            product["price"]!,
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStyledTab(String label) {
    bool isSelected = selectedTab == label;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          if (label == "All") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const CommunityStore()),
            );
          } else if (label == "Add your tools") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddToolsScreen(
                  onAddProduct: (product) {
                    print("تمت إضافة المنتج: $product");
                  },
                ),
              ),
            );
          } else {
            setState(() {
              selectedTab = label;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1F5382) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF1F5382)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF1F5382),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}