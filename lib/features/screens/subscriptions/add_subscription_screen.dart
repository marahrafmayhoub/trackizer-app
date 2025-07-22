import 'package:flutter/material.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer_ui/core/widgets/header.dart';
// import 'package:trackizer_ui/screens/login_screen.dart' hide AppColors;

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  double monthlyPrice = 5.99;
  final TextEditingController descriptionController = TextEditingController();

  void increasePrice() => setState(() => monthlyPrice += 1.0);
  void decreasePrice() => setState(() {
    if (monthlyPrice > 0) monthlyPrice -= 1.0;
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.myBlack,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    // HeaderWithIcons(text: 'New',icons: [HeaderIcon(assetPath: 'assetPath', alignment: alignment)],)
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: AppColors.myGrey,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'New',
                          style: TextStyle(
                            color: AppColors.myGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Add new',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'subscription',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/One_drive.png',
                          ),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              buildLogoBox(
                                'assets/images/hbo_go_logo.png',
                                screenWidth,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'HGBO GO',
                                style: TextStyle(
                                  color: AppColors.myWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          buildLogoBox(
                            'assets/images/spotify.png',
                            screenWidth,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Description",
                    style: TextStyle(color: AppColors.myGrey),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: AppColors.myBackground),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 28, 28, 33),
                    contentPadding: const EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.myGrey,
                        width: 0.4,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildPriceButton(Icons.remove, decreasePrice),
                    Column(
                      children: [
                        const Text(
                          "Monthly price",
                          style: TextStyle(color: AppColors.myGrey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${monthlyPrice.toStringAsFixed(2)} SP',
                          style: const TextStyle(
                            fontSize: 26,
                            color: AppColors.myWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    buildPriceButton(Icons.add, increasePrice),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Add this platform",
                    onPressed: () {
                      print(
                        'Added: ${descriptionController.text} | $monthlyPrice SP',
                      );
                    }
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoBox(String path, double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        path,
        width: screenWidth * 0.2,
        height: screenWidth * 0.2,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildPriceButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.myBlack,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.myGrey, size: 30),
        onPressed: onPressed,
      ),
    );
  }
}
