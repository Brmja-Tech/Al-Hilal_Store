import 'package:alhilal_store/core/constants/assets.dart';
import 'package:alhilal_store/core/widget/section_header.dart';
import 'package:alhilal_store/features/product_details/presentation/view/widgets/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/custom_buttons.dart';
import '../widgets/color_dot.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color? _selectedColor;
  String _selectedSize = '';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Center(
                child: Image.asset(
                  Assets.assetsImgsDialogPlayer, // Replace with your image URL
                  height: 0.4 * h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'AlHilal Jersey – 2024 – Blue (KIDS)',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SectionHeader(
                text: 'Description',
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ullamcorper in non at egestas metus auctor ultricies.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              SectionHeader(text: 'Size:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizeButton(
                    size: 'XS',
                    isSelected: _selectedSize == 'XS',
                    onTap: () {
                      _updateSelectedSize('XS');
                    },
                  ),
                  SizeButton(
                    size: 'S',
                    isSelected: _selectedSize == 'S',
                    onTap: () {
                      _updateSelectedSize('S');
                    },
                  ),
                  SizeButton(
                    size: 'M',
                    isSelected: _selectedSize == 'M',
                    onTap: () {
                      _updateSelectedSize('M');
                    },
                  ),
                  SizeButton(
                    size: 'L',
                    isSelected: _selectedSize == 'L',
                    onTap: () {
                      _updateSelectedSize('L');
                    },
                  ),
                  SizeButton(
                    size: 'XL',
                    isSelected: _selectedSize == 'XL',
                    onTap: () {
                      _updateSelectedSize('XL');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SectionHeader(text: 'Colors Available:'),
              const SizedBox(height: 8),
              Row(
                children: [
                  ColorDot(
                    color: Colors.green,
                    isSelected: _selectedColor == Colors.green,
                    onTap: () => _updateSelectedColor(Colors.green),
                  ),
                  ColorDot(
                    color: Colors.blue,
                    isSelected: _selectedColor == Colors.blue,
                    onTap: () => _updateSelectedColor(Colors.blue),
                  ),
                  ColorDot(
                    color: Colors.black,
                    isSelected: _selectedColor == Colors.black,
                    onTap: () => _updateSelectedColor(Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                  child: CustomButton(
                width: 380.w,
                onPressed: () {},
                text: 'Add to Cart',
                backgroundColor: Color(0xFF0D6EFD),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _updateSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _updateSelectedSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }
}
