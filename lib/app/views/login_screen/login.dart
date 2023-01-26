import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/core/widgets/button.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    final emailEC = TextEditingController();
    final passwordEC = TextEditingController();
    
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
                                style: TextStyles().title,
                              ),
                            ],
                          ),
                        ),
    
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            
                            children: [
                              TextFormField(
                                style: TextStyles().formText,
                                keyboardType: TextInputType.text,
                                controller: emailEC,
                            
                                decoration: const InputDecoration(
                                  label: Text('E-Mail'),
                                  hintText: 'Digite seu e-mail',
                                  prefixIcon: Icon(Icons.email_outlined, size: 32,),
                                ),
                              ),
                            
                              const SizedBox(height: 10.0,),
                            
                              TextFormField(
                                style: TextStyles().formText,
                                keyboardType: TextInputType.text,
                                obscureText: isVisibility,
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
                                      isVisibility? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                      size: 32,
                                    ),
                            
                                    onPressed: () => setState(() {
                                      isVisibility = !isVisibility;
                                    }),
                                  ),
                                  
                                ),
                              ),
                            
                              const SizedBox(height: 10.0,),
                              
                              TextButton(
                                child: Text(
                                  'Esqueci a senha',
                                  style: TextStyles().formText,
                                ),        
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Consumer<UserControllerImpl>(
                              builder: (context, user, child) => Button(
                                action: () {
                                  user.login(
                                    emailEC.text,
                                    passwordEC.text,
                                  );
                                },
                                title: 'Entrar',
                              ),
                            ),
                            
                            TextButton(
                              child: Text(
                                'Crie uma conta',
                                style: TextStyles().formText,
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