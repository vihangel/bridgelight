import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/utils/utills.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/text_field_label_widget.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:mybookstore/domain/entities/create_store_model.dart';
import 'package:validatorless/validatorless.dart';

class CreateStorePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sloganController = TextEditingController();
  final TextEditingController bannerController = TextEditingController();
  final TextEditingController admNameController = TextEditingController();
  final TextEditingController admAvatarController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CreateStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Minha loja',
          style: MyBookStoreTextStyles.title,
        ),

        ///Added back button because it was missing on figma
        automaticallyImplyLeading: true,
        centerTitle: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                  label: 'Banner da loja',
                  margin: const EdgeInsets.only(bottom: 20),
                  // validator: Validatorless.required('Não pode ser nulo'),
                  controller: bannerController,
                  readOnly: true,
                  onTap: () async {
                    bannerController.text = await Utils.getImage() ?? '';
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Nome do administrador',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.required('Não pode ser nulo'),
                  controller: admNameController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Foto do administrador',
                  margin: const EdgeInsets.only(bottom: 20),
                  // validator: Validatorless.required('Não pode ser nulo'),
                  controller: admAvatarController,
                  readOnly: true,
                  onTap: () async {
                    admAvatarController.text = await Utils.getImage() ?? '';
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Senha',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.multiple([
                    Validatorless.min(6, 'Minimo 6 caracteres'),
                    Validatorless.max(10, 'Maximo 10 caracteres'),
                    Validatorless.regex(RegExp(r'[A-Z]'),
                        'É necessário ao menos uma letra maiúscula'),
                    Validatorless.regex(
                        RegExp(
                            r'[!@#\$%\^&\*\(\)\[\]{}\-_+=~`|\\:;"\<>,\.\?\/]'),
                        'É necessário ao menos um caractere especial'),
                  ]),
                  controller: passwordController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Repetir senha',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.compare(
                      passwordController, 'As senhas não são iguais'),
                  onEditingComplete: () {
                    btnLogin(context);
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
                      title: 'Cadastrar',
                      margin: const EdgeInsets.only(bottom: 50, top: 81),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void btnLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final bloc = Modular.get<AuthBloc>();
      bloc.add(AuthCreateStoreModel(
          store: StoreWithAdminModel(
              name: nameController.text,
              slogan: sloganController.text,
              banner: bannerController.text,
              admin: Admin(
                name: admNameController.text,
                photo: admAvatarController.text,
                password: passwordController.text,
                username:
                    admNameController.text.replaceAll(' ', '.').toLowerCase(),
              ))));
    }
  }
}
