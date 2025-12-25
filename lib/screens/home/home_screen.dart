import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_theme.dart';
import '../../config/app_sizes.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../models/category_model.dart';
import '../../models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data
  late List<Category> categories;
  late List<Order> orders;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    categories = [
      Category(
        id: '1',
        name: 'Beverages',
        icon: '🥤',
        itemCount: 24,
      ),
      Category(
        id: '2',
        name: 'Snacks',
        icon: '🍿',
        itemCount: 18,
      ),
      Category(
        id: '3',
        name: 'Desserts',
        icon: '🍰',
        itemCount: 15,
      ),
      Category(
        id: '4',
        name: 'Juices',
        icon: '🧃',
        itemCount: 20,
      ),
      Category(
        id: '5',
        name: 'Smoothies',
        icon: '🥛',
        itemCount: 12,
      ),
      Category(
        id: '6',
        name: 'Coffee',
        icon: '☕',
        itemCount: 16,
      ),
    ];

    orders = [
      Order(
        id: '1',
        itemName: 'Iced Latte',
        status: 'Delivered',
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
        amount: 320,
      ),
      Order(
        id: '2',
        itemName: 'Strawberry Smoothie',
        status: 'Delivered',
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        amount: 250,
      ),
      Order(
        id: '3',
        itemName: 'Chocolate Shake',
        status: 'Cancelled',
        orderDate: DateTime.now().subtract(const Duration(days: 7)),
        amount: 280,
      ),
      Order(
        id: '4',
        itemName: 'Fresh Orange Juice',
        status: 'Delivered',
        orderDate: DateTime.now().subtract(const Duration(days: 10)),
        amount: 150,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with Profile
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 0,
              backgroundColor: context.backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileSection(),
              ),
              expandedHeight: 140,
            ),

            // Main Content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories Section
                  _buildCategoriesSection(),

                  const SizedBox(height: AppSizes.xxxl),

                  // Recent Orders Section
                  _buildRecentOrdersSection(),

                  const SizedBox(height: AppSizes.xxxl),

                  // Promotional Banner
                  _buildPromoBanner(),

                  const SizedBox(height: AppSizes.xxxl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profile Section at the top
  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.screenPaddingHorizontal,
        vertical: AppSizes.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      'John Doe',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Avatar
              GestureDetector(
                onTap: () {
                  // Navigate to profile
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile tapped')),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.secondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: context.primaryColor.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'JD',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: AppSizes.md),

              // Notifications
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.secondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: context.primaryColor.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: AppTheme.primaryColor,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No new notifications'),
                          ),
                        );
                      },
                    ),
                    // Notification Badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppTheme.errorColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Categories Section
  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPaddingHorizontal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // View all categories
                },
                child: const Text('View All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        SizedBox(
          height: 140,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.screenPaddingHorizontal,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(categories[index], index);
            },
          ),
        ),
      ],
    );
  }

  // Category Card
  Widget _buildCategoryCard(Category category, int index) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${category.name} tapped')),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: AppSizes.lg),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: context.borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: context.primaryColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: context.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Center(
                child: Text(
                  category.icon,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.md),

            // Category Name
            Text(
              category.name,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.xs),

            // Item Count
            Text(
              '${category.itemCount} items',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Recent Orders Section
  Widget _buildRecentOrdersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPaddingHorizontal,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Past Orders',
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // View all orders
                },
                child: const Text('View All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.lg),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenPaddingHorizontal,
          ),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return _buildOrderCard(orders[index]);
          },
        ),
      ],
    );
  }

  // Order Card
  Widget _buildOrderCard(Order order) {
    final isDelivered = order.status == 'Delivered';
    final statusColor = isDelivered ? AppTheme.successColor : AppTheme.errorColor;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.lg),
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(
          color: context.borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: context.primaryColor.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.itemName,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.xs),
                    Text(
                      'Order #${order.id}',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.md,
                  vertical: AppSizes.xs,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Text(
                  order.status,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.lg),

          // Divider
          Divider(
            color: context.borderColor,
            height: 1,
          ),

          const SizedBox(height: AppSizes.lg),

          // Order Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Date',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Text(
                    _formatDate(order.orderDate),
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Amount',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Text(
                    '₹${order.amount.toStringAsFixed(2)}',
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Promotional Banner
  Widget _buildPromoBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.screenPaddingHorizontal,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.primaryColor,
              context.primaryColor.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: [
            BoxShadow(
              color: context.primaryColor.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Special Offer',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppTheme.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSizes.xs),
                  Text(
                    'Get 20% off on your next order',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppTheme.textLight.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: AppSizes.md),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Offer applied!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.secondaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.lg,
                        vertical: AppSizes.xs,
                      ),
                    ),
                    child: Text(
                      'Claim Now',
                      style: TextStyle(
                        color: context.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.textLight.withOpacity(0.1),
              ),
              child: const Center(
                child: Text(
                  '🎉',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to format date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
