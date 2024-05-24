import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal/bloc/registration_bloc.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is RegistrationLoading) {
          return CircularProgressIndicator();
        } else {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    BlocProvider.of<RegistrationBloc>(context).add(RegistrationEvent.nameChanged, value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    BlocProvider.of<RegistrationBloc>(context).add(RegistrationEvent.emailChanged, value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    BlocProvider.of<RegistrationBloc>(context).add(RegistrationEvent.passwordChanged, value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<RegistrationBloc>(context).add(RegistrationEvent.registerButtonPressed);
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
