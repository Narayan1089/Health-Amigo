import 'package:amigoproject/app_screens/blog_details_pg.dart';
import 'package:amigoproject/services/initial_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'blog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Blogs extends StatefulWidget {
  // const Blogs({Key key}) : super(key: key);

  final List<Blog> blogs = [
    Blog(
        author: 'Sharvari Kumbhar',
        url:
            'https://images.unsplash.com/photo-1541588007165-da26f41a1996?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNvcGluZyUyMHN0cmVzc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        // 'https://images.unsplash.com/photo-1580428354768-03a028646bc8?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQxfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        text:
            'The Mind and the Body are not separate; what affects one, affects the other...\n\n Stress has varied meaning for different people under varied conditions. Lazarus and Folkman (1984) defined stress as a specific relationship that a person has to that of the environment which result in terms of threat, danger or deterioration of mental wellbeing.\n\nIn December 2019, the new coronavirus disease 2019 (COVID-2019) started spreading in the Chinese city of Wuhan (Hubei province). The pandemic of Corona Virus (Covid -19) has a huge impact on the whole world. Which is associated with uncertainty hence leading to an increase in testing psychological resilience of the masses. People are going through a myriad of psychological problems in adjusting to the current lifestyles and fear of the disease. The corona virus disease (Covid-19) pandemic is a public health emergency of international concern and poses a challenge to humanity to cope up by countering this potential stressor. A stressor could be any chemical or biological agent, environmental condition, external stimulus or an event seen as causing stress to an organism (Sato, 2006). And it is very important to understand that a stimulus cannot be labelled as a stressor if it doesn’t result into stress. But covid-19 pandemic and lockdown along with other stimulus act as potent stressors.\n\n However, many recent studies aim to analyze varied effects of covid-19 related to clinical aspects, likelihood of survival, genomic characterization of the virus and drugs and therapeutic ways. But majorly lacked the effort in place of psychological element of the present situation and paid least focus on the effects of one of the major aspects of the same pandemic situation that is “lockdown”. Our study exaggerates that covid-19 pandemic, several months lockdown, social distancing, distance learning situation; could be some of the potent stressors for students.\n\nHowever, here comes the role of coping strategies in order to dough the potent stressors of covid-19 pandemic and lockdown. There are broad categories of coping strategies but the most general ones are classified as problem-focused, emotion-focused, approach coping strategies and avoidant coping strategies. Particular strategies are not inherently either good or bad, but instead their value depends on the specific stressor and the situation in which it occurs.\n\n Coping is characterized by the subscales of active coping, positive reframing, planning, acceptance, seeking emotional support, and seeking informational support. Avoidant Coping which is characterized by the subscales of denial, substance use, venting, behavioral disengagement, self-distraction and self-blame. Neither approach nor avoidant coping strategy may include humor or religion which are neither considered as avoidant nor approach in strategy.\n\n Mental illnesses affect 19% of the adult population, 46% of teenagers and 13% of children each year. People struggling with their mental health may be living next to our doors, in your school, college or dorm but only half of those receive the required treatment, often because of the stigma attached to mental health. Untreated, mental illness can contribute to higher medical expenses, poorer performance at school and work, fewer employment opportunities and increased risk of suicide.\n\n This will help people to understand how students suffer from stress and what coping strategies can be used during Covid-19 pandemic lockdown. Learning more about mental health allows us to provide helpful support to those affected in our communities.\n\nA COVID-19 epidemic has been spreading in China and other parts of the world since December 2019. The epidemic has brought not only the risk of death from infection but also unbearable psychological pressure. The pandemic has pushed the global economy into a recession, which means the economy starts shrinking and growth stops.\n\nThe priority for governments and the global community is to prevent people from contracting the disease and to cure those who do. More health awareness spending can save lives both at home and globally.\n\nSince majority of the population is experiencing borderline stress, it is recommended to the academic institution’s counseling service to arrange regular virtual mental health checkups or counseling sessions to counter the same.\n\n It is recommended to the institutions to make effective changes or additions in their curriculum and co-curriculum according to the digitalization demand of the present time, which will help to elevate student’s productivity. \n\nSince the studies show high usage of approach coping strategy to counter the stressors, hence it is recommendable that class teacher/professors engage their students in such activities including active coping, gaining emotional support, use of informational support, positive reframing, planning, etc.\n\n Since there is correlation between stress levels and coping strategy, hence it is recommendable that community services carry out measures like virtual campaigns having agendas like importance of mental health and its preservation through tough times. They are even recommended to provide various services particularly having a foundation of approach coping strategies to counter stress levels that they could provide to their visitors and help them out.',
        title: 'Is Coping with Stress A Part of Fighting the Pandemic?'),
    Blog(
      author: 'Anoushka Goes',
      url:
          'https://images.unsplash.com/photo-1586473219010-2ffc57b0d282?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29waW5nJTIwd2l0aCUyMHN0cmVzc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      // 'https://images.unsplash.com/photo-1542639130-c9fadbddcc6b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      text:
          "While employers have glorified trainings and practices to increase the productivity of their workers, a crucial indicator that they miss is the mental health of the employee. Mental health issues have been found to be linked to the general productivity rate of employees. Research has established that untreated mental health illnesses result in a significant loss of productivity in the workplace. This is especially true if the employee's stress is caused by work-related issues. \n\n Surprisingly enough, the pandemic (a major cause for deteriorating mental health) saw a rise in the productivity rates. Working from home actually led to working more. We stopped meeting up with our friends. We stopped going to the pani-puri vala bhaiya. We stopped going to our offices, but we did not stop working. Those of us with employment that allowed us to work from home took our work into our living rooms, kitchens, and bedrooms. Against all obstacles, we challenged ourselves not only to reach but exceed, our pre-pandemic goals. Despite everything, we put work first. Work-1, Mental health-0 \n\n  With the boundaries turning more and more blur, we faced a poor work-life balance scenario. Indeed, this trend has been named “Blurring”, and can be defined as: 'the gradual erasure of the boundaries between private and professional life' and the decrease in work life balance. We blinded ourselves with work and adapted. The fear of losing a job masked the origin of a bigger problem- burnout. Productivity rates did go high but so did the spike in the rates of anxiety, depression and low self-esteem, ultimately affecting the workspace. Issues that aren’t dealt with in the workplace, or more to say ignored.  \n\n While many companies may have started addressing mental health issues, paradoxically, the mental health talk led them to be glued to the screen for another hour.  So, do the employees need more awareness or better implementation of good policies? Here are a few ways suggested by research in which organizations can smoothen the process. These practices will better suit the employees and help them navigate the boundaries between work and family leading to a better mental health status.\n\n A compressed work week - an arrangement whereby employees work longer shifts in exchange for a reduction in the number of working days in their work cycle. This can be beneficial for employees in terms of additional days off work (e.g. longer weekends allowing “mini vacations”) \n\n Part-time arrangements can also allow people with health problems, disabilities or limited disposable time (e.g. students) to participate in the labour force, develop their skills and obtain work experience.\n\n Facilitating re-entry into the workforce for those who have had career breaks — particularly mothers (or fathers) who have stayed at home to raise their children — or provide a gradual exit for employees nearing retirement.\n\nJob sharing is another arrangement which allows two (or sometimes more) employees to jointly fill one fulltime job, with responsibilities and working time shared or divided between them. Job sharing may be appropriate where opportunities for part-time jobs or other arrangements are limited. (Lazǎr et al., 2010)\n\n. However, most importantly, a workplace must ensure a platform for employees/employers to put forth their grievances. A platform that ensures that everyone’s needs are met and are heard of. A platform that facilitates change, growth and well-being. As the saying goes, “Life doesn’t make any sense without interdependence. We need each other, and the sooner we learn that, the better for us all.”  — Erik Erikson ",
      title: 'Workplace, productivity and the pandemic.',
    ),
    Blog(
        author: 'Anoushka Goes',
        url:
            'https://images.unsplash.com/photo-1531984749403-ca6df86463ad?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGxpZmUlMjBvZiUyMGElMjBsaXR0bGUlMjBib3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        // 'https://images.unsplash.com/photo-1548839140-29a749e1cf4d?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ1fF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        text:
            "How and why should we be mindful about our part in a society that stigmatizes, ridicules, secludes the disabled ….  Our body acts as a great symbolic resource to talk about ourselves. Our eyes -windows to the soul. Our tongues - a medium of communication. Our hands- to wave them up high. Our legs- to kick a football to score a perfect goal. Quite often we take our physical capabilities for granted and fail to understand the various embodiments it has in our society. Various meanings are associated with our body types and as a result our experiences with the society are shaped.\n\n To understand this better, this blog is for you to try and look at how people with disabilities frame their identities and negotiate their space in this world. How they are perceived by others and how they perceive themselves.What is it that they face differently than the ones considered ‘normal’ and how abled ones can grow empathetic and make their lives easier.\n\n Meet August Pullman aka Auggie, a 10-year-old boy from the movie ‘WONDER’. He lives with his parents, an elder sister and a dog in New York. Auggie was born with a facial deformity, which he proudly refers to as 'mandibulofacial dysostosis’. He has undergone about 27 surgeries in order to see, smell, speak and hear clearly. (Chbosky, 2017) \n\n This movie very well depicts how people help form the identities of the disabled. The numerous ways in which they are ostracized and stigmatized. As well as the important role a family plays in their lives.\n\n The disabled are discredited and perceived as different, as a deviant, further creating a binary of normal and abnormal. Auggie in the movie lists down his various dreams and aspirations in his introductory statement. He says that he dreams of being out of space just as an ‘ordinary’ person. He loves Minecraft, science and Star Wars but he understands the fact that even if he tried to look better, he will never be perceived as normal / ordinary. The person may very much feel normal when alone. However, these beliefs are broken down as soon as they enter the social realm. It builds in them negative emotions of self- pity, self – hate, sadness and depression. This is evidently seen when they sense an invasion of privacy through the constant stares they receive. Auggie too received millions of stares when he first entered his school which he certainly didn’t like. Stigma from society constantly disgraces the person and it is often related to such physical deformities of the body. Their disabilities embody the fact that they are abnormal and distinct from the rest.\n\n It’s not only about the emotions manipulated by others but the person with such deformities or disabilities also start changing their perception about themselves. As the body is a sole marker of identity and embodies certain attributes of our personality, a lot of times we tend to make certain changes in our body or the way we present ourselves. This changes many times because of the perceptions we think people have of us. In the movie, you will see Auggie appear having a thin braid - a symbolic representation of his fondness for a character from Star Wars (View Image above). However, the braid is cut off by him as soon as his classmates start making fun of it. He starts perceiving himself negatively just because his classmates did so. Hence people may actually make or break the identities or identity markers of the disabled. They make them perceive themselves negatively, different from their positive perceptions when alone.\n\n In order to ‘pass’ as a normal person, people with disabilities engage in different mechanisms. They develop strategies in order to live with acceptance. They either use disidentifiers or they cover up or remove certain special devices they use to keep their traits a secret. Auggie did it by covering his face with a helmet. He also mentions how he loves dressing up for Halloween as people don’t avoid touching or greeting him then.\n\n The disabled aren’t really free of social exclusions, bullying and discrimination. It becomes a part and parcel of their life. They may face discriminations in various institutions such as hospitals, schools, marriage, etc. They may not be welcomed in some or may at times receive so much unwanted attention that they start feeling different from the rest. However, along with them it’s also their family who face constant hate, seclusions and rejections. Sometimes the families may avoid talking about their disabled child in the fear of unpleasant reactions.\n\n Parents engage in a dilemma of when exactly they should disclose the problem to the child. If they do so quite early their child may face severe identity transformations and if they do so too late their child will never be ready for the cruel world. Parents of such kids also tend to take an extraordinary amount of responsibility on their heads. They may give up their jobs, be around them 24/7 and may also neglect their other children as a result. In order to make their kid feel ‘normal’ they take up various roles such as an educator, therapist, advocate, friend and so on and so forth.\n\n Despite all of this, we still see the disabled, the deformed triumphing and content in life. The solution- social support. Auggie enjoyed going to school once he found love and support from his friends. His friends stood by him, fought for him, made him feel welcomed and most importantly made him feel normal. There were bits where he doubted and felt that they were doing so just to be nice but it's part of the process of them questioning every interaction based on past experiences. His classmates later came around and realised that the face is not all that he has. He is more than just that. People are more than just the bodies they possess. \n\n People’s opinions do shape our beliefs and thoughts about ourselves. What it also does is manifest in us the concept of being normal. The attitudes and reactions by people tend to create more stress for the disabled rather than the medical condition itself . We need to acknowledge and be aware of such privileges. However, we must not ignore the steps our society takes in order to involve people with disabilities. Changing times are bringing the world closer and making it more inclusive. We see many educational institutions, organizations and governments taking initiatives to make it a friendly environment for the disabled. Whether it be the Disabilities Act by the government or even WhatsApp having emoticons for them. We must realise that they can't change the way they look but we can very much change the way we see things.",
        title: "Walking through the life of a ‘Wonder’ boy."),
    Blog(
        author: 'Anoushka Goes',
        url:
            'https://images.unsplash.com/photo-1530910417612-701222d79f2f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGhvdWdodHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        // 'https://images.unsplash.com/photo-1598941288672-af25bcc7b223?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDExfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        text:
            "Does language determine our thoughts or thoughts determine our language??\n\nLanguage - a system for combining symbols such as words to produce meaningful statements. It is through this medium of language that we communicate in our day-to-day life. It is this magical ability that we have, where we use different sets of symbols, to plant ideas in others minds, to understand and interpret their responses and to also make logical conclusions. So, what I am doing right now is using a set of words to reach your eyes, to signal your brain to reconstitute these words into thoughts. Language does not only help us communicate with one another but also helps us know each other’s internal mental activity. In short, language could play an important part of how people think and feel. The connection between them has intrigued many scholars; the connection seemed so tight that a few theorists such as Sapir and Whorf went on to say that thought is indeed utterly determined by language. Their ideas suggested that the language we speak influences how we think.\n\n Humans’ thoughts of the world are limited or determined by the language they learn. We are slaves of the words given to us. Language shapes the way we think. The language we speak also influences our thoughts about the world. Different languages represent different ways of thinking. Language thus affects our other activities. For instance, the Hopi language has one word to describe three different things. They have the same word to denote an insect, an aviator, and an airplane. Hence, if a Hopi speaker witnesses an insect flying near an aviator, while looking at an airplane, the person is likely to say that they saw the same thing (word) thrice, whereas an English speaker would claim they saw three different things. Their language does not have any words, expressions related to time. The fact that their language has no time expressions makes it nearly impossible for Hopi speakers to develop a concept of time in their minds. (Patil, 2018)\n\nSteven Pinker was one of the linguistic scholars who sort to disagree on these views. He said that there are many cases of stroke or aphasia victims who lose the power of language and are still capable of thinking without it. In instances where stroke patients have had their ability to speak and understand language back, a number have been able to describe what they were thinking during their language-less period. Pinker sees language as a tool unique to human beings and says that it is an outcome of evolution. Thought isn’t necessarily confined by language. It influences us to an extent but we are not prisoners of it. We can find numerous and better ways to express our thoughts and sharpen our thinking skills. (Charlie, 2013)\n\nSo is it possible to think without the usage of language or is it that we are totally dependent on language and it is impossible to have thoughts without it? The end result of this is not a simple this or that answer. Though, I think words are not always needed to have thoughts. We are perfectly capable of conjuring up visuals and sensations that sometime could be hard to describe. We don’t need language to think but we need language to convey what we think. We need a language to communicate better. It’s because of this, language has existed for a long time. Though if we didn’t have our thoughts to be expressed in the first place, would we really need a set of words? Hence, I would say that both thought and language are interdependent. Both go hand in hand and are the two sides of the same coin. Back to linguistic relativity, I don’t think anyone believes that language of a culture influences thought of people as strongly as Whorf believed. But when you come to think of it, it leaves you questioning everything and never goes away easily. I would like to give an example of my learning process of the French language. The first question that any French student poses is that why does every noun, adjective, object in their language have to have a gender. It seems completely berserk that every specific thing needs a gender which is not something we do in English.It is noticed that people then tend to have thoughts that a feminine word would probably have more female like attributes. So as soon as we see a word, we might first think about what gender-like attributes it denotes. For example in French the word ‘bridge’ is masculine, the French would associate it with adjectives suggesting masculinity such as strong, big, etc. The same word bridge is feminine in German hence they are likely to associate it with female-like qualities. In such a way it shows that a language can influence thoughts.\n\n Language has become a daily part of our life. You can just go near one street’s corner and observe people. The chances that most people are talking with one another are high. Reasonably, something as crucial as talking is sure to leave at least some influence on how we think. We see our politicians manipulating us with their words. Instead of saying “we are sorry we have made mistakes’ they could simply say “mistakes have happened”. Our attention would most probably be diverted to the mistake rather than the culprit. Manipulating thoughts through language can also be seen through marketing and advertising strategies. Also, then there are people who try to change the way we talk “Do not call your friend a nigga”? They do this because they seem to believe a change in the way we talk could result in a change we think. Simply changing the words “I am sad” to “I am depressed” has a different connotational impact altogether, right?\n\n Trying to figure out the relationship between thought and language is as good as saying, “Trying to figure out which came first, the chicken or the egg?”",
        title: "Relationship between thought and language."),
    Blog(
      author: 'Nikos M.',
      url:
          'https://images.unsplash.com/photo-1620147461831-a97b99ade1d3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fG1lbnRhbCUyMGhlYWx0aHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      // 'https://images.unsplash.com/photo-1542639130-c9fadbddcc6b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      text:
          "“The only journey is the journey within.” – Rainer Maria Rilke \n\n WHO statistics indicate that between 76% to 85% of people with mental health issues in low- and middle-income countries receive no treatment. People often avoid or delay seeking help because they are afraid of being treated differently, excluded from society, or bullied. This occurs because prejudice, stigma and discrimination surround mental health and it affects people who suffer from mental illnesses prominently. Regardless of the extent of discrimination, it will cause harm and often aggravate a person's already fleeting mental stability. People with mental illness are often marginalized and discriminated against in many ways, but understanding them and eliminating these problems will help motivate people to get professional help. \n\n Stigma is a social process of labeling, devaluation and discrimination on the basis of physical, emotional and behavioral components. Stigma arises from lack of awareness and knowledge and inaccurate media representation of mental health contributes to it. Steve J. Barnes identifies three main types of stigmas: \n\n Structural stigmatization refers to large organizations that prevent a person from accessing mental assistance.Social stigma is about supporting stereotypes about those suffering from mental illness.\n\nSelf-stigmatization is the internalization of stigma that affects your relationship with yourself and others, it can affect your motivation to recover and your adherence to therapy.\n\n The stigma surrounding mental health disorders is a major problem among the various racial and ethnic communities, making it particularly difficult for people in these communities to access professional assistance. Certain Asian cultures see the search for help as a sign of contempt for cultural values and shame for the family. These communities often misinterpret mental disorders as psychiatric illnesses and such patients are very often neglected or misdiagnosed. Some people mistake mental disorders and demonize sufferers based on irrelevant religious or social beliefs. While some African-Americans are skeptical and distrust the mental health system.\n\n How is stigmatization harmful?\n\n Stigma and discrimination may aggravate mental health disorders and reduce the likelihood of getting professional help. It also adversely affects the recovery process of people diagnosed with serious mental health issues. Stigmatization creates a reluctance to seek assistance and often leads to bullying, physical violence or harassment. One of the major effects of stigmatization is self-doubt as it leads to toxic credibility like 'you'll never get over your disease'. This belief paralyzes an individual and promotes feelings of shame, despair and isolation. Stigmatization is prevalent in workplaces where people have shared concerns about retaliation or being fired if they sought mental health care. Workplace stress affects employees and their mental wellbeing. As observed throughout this pandemic, productivity has increased at the expense of people's mental health. Employees feel obliged to work unsociable hours to maintain their jobs and sustain their families. These have been conspicuous factors contributing to a deterioration in the mental health of employees.\n\n Addressing Stigma\n\n Communication is quintessential to any healthy relationship. Sharing your problems brings solace and warmth. Research shows that having deep and meaningful conversations with someone who is suffering will not only help end stigma, but also provide hope and motivation to get professional help.  The media plays an important role in shaping our thoughts and ideas, accurate and positive media portrayal can help enhance people's current negative perspective about mental health. Shows like BoJack Horseman, Spinning Out, This is Us and One Day at a Time almost accurately describe the life of a person with mental disorders. Here are some ways to trivialize stigma:\n\n- Express yourself: share your problems, normalize mental health discussions.\n- Be compassionate: regardless of an individual's mental or physical health, be compassionate towards everyone.\n- Be attentive: monitor your behavior patterns and report any change.\n- Educate yourself and others: talk about mental health, share facts and correct misinterpretations.\n- Promote equality: treat people equally irrespective of their gender, social status, sexual preference and mental health status.\n- Get help- do not hesitate to ask for help, it is absolutely normal to need someone and there is no shame in admitting that you are in dire need of assistance.\n\n Surveys and researchers have proven that younger populations have a wider exposure to mental health and tend to be more empathetic towards people with mental disorders. We are the future, and as I look to the future, I see us all in a mentally healthier place than we are. A diagnosis does not determine who you are or what you can do. Life is a compilation of some very complicated situations that profoundly affect our mental health and we all need someone who understands what we are experiencing. I understand that stigma makes it extremely hard to confront your issues and get help but all you need is a change of perspective. An important part of loving and understanding yourself involves telling yourself that ‘I'm not okay’. And it is okay to not be okay sometimes, but it's not okay to let yourself believe that you're delusional or to be afraid. This is your fight against you and you shall be victorious. ",
      title: 'Mental Health, Stigma and Getting Professional Help',
    ),
    // Blog(
    //     author: 'Sharvari Kumbhar',
    //     url:
    //         'https://images.unsplash.com/photo-1580428354768-03a028646bc8?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQxfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    //     text:
    //         'The Mind and the Body are not separate; what affects one, affects the other...\n\n Stress has varied meaning for different people under varied conditions. Lazarus and Folkman (1984) defined stress as a specific relationship that a person has to that of the environment which result in terms of threat, danger or deterioration of mental wellbeing.\n\nIn December 2019, the new coronavirus disease 2019 (COVID-2019) started spreading in the Chinese city of Wuhan (Hubei province). The pandemic of Corona Virus (Covid -19) has a huge impact on the whole world. Which is associated with uncertainty hence leading to an increase in testing psychological resilience of the masses. People are going through a myriad of psychological problems in adjusting to the current lifestyles and fear of the disease. The corona virus disease (Covid-19) pandemic is a public health emergency of international concern and poses a challenge to humanity to cope up by countering this potential stressor. A stressor could be any chemical or biological agent, environmental condition, external stimulus or an event seen as causing stress to an organism (Sato, 2006). And it is very important to understand that a stimulus cannot be labelled as a stressor if it doesn’t result into stress. But covid-19 pandemic and lockdown along with other stimulus act as potent stressors.\n\n However, many recent studies aim to analyze varied effects of covid-19 related to clinical aspects, likelihood of survival, genomic characterization of the virus and drugs and therapeutic ways. But majorly lacked the effort in place of psychological element of the present situation and paid least focus on the effects of one of the major aspects of the same pandemic situation that is “lockdown”. Our study exaggerates that covid-19 pandemic, several months lockdown, social distancing, distance learning situation; could be some of the potent stressors for students.\n\nHowever, here comes the role of coping strategies in order to dough the potent stressors of covid-19 pandemic and lockdown. There are broad categories of coping strategies but the most general ones are classified as problem-focused, emotion-focused, approach coping strategies and avoidant coping strategies. Particular strategies are not inherently either good or bad, but instead their value depends on the specific stressor and the situation in which it occurs.\n\n Coping is characterized by the subscales of active coping, positive reframing, planning, acceptance, seeking emotional support, and seeking informational support. Avoidant Coping which is characterized by the subscales of denial, substance use, venting, behavioral disengagement, self-distraction and self-blame. Neither approach nor avoidant coping strategy may include humor or religion which are neither considered as avoidant nor approach in strategy.\n\n Mental illnesses affect 19% of the adult population, 46% of teenagers and 13% of children each year. People struggling with their mental health may be living next to our doors, in your school, college or dorm but only half of those receive the required treatment, often because of the stigma attached to mental health. Untreated, mental illness can contribute to higher medical expenses, poorer performance at school and work, fewer employment opportunities and increased risk of suicide.\n\n This will help people to understand how students suffer from stress and what coping strategies can be used during Covid-19 pandemic lockdown. Learning more about mental health allows us to provide helpful support to those affected in our communities.\n\nA COVID-19 epidemic has been spreading in China and other parts of the world since December 2019. The epidemic has brought not only the risk of death from infection but also unbearable psychological pressure. The pandemic has pushed the global economy into a recession, which means the economy starts shrinking and growth stops.\n\nThe priority for governments and the global community is to prevent people from contracting the disease and to cure those who do. More health awareness spending can save lives both at home and globally.\n\nSince majority of the population is experiencing borderline stress, it is recommended to the academic institution’s counseling service to arrange regular virtual mental health checkups or counseling sessions to counter the same.\n\n It is recommended to the institutions to make effective changes or additions in their curriculum and co-curriculum according to the digitalization demand of the present time, which will help to elevate student’s productivity. \n\nSince the studies show high usage of approach coping strategy to counter the stressors, hence it is recommendable that class teacher/professors engage their students in such activities including active coping, gaining emotional support, use of informational support, positive reframing, planning, etc.\n\n Since there is correlation between stress levels and coping strategy, hence it is recommendable that community services carry out measures like virtual campaigns having agendas like importance of mental health and its preservation through tough times. They are even recommended to provide various services particularly having a foundation of approach coping strategies to counter stress levels that they could provide to their visitors and help them out.',
    //     title: 'Is Coping with Stress A Part of Fighting the Pandemic?'),
  ];

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  final Stream<QuerySnapshot> _blogsStream = FirebaseFirestore.instance
      .collection('blogs')
      .snapshots(includeMetadataChanges: true);

  late Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Amigo()));
            return true;
          },
          child: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: _blogsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return Container(
                    child: Column(
                      children: [
                        // Container(
                        // width: 372,
                        // height: 42,
                        // alignment: Alignment.center,
                        // child: TextField(
                        //   decoration: InputDecoration(
                        //       hintText: 'Search...',
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(10))),
                        // ),
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
                        // ),
                        ListTile(
                          title: Text(
                            'Blogs',
                            style: TextStyle(
                                // color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            'Feeling Happy or Sad? Vent it out with us.',
                            style: TextStyle(
                                // color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 13),
                          ),
                        ),
                        StaggeredGridView.countBuilder(
                          padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          // itemCount: widget.blogs.length,
                          itemCount: snapshot.data!.docs.length,
                          //     .map((DocumentSnapshot document) {
                          //   data = document.data()! as Map<String, dynamic>;
                          // }).length,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.hasData) {
                              return snapshot.data!.docs.length != 0
                                  ? snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                      data = document.data()!
                                          as Map<String, dynamic>;

                                      debugPrint("Blogs: " +
                                          snapshot.data!.docs.length
                                              .toString());
                                      debugPrint(
                                          "Url: " + data!['image'].toString());
                                      debugPrint("Title: " +
                                          data!['title'].toString());
                                      return Container(
                                        child: GestureDetector(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            elevation: 0.0,
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.network(
                                                      data!['image']
                                                          .toString()),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                // Image(image: NetworkImage()),
                                                Container(
                                                  child: Text(
                                                    data!['title'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.03),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BlogDetails(
                                                  blog: data as Blog,
                                                ),
                                              ),
                                            ),
                                          },
                                        ),
                                      );
                                    }).toList() as Widget
                                  : Center(child: CircularProgressIndicator());
                            } else {
                              return Center(
                                  child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                              ));
                            }
                            // return Text('helllo');
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
