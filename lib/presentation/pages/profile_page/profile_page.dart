import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_state.dart';
import 'package:his_mobile/presentation/widgets/profile/emergency_contact.dart';
import 'package:his_mobile/presentation/widgets/profile/personal_information.dart';

import '../../../data/models/user_models/user_model.dart';

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

  final TextEditingController _primaryNameController = TextEditingController();
  final TextEditingController _primarySurnameController =
      TextEditingController();
  final TextEditingController _primaryPatronymicController =
      TextEditingController();
  final TextEditingController _primaryPhoneNumberController =
      TextEditingController();
  final TextEditingController _secondaryNameController =
      TextEditingController();
  final TextEditingController _secondarySurnameController =
      TextEditingController();
  final TextEditingController _secondaryPatronymicController =
      TextEditingController();
  final TextEditingController _secondaryPhoneNumberController =
      TextEditingController();

  @override
  void initState() {
    final state = context.read<UserInfoBloc>().state;
    if (state is UserInfoLoaded) {
      _updateControllers(state.user);
    }
    super.initState();
  }

  void _updateControllers(User user) {
    _nameController.text = user.first_name;
    _surnameController.text = user.last_name;
    _patronymicController.text = user.middle_name ?? '';
    _innController.text = user.id.toString();
    _birthDateController.text = user.date_of_birth ?? '';
    _genderController.text = user.gender ?? '';
    _maritalStatusController.text = user.marital_status ?? '';
    _emailController.text = user.email;
    _phoneNumberController.text = user.phone_number;

    _primaryNameController.text = user.primary_emergency_contact.first_name;
    _primarySurnameController.text = user.primary_emergency_contact.last_name;
    _primaryPatronymicController.text =
        user.primary_emergency_contact.middle_name ?? '';
    _primaryPhoneNumberController.text =
        user.primary_emergency_contact.phone_number;
    _secondaryNameController.text = user.secondary_emergency_contact.first_name;
    _secondarySurnameController.text =
        user.secondary_emergency_contact.last_name;
    _secondaryPatronymicController.text =
        user.secondary_emergency_contact.middle_name ?? '';
    _secondaryPhoneNumberController.text =
        user.secondary_emergency_contact.phone_number;
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
              PersonalInformation(
                nameController: _nameController,
                surnameController: _surnameController,
                patronymicController: _patronymicController,
                innController: _innController,
                birthDateController: _birthDateController,
                genderController: _genderController,
                maritalStatusController: _maritalStatusController,
                emailController: _emailController,
                phoneNumberController: _phoneNumberController,
              ),
              EmergencyContact(
                primaryNameController: _primaryNameController,
                primarySurnameController: _primarySurnameController,
                primaryPatronymicController: _primaryPatronymicController,
                primaryPhoneNumberController: _primaryPhoneNumberController,
                secondaryNameController: _secondaryNameController,
                secondarySurnameController: _secondarySurnameController,
                secondaryPatronymicController: _secondaryPatronymicController,
                secondaryPhoneNumberController: _secondaryPhoneNumberController,
              )
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
