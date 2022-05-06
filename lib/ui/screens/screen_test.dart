import 'package:flutter/material.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://images.pexels.com/photos/11431628/pexels-photo-11431628.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                fit: BoxFit.cover,
                height: 400,
              ),
              Container(
                color: Colors.red,
                child: Column(
                  children: const [
                    SizedBox(height: 250),
                    Text(
                      'Titutlo',
                      style: headline5,
                    ),
                    Text(
                      'Culpa eiusmod et anim duis deserunt. Esse irure laboris eiusmod nostrud eu Lorem id aliqua fugiat proident id minim Lorem. Exercitation esse sint ipsum id laboris pariatur anim minim incididunt. Ipsum ad ex quis minim aliqua officia. Deserunt ad labore labore sunt officia ullamco labore eiusmod deserunt ea id velit enim consectetur. Sit nisi sint dolor cupidatat Lorem excepteur eiusmod velit consequat velit anim laboris. Est eu ea adipisicing esse ea eu non aliquip cupidatat officia consectetur.',
                      style: headline6,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
