import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/styles/text_styles.dart';
import 'package:pomodoro/app/core/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            top: 40.0,
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
                        Text(
                          'Seja Bem-Vindo',
                          style: TextStyles().title,
                          textAlign: TextAlign.start,
                        ),
    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
    
                          children: [
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
    
                            const SizedBox(height: 10.0,),
                            
                            Text('Esqueci a senha', style: TextStyles().formText,),
                          ],
                        ),
    
                        Button(action: () {}, title: 'Login'),
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