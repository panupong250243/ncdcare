import 'package:flutter/material.dart';
import 'package:ncdcare/Api/Cache/data.dart';
import 'package:ncdcare/Api/UserProfile/user_profile.dart';
import 'package:ncdcare/Api/ipcon.dart';

List<Widget> profileIcon() {
  return [
    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
      child: FutureBuilder<Map<String, dynamic>>(
          future: Profile().getUserProfile(userId: cacheUserId.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: snapshot.data!['user_image'] == null
                    ? const AssetImage("assets/profile.png") as ImageProvider
                    : NetworkImage(
                        "$ipcon/../upload/${snapshot.data!['user_image']}"),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    )
  ];
}
