import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/core/utils/texts.dart';
import 'package:mybookstore/core/utils/utills.dart';
import 'package:mybookstore/core/widgets/button_widget.dart';
import 'package:mybookstore/core/widgets/image_widget.dart';
import 'package:mybookstore/core/widgets/text_field_label_widget.dart';
import 'package:mybookstore/domain/blocs/employee/employee_bloc.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:validatorless/validatorless.dart';

class CreateEmployeePage extends StatefulWidget {
  final EmployeeModel? employee;
  final bool edit;

  const CreateEmployeePage({super.key, this.employee, required this.edit});

  @override
  State<CreateEmployeePage> createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  String photo = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.edit ? 'Editar funcionario' : 'Novo funcionario',
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
                InkWell(
                  onTap: () async {
                    photo = await Utils.getImage() ?? '';
                    setState(() {});
                  },
                  child: Center(
                    child: ImageWidget(
                      imageString: photo,
                      width: 100,
                      height: 100,
                      placeholder: 'avatat_placeholder',
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                TextFieldLabel(
                  label: 'Nome',
                  margin: const EdgeInsets.only(bottom: 20),
                  controller: nameController,
                  validator: Validatorless.required('Não pode ser nulo'),
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Usuário de login',
                  margin: const EdgeInsets.only(bottom: 20),
                  validator: Validatorless.required('Não pode ser nulo'),
                  controller: usernameController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                TextFieldLabel(
                  label: 'Senha',
                  margin: const EdgeInsets.only(bottom: 33),
                  controller: passwordController,

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
                    // btnLogin(context);
                  },
                ),
                BlocBuilder<EmployeeBloc, EmployeeState>(
                  bloc: Modular.get<EmployeeBloc>(),
                  buildWhen: (previous, current) {
                    if (previous is EmployeeLoadingState &&
                        current is EmployeeErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(current.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    if (previous is EmployeeLoadingState &&
                        current is EmployeeLoadedState) {
                      Modular.to.pushReplacementNamed('/home');
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return Button(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final bloc = Modular.get<EmployeeBloc>();
                          final CreateEmployeeModel newEmployee =
                              CreateEmployeeModel(
                            id: widget.employee?.id.toString(),
                            name: nameController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                            photo: photo,
                          );
                          if (widget.edit) {
                            print('newEmployee: ${newEmployee.id}');
                            bloc.add(EditEmployeeEvent(newEmployee));
                          } else {
                            bloc.add(CreateEmployeeEvent(newEmployee));
                          }
                        }
                      },
                      loading: false,
                      title: 'Salvar',
                      margin: const EdgeInsets.only(bottom: 50, top: 40),
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
}
