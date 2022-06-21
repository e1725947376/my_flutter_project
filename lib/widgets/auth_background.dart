import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
    final Widget child;

  const AuthBackground({
    super.key, 
    required this.child});
    

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width:  double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child,

        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity ,
        margin: const EdgeInsets.only(top:20),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackgroud(),
      child: Stack(
        children:const [

          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), bottom: -10, left: 40),
          Positioned(child: _Bubble(), top: 150, right:110),
          Positioned(child: _Bubble(), top: -60, left: 60),
          Positioned(child: _Bubble(), top: 80, right: -10),
          Positioned(child: _Bubbledos(), top: 10, left: 30),
          Positioned(child: _Bubbledos(), bottom: -90, left: 40),
          Positioned(child: _Bubbledos(), top: 15, right:110),
          Positioned(child: _Bubbledos(), top: -120, left: 60),
          Positioned(child: _Bubbledos(), top: 160, right: -10),
          
        ],
      ),
      

    );
  }

  BoxDecoration _purpleBackgroud() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])

  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color:const Color.fromRGBO(255, 255, 255, 0.05)
  ),

    );
  }
}

class _Bubbledos extends StatelessWidget {
  const _Bubbledos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color:const Color.fromRGBO(250, 250, 250, 0.05)
  ),

    );
  }
}