import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_state.dart';
import 'package:his_mobile/presentation/widgets/profile/emergency_contact.dart';
import 'package:his_mobile/presentation/widgets/profile/personal_information.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _nameController.text = 'Рамиль';
    _surnameController.text = 'Салихар';
    _patronymicController.text = 'Шамильевич';
    _innController.text = '12345678912345';
    _birthDateController.text = '01.01.2000';
    _genderController.text = 'Мужской';
    _maritalStatusController.text = 'Холост';
    _emailController.text = 'ramil.salihar_2025@ucentralasia.org';
    _phoneNumberController.text = '+996 555 555 555';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = false;
    final theme = Theme.of(context);
    return BlocConsumer<UserInfoBloc, UserInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UserInfoUpdating) {
          isEditing = state.isUpdating;
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: theme.primaryColor,
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              const PersonalInformation(),
              const EmergencyContact()
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<UserInfoBloc>().add(
                    ToggleUserInfoUpdate(!isEditing),
                  );
            },
            child: const Icon(Icons.edit),
          ),
        );
      },
    );
  }
}
