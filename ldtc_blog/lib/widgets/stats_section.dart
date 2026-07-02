import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  Widget statItem(
    IconData icon,
    String number,
    String text,
    Color iconColor,
    bool mobile,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: mobile ? 40 : 55,
            ),

            SizedBox(height: mobile ? 10 : 15),

            Text(
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mobile ? 24 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: mobile ? 8 : 10),

            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mobile ? 14 : 17,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 40,
        vertical: mobile ? 30 : 40,
      ),
     

      child: mobile
          ? Column(
              children: [
                Row(
                  children: [
                    statItem(
                      Icons.groups,
                      "200+",
                      "Families\nServed",
                      Colors.teal,
                      true,
                    ),

                    Container(
                      height: 110,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),

                    statItem(
                      Icons.star,
                      "10+",
                      "Years of\nExperience",
                      Colors.amber,
                      true,
                    ),
                  ],
                ),

                const Divider(height: 45),

                Row(
                  children: [
                    statItem(
                      Icons.workspace_premium,
                      "Certified",
                      "& Licensed\nTherapists",
                      Colors.teal,
                      true,
                    ),

                    Container(
                      height: 110,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),

                    statItem(
                      Icons.favorite,
                      "100%",
                      "Commitment to\nEvery Child",
                      Colors.orange,
                      true,
                    ),
                  ],
                ),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                children: [
                  statItem(
                    Icons.groups,
                    "200+",
                    "Families Served",
                    Colors.teal,
                    false,
                  ),

                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),

                  statItem(
                    Icons.star,
                    "10+",
                    "Years of Experience",
                    Colors.amber,
                    false,
                  ),

                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),

                  statItem(
                    Icons.workspace_premium,
                    "Certified",
                    "& Licensed Therapists",
                    Colors.teal,
                    false,
                  ),

                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),

                  statItem(
                    Icons.favorite,
                    "100%",
                    "Commitment to Every Child",
                    Colors.orange,
                    false,
                  ),
                ],
              ),
            ),
    );
  }
}