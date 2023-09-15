import 'package:flutter/material.dart';
import 'package:part_9/models/user.dart';
import 'package:part_9/screens/user_detail_screen.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

//объявление переменной списка с типом данных User
List<User> usersList = [
  User(
      age: 16,
      firstName: 'Гештальт',
      lastName: 'Вассэрман',
      phone: '321123315531',
      email: 'fufix@pochta.ru',
      avatar:
          'https://pixelbox.ru/wp-content/uploads/2021/09/avatar-boys-vk-59.jpg'),
  User(
      age: 16,
      firstName: 'Стражи',
      lastName: 'Галактик',
      phone: '-1',
      email: 'http.ru',
      avatar: 'https://mega-u.ru/wp-content/uploads/2022/09/635c5359115237.y3jvccw5njqsnzu0ldq3ocwxnjq.jpg'),
  User(
      age: 16,
      firstName: 'Helper',
      lastName: 'Helperovich',
      phone: '112',
      email: 'help@help.help',
      avatar:
          'https://pixelbox.ru/wp-content/uploads/2020/12/avatar-youtube-23.jpg'),
];

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    user: usersList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: usersList[index].avatar == ''
                            ? Image.network(
                                'http://cdn.onlinewebfonts.com/svg/img_207975.png')
                            : Image.network(usersList[index].avatar,
                                fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Имя: ' + usersList[index].firstName,
                              textAlign: TextAlign.left,
                            ),
                            Text('Фамилия: ' + usersList[index].lastName),
                            Text('Возраст: ' + usersList[index].age.toString()),
                            Text('Телефон: ' + usersList[index].phone),
                            Text('Email: ' + usersList[index].email),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
