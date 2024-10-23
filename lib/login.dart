import 'dart:ui';

import 'package:app_i_show/inputCustomizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>  with SingleTickerProviderStateMixin{
  late AnimationController _animaController;
  late Animation<double> _animationBlur;
  late Animation<double> _animationFadeIn;
  late Animation<double> _animationSize;

@override
  void initState() {
    super.initState();
    _animaController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500),
    );
    _animationBlur = Tween<double>(
      begin: 5,
      end:0
    ).animate(CurvedAnimation(
      parent: _animaController,
      curve: Curves.ease
    ));
    _animationFadeIn = Tween<double>(
      begin: 0,
      end:1
    ).animate(CurvedAnimation(
      parent: _animaController,
      curve: Curves.easeInOut
    ));
    _animationSize = Tween<double>(
      begin: 0,
      end:500
    ).animate(CurvedAnimation(
      parent: _animaController,
      curve: Curves.decelerate
    ));
    _animaController.forward();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationBlur!,
                builder: (context, child) {
                  return  Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/fundo.png'),
                        fit: BoxFit.fill),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX:_animationBlur.value, 
                      sigmaY: _animationBlur.value),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: FadeTransition(
                            opacity: _animationFadeIn, 
                            child: Image.asset('assets/img/detalhe1.png'),
                            ),
                        ),
                        Positioned(
                          left: 50,
                          child: FadeTransition(
                            opacity: _animationFadeIn, 
                            child: Image.asset('assets/img/detalhe2.png'),
                            ),
                        ),
                      ],
                    ),
                  ),
                );
                },
                
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _animationSize,
                      builder:(context,child){
                        return Container(
                      padding: const EdgeInsets.all(10),
                      width: _animationSize.value ,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Inputcustomizado(
                            hint: "E-mail",
                            icon: Icon(Icons.email),
                            obscure: false,
                          ),
                          const SizedBox(height: 20),
                          const Inputcustomizado(
                            hint: "Senha",
                            icon: Icon(Icons.lock),
                            obscure: true,
                          ),
                          const SizedBox(height: 10),
                          AnimatedBuilder(
                            animation: _animationSize,
                            builder: (context, child) {
                              return InkWell(
                            onTap: () {},
                            child: Container(
                              width: _animationSize.value,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(255, 100, 127, 1),
                                    Color.fromRGBO(255, 123, 147, 1),
                                  ])),
                              child: const Center(
                                  child: Text(
                                "Entrar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          );
                            }
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                      }
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 100, 127, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
