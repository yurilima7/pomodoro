import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/core/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isVisibility = false;
  final formKey = GlobalKey<FormState>();
  final userNameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    userNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
            bottom: 30.0,
          ),
    
          child: LayoutBuilder(
            builder: (context, constraint) {
    
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
    
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
    
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Text(
                                'Crie uma conta',
                                style: context.textStyles.title,
                              ),
                            ],
                          ),
                        ),
    
                        Expanded(
                          flex: 3,
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              
                              children: [
                                TextFormField(
                                  style: context.textStyles.formText,
                                  keyboardType: TextInputType.text,
                                  controller: userNameEC,
                              
                                  decoration: const InputDecoration(
                                    label: Text('Nome de usu??rio'),
                                    hintText: 'Digite seu usu??rio',
                                    prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      size: 32,
                                    ),
                                  ),

                                  validator: Validatorless.multiple([
                                    Validatorless.required('Obrigat??rio!'),
                                  ]),
                                ),
                          
                                const SizedBox(height: 10.0,),
                          
                                TextFormField(
                                  style: context.textStyles.formText,
                                  keyboardType: TextInputType.text,
                                  controller: emailEC,
                              
                                  decoration: const InputDecoration(
                                    label: Text('E-Mail'),
                                    hintText: 'Digite seu e-mail',
                                    prefixIcon: Icon(Icons.email_outlined, size: 32,),
                                  ),

                                  validator: Validatorless.multiple([
                                    Validatorless.required('Obrigat??rio!'),
                                    Validatorless.email('E-Mail inv??lido!'),
                                  ]),
                                ),
                              
                                const SizedBox(height: 10.0,),
                              
                                TextFormField(
                                  style: context.textStyles.formText,
                                  keyboardType: TextInputType.text,
                                  obscureText: !_isVisibility,
                                  controller: passwordEC,
                                  
                                  decoration: InputDecoration(
                                    label: const Text('Senha'),
                                    hintText: 'Digite sua senha',
                                    prefixIcon: const Icon(
                                      Icons.login_outlined,
                                      size: 32,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        !_isVisibility? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                        size: 32,
                                      ),
                              
                                      onPressed: () => setState(() {
                                        _isVisibility = !_isVisibility;
                                      }),
                                    ),
                                  ),

                                  validator: Validatorless.multiple([
                                    Validatorless.required('Obrigat??rio!'),
                                    Validatorless.min(
                                      8,
                                      'Senha deve conter oito caracteres',
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Consumer<UserControllerImpl>(
                              builder: (context, user, child) => Button(
                                action: () {
                                  final valid = formKey.currentState?.validate() ?? false;
                                  if (valid) {
                                    user.registerUser(
                                      emailEC.text,
                                      passwordEC.text,
                                      userNameEC.text,
                                    );
                                  }
                                },
                                title: 'Registrar',
                              ),
                            ),
                            
                            TextButton(
                              child: Text(
                                'Possui uma conta? Entre agora',
                                style: context.textStyles.formText,
                              ),        
                              onPressed: () => NavigatorRoutes().loginScreen(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}