import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderlist/providers/orderprovider.dart';

class OrderCard extends ConsumerWidget {
  final String id;
  final String name;
  final String resto;
  final double price;
  final String image;
  final VoidCallback onDelete;

  const OrderCard({
    super.key,
    required this.id,
    required this.onDelete,
    required this.name,
    required this.price,
    required this.resto,
    required this.image,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textScale = screenWidth / 400;
    
    final amount = ref.watch(amountProvider.select((state) => state[id] ?? 1));

    return Center(
      child: Container(
        height: screenHeight * 0.11,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: SizedBox(
                width: screenWidth * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
              "http://192.168.156.107:8000$image",
       
              fit: BoxFit.cover,
               errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/noimage.png', 
          
              fit: BoxFit.cover,// your fallback image
              
            );
          },
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
            ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * textScale,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 4),
                        child: GestureDetector(
                          onTap: onDelete,
                          child: Icon(Icons.delete_outline,
                              color: Colors.red, size: 25 * textScale),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    resto,
                    style: TextStyle(color: Colors.grey, fontSize: 12 * textScale),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$price DA",
                        style: TextStyle(
                          fontSize: 16 * textScale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.read(amountProvider.notifier).decrement(id);
                            },
                            child: Icon(Icons.arrow_back_ios, size: 18 * textScale),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4 * textScale),
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                fontSize: 16 * textScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(amountProvider.notifier).increment(id);
                            },
                            child: Icon(Icons.arrow_forward_ios, size: 18 * textScale),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
