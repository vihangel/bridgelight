import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/colors.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/icon_button_widget.dart';
import 'package:mybookstore/core/widgets/image_widget.dart';
import 'package:mybookstore/core/widgets/text_field_label_widget.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:validatorless/validatorless.dart';

class MyProfile extends StatefulWidget {
  MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final data = Modular.get<AuthBloc>().appUser;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController sloganController = TextEditingController();

  final TextEditingController bannerController = TextEditingController();

  final TextEditingController admNameController = TextEditingController();

  final TextEditingController admAvatarController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = data?.store.name ?? '';
    sloganController.text = data?.store.slogan ?? '';
    bannerController.text = data?.store.banner ?? '';
    admNameController.text = data?.user.name ?? '';
    admAvatarController.text = data?.user.photo ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const ImageWidget(
                        imageString: 'aaa',
                        placeholder: 'banner_placeholder',
                        width: double.maxFinite,
                        height: 142,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Column(
                          children: [
                            ImageWidget(
                              imageString: 'aaa',
                              placeholder: 'avatar_placeholder',
                              borderRadius: BorderRadius.circular(100),
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(height: 8),
                            Text('Image de perfil',
                                style: MyBookStoreTextStyles.labelMedium),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 85, right: 20),
                            child: IconButtonWidget(
                              icon: 'ic_edit',
                              onPressed: () {},
                              iconColor: MyBookStoreColors.white,
                              color: MyBookStoreColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFieldLabel(
                    label: 'Nome da loja',
                    margin: const EdgeInsets.only(bottom: 20, top: 40),
                    controller: nameController,
                    validator: Validatorless.required('Não pode ser nulo'),
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  TextFieldLabel(
                    label: 'Slogan da loja',
                    margin: const EdgeInsets.only(bottom: 20),
                    validator: Validatorless.required('Não pode ser nulo'),
                    controller: sloganController,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  TextFieldLabel(
                    label: 'Nome do usuario',
                    margin: const EdgeInsets.only(bottom: 20),
                    validator: Validatorless.required('Não pode ser nulo'),
                    controller: admNameController,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    bloc: Modular.get<AuthBloc>(),
                    buildWhen: (previous, current) {
                      if (previous is AuthLoadingState &&
                          current is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(current.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (previous is AuthLoadingState &&
                          current is AuthLoadedState) {
                        Modular.to.pushReplacementNamed('/home');
                      }
                      return true;
                    },
                    builder: (context, state) {
                      return Button(
                        onPressed: () {
                          btnLogin(context);
                        },
                        loading: false,
                        title: 'Salvar',
                        margin: const EdgeInsets.only(bottom: 50, top: 140),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void btnLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // final bloc = Modular.get<AuthBloc>();
      // bloc.add(AuthCreateStoreModel(
      //     store: StoreWithAdminModel(
      //         name: nameController.text,
      //         slogan: sloganController.text,
      //         banner: bannerController.text,
      //         admin: Admin(
      //           name: admNameController.text,
      //           photo: admAvatarController.text,
      //           password: '',
      //           username: usernameController.text,
      //         ))));
    }
  }
}
