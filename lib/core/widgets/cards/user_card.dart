import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Map item;
  final int index;
  const UserCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  item['avatar'],
                ),
                child: CircularProgressIndicator(
                  value: (1 / (index + 1)).toDouble(),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item['first_name']} ${item['last_name']}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${item['email']}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
