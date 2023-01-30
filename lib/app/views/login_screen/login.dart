import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/core/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isVisibility = false;
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
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
                                'Seja Bem-Vindo',
                                style: TextStyles.i.title,
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
                                  style: TextStyles.i.formText,
                                  keyboardType: TextInputType.text,
                                  controller: emailEC,
                              
                                  decoration: const InputDecoration(
                                    label: Text('E-Mail'),
                                    hintText: 'Digite seu e-mail',
                                    prefixIcon: Icon(Icons.email_outlined, size: 32,),
                                  ),

                                  validator: Validatorless.multiple([
                                    Validatorless.required('Obrigatório!'),
                                    Validatorless.email('E-Mail inválido!'),
                                  ]),
                                ),
                              
                                const SizedBox(height: 10.0,),
                              
                                TextFormField(
                                  style: TextStyles.i.formText,
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
                                    Validatorless.required('Obrigatório!'),
                                    Validatorless.min(
                                      8,
                                      'Senha deve conter oito caracteres',
                                    ),
                                  ]),
                                ),
                              
                                const SizedBox(height: 10.0,),
                                
                                TextButton(
                                  child: Text(
                                    'Esqueci a senha',
                                    style: TextStyles.i.formText,
                                  ),        
                                  onPressed: () {},
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
                                    user.login(
                                      emailEC.text,
                                      passwordEC.text,
                                    );
                                  }
                                },
                                title: 'Entrar',
                              ),
                            ),
                            
                            TextButton(
                              child: Text(
                                'Crie uma conta',
                                style: TextStyles.i.formText,
                              ),        
                              onPressed: () => NavigatorRoutes().registerScreen(),
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