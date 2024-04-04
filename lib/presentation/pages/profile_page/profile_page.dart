import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/presentation/bloc/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/presentation/widgets/forms/drop_down_field.dart';
import 'package:his_mobile/presentation/widgets/forms/editable_field.dart';

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
              DropDownField(
                title: 'Personal Information',
                children: [
                  EditableField(
                    controller: _innController,
                    title: 'ИНН',
                    isEditable: false,
                  ),
                  EditableField(
                    controller: _birthDateController,
                    title: 'Дата Рождения',
                    isEditable: false,
                  ),
                  EditableField(
                    controller: _nameController,
                    title: 'Имя',
                  ),
                  EditableField(
                    controller: _surnameController,
                    title: 'Фамилия',
                  ),
                  EditableField(
                    controller: _patronymicController,
                    title: 'Отчество',
                  ),
                  EditableField(
                    controller: _genderController,
                    title: 'Пол',
                  ),
                  EditableField(
                    controller: _maritalStatusController,
                    title: 'Семейное положение',
                  ),
                  EditableField(
                    controller: _emailController,
                    title: 'Электроная почта',
                  ),
                  EditableField(
                    controller: _phoneNumberController,
                    title: 'Номер Телефона',
                  ),
                ],
              ),
              // DropDownField(
              //   title: 'Address',
              //   children: [
              //     EditableField(
              //       title: 'Страна',
              //       value: 'Кыргызстан',
              //     ),
              //     EditableField(
              //       title: 'Область',
              //       value: 'Чуйская',
              //     ),
              //     EditableField(
              //       title: 'Город/Село',
              //       value: 'Бишкек',
              //     ),
              //     EditableField(
              //       title: 'Улица',
              //       value: 'Токтогула',
              //       isEditable: false,
              //     ),
              //     EditableField(
              //       title: 'Дом',
              //       value: '123',
              //       isEditable: false,
              //     ),
              //     EditableField(
              //       title: 'Квартира',
              //       value: '123',
              //     ),
              //     EditableField(
              //       title: 'Почтовый Индекс',
              //       value: '720000',
              //     ),
              //   ],
              // ),
              // DropDownField(
              //   title: 'Экстренные контакты (1)',
              //   children: [
              //     EditableField(
              //       title: 'Имя',
              //       value: 'Рамиль',
              //     ),
              //     EditableField(
              //       title: 'Фамилия',
              //       value: 'Салихар',
              //     ),
              //     EditableField(
              //       title: 'Отчество',
              //       value: 'Шамильевич',
              //     ),
              //     EditableField(
              //       title: 'Номер Телефона',
              //       value: '+996 555 555 555',
              //     ),
              //   ],
              // ),
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
