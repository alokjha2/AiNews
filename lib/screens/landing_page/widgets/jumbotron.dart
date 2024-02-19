import 'package:ainews/import.dart';

class Jumbotron extends StatefulWidget {
  const Jumbotron({
    Key? key,
  }) : super(key: key);

  @override
  State<Jumbotron> createState() => _JumbotronState();
}

class _JumbotronState extends State<Jumbotron> with SingleTickerProviderStateMixin {

  // Defining Particles for animation.
ParticleOptions particles = const ParticleOptions(
	baseColor: Colors.purple,
	spawnOpacity: 0.0,
	opacityChangeRate: 0.25,
	minOpacity: 0.1,
	maxOpacity: 0.4,
	particleCount: 70,
	spawnMaxRadius: 15.0,
	spawnMaxSpeed: 100.0,
	spawnMinSpeed: 30,
	spawnMinRadius: 7.0,
);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 400,
      width: size.width,
      child: AnimatedBackground(
            // vsync uses singleTicketProvider state mixin.
            vsync: this, 
            behaviour: RandomParticleBehaviour(options: particles),
            child: Center(
                child: AnimatedTextKit( 
				animatedTexts: [ 
				TyperAnimatedText('This is Animated text,', 
					textStyle: const TextStyle( 
						color: Colors.white, 
						fontSize: 30, 
						backgroundColor: Colors.purple)), 
				TyperAnimatedText('You are viewing it here.', 
					textStyle: const TextStyle( 
            color: Colors.white,
						fontSize: 20, fontWeight: FontWeight.bold)), 
				], 
				// onTap: () { 
				// print("I am executing"); 
				// }, 
			),
),
          ),
    );


    // Container(
    //     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    //     child: Row(
    //       children: <Widget>[
    //         Expanded(
    //             child: Padding(
    //           padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
    //           child: Column(
    //             mainAxisAlignment: !isMobile(context)
    //                 ? MainAxisAlignment.start
    //                 : MainAxisAlignment.center,
    //             crossAxisAlignment: !isMobile(context)
    //                 ? CrossAxisAlignment.start
    //                 : CrossAxisAlignment.center,
    //             children: <Widget>[
    //               if (isMobile(context))
    //                 Image.asset(
    //                   'assets/Ai.png',
    //                   height: size.height * 0.3,
    //                 ),
    //               RichText(
    //                   textAlign: !isMobile(context)
    //                       ? TextAlign.start
    //                       : TextAlign.center,
    //                   text: TextSpan(children: [
    //                     TextSpan(
    //                         text: 'Welcome To\n',
    //                         style: TextStyle(
    //                             fontSize: isDesktop(context) ? 40 : 20,
    //                             fontWeight: FontWeight.w800,
    //                             color: kTextColor)),
    //                     TextSpan(
    //                         text: 'Yoga Lifestyle',
    //                         style: TextStyle(
    //                             fontSize: isDesktop(context) ? 64 : 32,
    //                             fontWeight: FontWeight.w800,
    //                             color: kPrimaryColor)),
    //                   ])),
    //               Text(
    //                 'Studio',
    //                 textAlign:
    //                     !isMobile(context) ? TextAlign.start : TextAlign.center,
    //                 style: TextStyle(
    //                     fontSize: isDesktop(context) ? 40 : 20,
    //                     fontWeight: FontWeight.w800),
    //               ),
    //               SizedBox(height: 10),
    //               Text(
    //                 'We are trying very hard to create all the condition so that your stay in the studio is comfortable and favorable or creativity and creation. ',
    //                 textAlign:
    //                     isMobile(context) ? TextAlign.center : TextAlign.start,
    //                 style: TextStyle(
    //                     fontSize: isDesktop(context) ? 16 : 16,
    //                     fontWeight: FontWeight.w300),
    //               ),
    //               SizedBox(height: 16),
    //               Wrap(
    //                 runSpacing: 10,
    //                 alignment: WrapAlignment.center,
    //                 children: <Widget>[
    //                   MainButton(
    //                     title: 'GET STARTED',
    //                     color: kPrimaryColor,
    //                     tapEvent: () {},
    //                   ),
    //                   SizedBox(width: 10),
    //                   MainButton(
    //                     title: 'Sign Up for classes',
    //                     color: kSecondaryColor,
    //                     tapEvent: () {},
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //         )),
    //         if (isDesktop(context) || isTab(context))
    //           Expanded(
    //               child: Image.asset(
    //             'assets/Ai.png',
    //             height: size.height * 0.7,
    //           ))
    //       ],
    //     ));
  }
}