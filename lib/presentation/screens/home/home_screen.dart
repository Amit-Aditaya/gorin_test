import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/widgets/scaffolds/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.logout),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: .025.sh,
                        backgroundImage: const NetworkImage(
                            'https://picsum.photos/id/237/200/300'),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      title: const Text('John Doe'),
                    );
                  }),
            ),
          ],
        ));
  }
}
