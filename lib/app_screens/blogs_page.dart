import 'package:amigoproject/app_screens/blog_details_pg.dart';
import 'package:flutter/material.dart';
import 'blog.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Blogs extends StatefulWidget {
  // const Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {

  List<Blog> Blogs = [
    Blog(
      author: '',
      text: 'The Mind and the Body are not separate; what affects one, affects the other...Stress has varied meaning for different people under varied conditions. Lazarus and Folkman (1984) defined stress as a specific relationship that a person has to that of the environment which result in terms of threat, danger or deterioration of mental wellbeing.In December 2019, the new coronavirus disease 2019 (COVID-2019) started spreading in the Chinese city of Wuhan (Hubei province). The pandemic of Corona Virus (Covid -19) has a huge impact on the whole world. Which is associated with uncertainty hence leading to an increase in testing psychological resilience of the masses. People are going through a myriad of psychological problems in adjusting to the current lifestyles and fear of the disease. The corona virus disease (Covid-19) pandemic is a public health emergency of international concern and poses a challenge to humanity to cope up by countering this potential stressor. A stressor could be any chemical or biological agent, environmental condition, external stimulus or an event seen as causing stress to an organism (Sato, 2006). And it is very important to understand that a stimulus cannot be labelled as a stressor if it doesn’t result into stress. But covid-19 pandemic and lockdown along with other stimulus act as potent stressors.However, many recent studies aim to analyze varied effects of covid-19 related to clinical aspects, likelihood of survival, genomic characterization of the virus and drugs and therapeutic ways. But majorly lacked the effort in place of psychological element of the present situation and paid least focus on the effects of one of the major aspects of the same pandemic situation that is “lockdown”. Our study exaggerates that covid-19 pandemic, several months lockdown, social distancing, distance learning situation; could be some of the potent stressors for students.However, here comes the role of coping strategies in order to dough the potent stressors of covid-19 pandemic and lockdown. There are broad categories of coping strategies but the most general ones are classified as problem-focused, emotion-focused, approach coping strategies and avoidant coping strategies. Particular strategies are not inherently either good or bad, but instead their value depends on the specific stressor and the situation in which it occurs.Coping is characterized by the subscales of active coping, positive reframing, planning, acceptance, seeking emotional support, and seeking informational support. Avoidant Coping which is characterized by the subscales of denial, substance use, venting, behavioral disengagement, self-distraction and self-blame. Neither approach nor avoidant coping strategy may include humor or religion which are neither considered as avoidant nor approach in strategy.',
      title: 'Is Coping with Stress A Part of Fighting the Pandemic?'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: 372,
                height: 42,
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                // Row(
                //   children: [
                //     Icon(Icons.search),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     TextField(
                //       decoration: InputDecoration(
                //           hintText: 'Search...',
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Icon(Icons.mic_outlined)
                //   ],
                // ),
              ),
              ListTile(
                title: Text('Blogs'),
                subtitle: Text('Feeling Happy or Sad? Vent it out with us.'),
              ),
              GestureDetector(
                child: Card(
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: 200,
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        child: Text('The OCD Stories'),
                      )
                    ],
                  ),
                ),
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BlogDetails()))
                },
              ),
              // StaggeredGridView.countBuilder(
              //   crossAxisCount: 4,
              //   itemCount: 1,
              //   itemBuilder: (BuildContext context, int index) {
              //     return GestureDetector(
              //       child: Card(
              //         child: Column(
              //           children: [
              //             Icon(
              //               Icons.home,
              //               size: 200,
              //             ),
              //             FittedBox(
              //               fit: BoxFit.contain,
              //               alignment: Alignment.center,
              //               child: Text('The OCD Stories'),
              //             )
              //           ],
              //         ),
              //       ),
              //       onTap: () => {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => BlogDetails()))
              //       },
              //     );
              //   },
              //   staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              //   mainAxisSpacing: 4.0,
              //   crossAxisSpacing: 4.0,
              // )
            ],
          ),
        ),
      ),
    );
  }
}