import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/core/widgets/button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisibility = true;

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
                            
                                decoration: const InputDecoration(
                                  label: Text('Nome de usuário'),
                                  hintText: 'Digite seu usuário',
                                  prefixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    size: 32,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10.0,),

                              TextFormField(
                                style: TextStyles().formText,
                                keyboardType: TextInputType.text,
                            
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
                            ],
                          ),
                        ),
    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Button(action: () {}, title: 'Registrar'),
                            
                            TextButton(
                              child: Text(
                                'Possui uma conta? Entre agora',
                                style: TextStyles().formText,
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