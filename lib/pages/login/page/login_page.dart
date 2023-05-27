import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/text_field_label_widget.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:mybookstore/domain/entities/auth_model.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            constraints: const BoxConstraints(maxWidth: 290),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'MyBookStore',
                    style: MyBookStoreTextStyles.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 44),
                  TextFieldLabel(
                    label: 'Nome',
                    margin: const EdgeInsets.only(bottom: 14),
                    controller: nameController,
                    validator: Validatorless.required('Não pode ser nulo'),
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  TextFieldLabel(
                    label: 'Senha',
                    margin: const EdgeInsets.only(bottom: 33),
                    controller: emailController,

                    ///On figma is email but auth is password
                    // validator: Validatorless.email('E-mail inválido'),
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
                    onEditingComplete: () {
                      ///Chamar login botão
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
                        loading: state is AuthLoadingState,
                        title: 'Entrar',
                        margin: const EdgeInsets.only(bottom: 23),
                      );
                    },
                  ),
                  Button.contrast(
                    onPressed: () {
                      Modular.to.pushNamed('/createstore');
                    },
                    title: 'Cadastrar minha loja',
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
      final bloc = Modular.get<AuthBloc>();
      bloc.add(AuthLoginEvent(
          auth: AuthModel(
        user: nameController.text,
        password: emailController.text,
      )));
    }
  }

//     String? validateUppercase(String value) {
//   final regex = RegExp(r'[A-Z]');
//   if (!Validatorless.regex(regex, value)) {
//     return 'The value must contain at least one uppercase letter.';
//   }
//   return '';
// }
}
