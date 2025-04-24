import 'package:flutter/material.dart';
import 'product_details.dart';
import 'community_free_screen.dart'; // شاشة For Free
import 'add_tools_screen.dart'; // إضافة الشاشة الجديدة

class CommunityStore extends StatefulWidget {
  const CommunityStore({super.key});

  @override
  _CommunityStoreState createState() => _CommunityStoreState();
}

class _CommunityStoreState extends State<CommunityStore> {
  String selectedTab = "All";

  final List<Map<String, String>> products = [
    {
      "image": "images/img1.png",
      "title": "THE PACK - Kids U-Shaped",
      "price": "EGP170.00",
      "isNew": "true",
      "description": "For kids with fun colors and safe brushing.",
      "brand": "KIDS CARE",
    },
    {
      "image": "images/img2.png",
      "title": "Hismile Dental Whitening Strips",
      "price": "EGP3,550.00",
      "isNew": "true",
      "description": "Dental Whitening Strips for Sensitive Teeth.",
      "brand": "HISMILE",
    },
    {
      "image": "images/img3.png",
      "title": "Smart Clouds Rechargeable H2Ofloss Water",
      "price": "EGP3,489.00",
      "isNew": "true",
      "description": "Rechargeable water flosser for better oral hygiene.",
      "brand": "Smart Clouds",
    },
    {
      "image": "images/img4.png",
      "title": "Oral-B Precision Clean Toothbrush",
      "price": "EGP1,440.00",
      "isNew": "true",
      "description": "Effective deep clean toothbrush head.",
      "brand": "Oral-B",
    },
    {
      "image": "images/img5.png",
      "title": "Dental Tools Set A",
      "price": "EGP600.00",
      "isNew": "false",
      "description": "Complete dental tools kit A.",
      "brand": "Dental Co.",
    },
    {
      "image": "images/img6.png",
      "title": "Dental Tool B",
      "price": "EGP320.00",
      "isNew": "false",
      "description": "Simple and compact dental tool.",
      "brand": "Dental Co.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Color(0xFFDBDBDB)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Explore",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFBDBDBD),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xFFBDBDBD),
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  buildStyledTab("All"),
                  buildStyledTab("For Free"),
                  buildStyledTab("Add your tools"),
                ],
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ProductDetails(
                                image: product["image"]!,
                                title: product["title"]!,
                                price: product["price"]!,
                                description: product["description"] ?? '',
                                brand: product["brand"] ?? '',
                                isNew: product["isNew"] == "true",
                              ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (product["isNew"] == "true")
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                "New",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product["image"]!,
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            product["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
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
              SizedBox(height: 20),
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
          if (label == "For Free") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityFreeScreen()),
            );
          } else if (label == "Add your tools") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => AddToolsScreen(
                      onAddProduct: (product) {
                        setState(() {
                          products.add(product);
                        });
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1F5382) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF1F5382)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF1F5382),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
