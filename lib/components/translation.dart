import 'package:get/get.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
        "about_me": "I am passionate about technology and a self-taught individual by nature. For over 10 years, "
                    "I have been involved in the world of programming, acquiring knowledge and skills through constant practice and research. I have a keen interest in the field of digital electronics and enjoy understanding how things work.\n\n"
                    "I love staying active and exercising, so swimming and kayaking are some of my favorite activities."
                    "In addition, I enjoy the freedom and adventure that traveling on a motorcycle brings, exploring countries and discovering new cultures.\n\n"
                    "With a strong work ethic and dedication to my craft, I have accumulated extensive experience in programming and software development, capable of handling projects of any size and complexity. I am a creative, curious, and passionate individual with the ability to solve problems and find innovative solutions to any challenge that may arise.",
        
        "programming_text":"My programming journey started in 2007 when I began to explore the world of microcontrollers as a self-taught learner. Specifically, one of the first microcontrollers that I used was the PIC16x series from Microchip. "
                           "As I progressed in my learning, I discovered the various possibilities that microcontroller programming offered and realized that this was my true passion.\n\n"
                           "In my early encounters with microcontroller programming, I learned some basic Assembler instructions, which helped me understand how hardware operations worked. "
                           "Later, I continued with the programming language C, using the MPLAB compiler, and completed several learning projects such as a centralized lighting controller, an automatic irrigation system, and an environmental variable monitoring system. These projects allowed me to understand the importance of structured programming and helped me acquire the necessary skills to develop more complex solutions.\n\n"
                           "Over time, my interests in programming expanded into other areas, and I decided to continue my studies in the field of computer science. This led me to obtain a degree in Systems Analysis and Programming, where I continued developing my programming skills, mainly using object-oriented paradigms with Java and Python. "
                           "These languages allowed me to work on more ambitious projects, such as the development of a hotel reservation system and a messaging platform integration, among others.\n\n"
                           "Currently, my favorite language for frontend development is Dart using the Flutter framework, while for backend development, I usually use Python due to its versatility and my extensive experience with it. I am also exploring the Rust language to expand my skills.\n\n"
                           "In conclusion, my beginnings in programming with PIC16x microcontrollers allowed me to discover my passion for programming and develop the skills necessary to tackle new challenges in the field of computer science.",
        
        "soft_skills_text":"From my perspective, soft skills are a fundamental aspect for personal and professional growth. I have realized that throughout my life, these skills have naturally developed through the experiences I have lived. Both in my work life and in my daily life, I have learned to handle difficult situations effectively and to find creative solutions to complex problems.\n\n"
                           "Although I have always been a reserved person, I have learned to manage this characteristic of my personality more effectively over time. I have discovered that open and honest communication is essential for the success of any project, and I have worked to improve my communication skills to be able to convey my ideas clearly and effectively.\n\n"
                           "Throughout my career, I have played different roles, from employee to entrepreneur and project leader. These experiences have given me the opportunity to develop a wide range of soft skills, such as teamwork, conflict resolution, and the ability to motivate others to achieve common goals.\n\n"
                           "I have also faced difficult moments in my life, like most people. However, I have learned to overcome these obstacles with resilience and determination. These experiences have taught me the importance of being an empathetic and understanding leader, capable of supporting others in difficult times and fostering a positive and collaborative work environment.\n\n"
                           "Although I still have much to learn and improve in terms of soft skills, I am confident that I have the ability to lead projects and achieve goals both individually and as part of a team. I believe that with a positive attitude, an open mindset, and a strong commitment, I can continue to grow and develop these skills to be a more effective and successful leader in the future.",
        
        "sysadmin_text":"My interest in the world of systems administration were in 2008 thanks to the Hack x Crack notebooks, which I read and kept on hand to practice with. I got them in PDF format since they were no longer for sale by that time, but much of their content remains valid to this day.\n\n"
                        "Although as a full stack developer I have not delved so much into this area, my work experience from 2010 to 2012 introduced me to the world of servers. I performed RAID configurations on IBM and HP servers, also installed and configured operating systems, remote access and monitoring tools on both Windows Server and Linux operating systems.\n\n"
                        "In addition, I completed a networking course where I learned the theoretical concepts, but in the workplace, I gained experience configuring Cisco routers, hardware firewalls, and VLANs on Cisco switches. I have also had experience setting up complete racks where I had to connect UTP and fiber optic patches, and configure and install the corresponding operating system.\n\n"
                        "Currently, I have deepened my studies in web servers and have put into practice a cluster in Kubernetes. I also have experience with some services on the Google Cloud platform.\n\n"
                        "My work experience and interest in continuous learning have allowed me to acquire knowledge and skills in systems administration, which has given me a broader vision of the world of technology and enabled me to effectively solve problems.",
        
        "full_stack_text":"To me, being a full stack developer is a challenging and exciting task that involves being able to carry out all the necessary tasks to create a complete application ready for its intended audience. In my case, not only web applications, but also mobile and embedded systems.\nFrom designing and implementing the front-end to managing servers and deployment.",
        
        "frontend_text":"As a frontend developer, our main responsibility is to create a pleasant user experience for the application we are building. This involves paying attention to user experience, design, and performance. To achieve this, it's necessary to observe the project from different perspectives, considering it as a whole, which can be quite challenging.\n\n"
                        "The client-side application requires much more than just design and user interface. It's also important to make efficient connections with the backend, use technologies for data persistence, process data, and present real information to the user. "
                        "In addition, it's necessary to implement an adequate structure and keep the interface logic separate from the logic for data acquisition and processing. To all of this, we must add the consideration of aspects such as performance, compatibility, accessibility, testing, and finally, the implementation of a maintenance and update structure.\n\n"
                        "In summary, as a frontend developer, we must focus on creating a pleasant user experience, paying attention to design and performance. We must consider the application as a whole and observe it from different perspectives.",
        
        "backend_text":"As a backend developer, I have learned that one of the most important things is knowing how to implement a solid and scalable architecture. While there are many aspects to consider, such as performance and security, I believe that without a solid architecture to back it up, everything else is meaningless.\n\n"
                       "From my perspective, the implementation of well-defined microservices and a well-structured database are the pillars of an effective backend system. Microservices are a way to divide an application into smaller, more manageable components, which makes scalability and maintenance easier. "
                       "On the other hand, a good database design is crucial to ensure that data is stored efficiently and can be retrieved quickly.\n\n"
                       "Additionally, as a backend developer, I have also learned the importance of working collaboratively with other members of the development team, especially with frontend developers. Communication and collaboration are crucial to ensuring that the system runs smoothly and that project goals are met.",
        
        "deployment_text":"My experience with my own entrepreneurship has taught me that deploying an application in the real world is not a task for a single individual. It is necessary to take into account many aspects, such as security, performance, scalability, and accessibility of the application. Additionally, it is essential to work with the development team to achieve continuous integration, which ensures that the code is integrated and tested constantly as it is developed, reducing time and risks associated with deployment.\n\n"
                          "Once the application has been developed and the necessary tests have been carried out, it is time to deploy it. However, this process requires proper planning to ensure that everything works correctly in a production environment.\n\n"
                          "Furthermore, once the application is in production, it is necessary to manage it properly to ensure that it continues to function smoothly and that necessary updates and maintenance are carried out. This may involve monitoring performance, identifying and resolving issues, implementing improvements and updates, and managing scalability to handle increases in traffic or workload.\n\n",
        
        "electronic_text":"I began my interest in electronics at the age of 9, reading the electronics section of an encyclopedia and experimenting with batteries and DC motors. I took a one-year course where I learned the fundamentals of analog electronics and experimented with components such as transistors and diodes. Then, I continued experimenting with basic integrated circuits such as the 555 timer and built circuits on PCB using components such as logic gates and shift registers. After several years, I acquired the necessary knowledge to experiment with microcontrollers, which was a major milestone in my life. The first code I wrote was in assembler and it was exciting to replicate the behavior of a 555 timer on a microcontroller.\n\n"
                          "In 2013, I built a CNC router using parts from discarded printers for my thesis project. The CNC software I developed had a graphical interface to create shapes and materialize them using my rudimentary CNC connected to the old parallel port (printer port). Although electronics started as a hobby for me, I made a camera switch for quick access that was installed on a catamaran. I also experimented with MicroPython and the Arduino IDE on embedded systems such as the ESP8266 and ATmega2560",
        
        "about_me_title":", Personal Information",
        "about":"About Me",
        "_age":"Age: ",
        "_profession":"Profession: ",
        "_nationality":"Nationality: ",
        "_current_residence":"City of Residence: ",
        "age":"Age: 32 years.",
        "profession":"Full Stack Developer",
        "nationality":"Argentinian.",
        "current_residence":"Posadas, Misiones, Argentina",
        "programming": "Programming",
        "electronic":"Electronic",
        "sysadmin":"Systems Administrator",
        "soft_skills":"Soft Skills",
        // ChartProgOptions
        "languages":"Languages",
        "queryLanguages":"Query Languages",
        "paradigms":"Paradigms",
        // ChartProgParadigms
        "objectOriented":"Object Oriented (POO)",
        "concurrent":"Concurrent",
        "reactive":"Reactive",
        "parallel":"Parallel",
        "funcional":"Funcional",
        "declarative":"Declarative",
        "serviceOriented":"Service Oriented",
          // Drawer
         "_about_me":"About Me",
         "_knowledge":"Knowledge",
         "_experience":"Experience",
         "_projects":"Projects",
         "_contact":"Contact",
         //Full stack developer Frame
         "full_stack_developer":"Full Stack Developer",
         "frontend":"Frontend",
         "backend":"Backend",
         "deployment_management":"Deployment Management",

         "structure_planification":"Structure Planification",
         "database_design":"Database Design",
         "security_implementation":"Security Implementation",

         "ux":"User experience",
         "ui":"User interface",
         "performance":"Performance",

         "deployment_structure":"Deployment Structure",
         "ci":"Continuous Integration",
         "cd":"Continuous Delivery",

         //TimeLine 
         "qualitech_title": "Qualitech",
         "overup_title": "OverUp",
         "cyberlink_title": "Cyberlink",
         "independent_title": "Independent",
         "guazuapp_title": "GuazuApp",
         // TimeLine centerText
         "qualitech_years":"2011 - 2013",
         "overUp_years":"2015 - 2017",
         "cyberlink_years":"2017 - 2018",
         "independent_years":"2018 - 2020",
         "guazuapp_years":"Present",
         // TimeLine rightTitle
         "qualitech_right_title":"IT solutions",
         "overUp_right_title":"IT solutions",
         "cyberlink_right_title":"IT company",
         "independent_right_title":"Independent full-stack developer",
         "guazuapp_right_title":"Multichannel messaging system",
         // TimeLine rightSubTitle
         "qualitech_right_subtitle":"Role: Network and systems technician.",
         "overUp_right_subtitle":"Role: Co-founder and software developer and eventually expanded into electronics.",
         "cyberlink_right_subtitle":"Role: General technician in the support area.",
         "independent_right_subtitle":"",
         "guazuapp_right_subtitle":"Role: Co-founder, full-stack developer, and development leader.",
         // TimeLine rightThirdLine
         "qualitech_third_line":"Website: https://qualitech.com.ar/",
         "overUp_third_line":"",
         "cyberlink_third_line":"Website: https://cyberlink.com.ar/",
         "independent_third_line":"",
         "guazuapp_third_line":"Web app: https://app.guazuapp.com.",
         // TimeLine rightFourthLine
         "qualitech_fourth_line":"",
         "overUp_fourth_line":"",
         "cyberlink_fourth_line":"",
         "independent_fourth_line":"",
         "guazuapp_fourth_line":"Android app: https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp",

        },
        'es': {
          "about_me":
                    "Soy un apasionado de la tecnología y un autodidacta por naturaleza. Desde hace más de 10 años, "
                    "he he estado involucrado en el mundo de la programación, adquiriendo conocimientos y habilidades a través de la práctica y la investigación constante. Me interesa mucho el campo de la electrónica digital y disfruto entendiendo cómo funcionan las cosas.\n\n"
                    "Me encanta mantenerme activo y hacer ejercicio, por lo que la natación y el kayak son algunas de mis actividades favoritas. "
                    "Además, disfruto de la libertad y la aventura que proporciona viajar en motocicleta, recorriendo países y descubriendo nuevas culturas.\n\n"
                    "Con una fuerte ética de trabajo y dedicación a mi oficio, he logrado acumular una vasta experiencia en la programación y el desarrollo de software, siendo capaz de manejar proyectos de cualquier tamaño y complejidad. Soy una persona creativa, curiosa y apasionada, con la capacidad de resolver problemas y encontrar soluciones innovadoras para cualquier desafío que se presente.",
                   
          "programming_text":"Mis inicios de la programacion comenzaron en 2007 cuando empece a emprender como autodidacta con los microcontroladores para ser preciso unos de los primeros fueron los de la serie PIC16x de la marca Microchip. Aprendí algunas instruciones basicas de Assembler y posteriormente continue con C utilizando el compilador de Mplab relaice varios proyectos de aprendisaje.\n\n"
                             "Posteriomente continue mis estudios de nivel terciario con la titulacion de Analista de sistema y programacion, donde continue desarrollando mis avilidades de  con programacion con los paradigmas orientado a object utilizando java y python.\n\n"
                             "Recuerdo que uno de los primeros microcontroladores que utilicé fueron los de la serie PIC16x de la marca Microchip. A medida que avanzaba en mi aprendizaje, fui descubriendo las distintas posibilidades que ofrecía la programación de microcontroladores, y pronto me di cuenta de que esto era lo que realmente me apasionaba.\n"
                             "En mis primeros acercamientos a la programación de microcontroladores, aprendí algunas instrucciones básicas de Assembler, lo que me permitió entender cómo funcionaban las operaciones a nivel de hardware. "
                             "Posteriormente, continué con el lenguaje de programación C, utilizando el compilador de MPLAB, y realicé varios proyectos de aprendizaje, como por ejemplo, un controlador de iluminacion centralizado, un sistema de riego automático y un sistema de monitoreo de variables ambientales. "
                             "Estos proyectos me permitieron entender la importancia de la programación estructurada y me ayudaron a adquirir las habilidades necesarias para desarrollar soluciones más complejas.\n\n"
                             "Con el tiempo, mis intereses en la programación se expandieron hacia otras áreas, y decidí continuar mis estudios en el ámbito de la informática. Fue así como obtuve la titulación de Analista de Sistemas y Programación, donde seguí desarrollando mis habilidades de programación, principalmente utilizando los paradigmas orientados a objetos con Java y Python. "
                             "Estos lenguajes me permitieron trabajar en proyectos más ambiciosos, como el desarrollo de una un sistema de reservas para hoteles, una plataforma de integracion de plataformas de mensajeria, entre otros.\n\n"
                             "En la actualidad, mi lenguaje favorito para el desarrollo de frontend es Dart utilizando el framework Flutter, mientras que para el backend suelo utilizar Python debido a su versatilidad y mi amplia experiencia con el. Aunque también estoy explorando el lenguaje Rust para expandir mis habilidades.\n\n"
                             "En conclusión, mis inicios en la programación con los microcontroladores PIC16x me permitieron descubrir mi pasión por la programación y desarrollar las habilidades necesarias para enfrentar nuevos desafíos en el ámbito de la informática.",
          
          "soft_skills_text":"Desde mi perspectiva, las habilidades blandas son un aspecto fundamental para el crecimiento personal y profesional. "
                        "Me he dado cuenta de que, a lo largo de mi vida, estas habilidades se han ido desarrollando de manera natural a través de las experiencias que he vivido. Tanto en mi vida laboral como en mi día a día, he aprendido a manejar situaciones difíciles de forma efectiva y a encontrar soluciones creativas a problemas complejos.\n\n"
                        "Si bien siempre he sido una persona reservada, he aprendido a gestionar esta característica de mi personalidad de una manera más efectiva con el tiempo. He descubierto que la comunicación abierta y honesta es esencial para el éxito de cualquier proyecto, y me he esforzado por mejorar mis habilidades de comunicación para poder transmitir mis ideas de manera clara y efectiva.\n\n"
                        "A lo largo de mi carrera, he desempeñado diferentes roles, desde empleado hasta emprendedor y líder de proyectos. Estas experiencias me han brindado la oportunidad de desarrollar una amplia gama de habilidades blandas, como el trabajo en equipo, la resolución de conflictos y la capacidad de motivar a otros para lograr objetivos comunes.\n\n"
                        "También he enfrentado momentos difíciles en mi vida, como la mayoría de las personas. Sin embargo, he aprendido a superar estos obstáculos con resiliencia y determinación. Estas experiencias me han enseñado la importancia de ser un líder empático y comprensivo, capaz de apoyar a otros en momentos difíciles y de fomentar un ambiente de trabajo positivo y colaborativo.\n\n"
                        "Si bien todavía tengo mucho por aprender y mejorar en términos de habilidades blandas, estoy seguro de que tengo la capacidad de liderar proyectos y alcanzar objetivos tanto individualmente como en equipo.\n\n"
                        "Creo que, con una actitud positiva, una mentalidad abierta y un fuerte compromiso, puedo seguir creciendo y desarrollando estas habilidades para ser un líder más efectivo y exitoso en el futuro.",
          
          "sysadmin_text":"Mi interes en el mundo de la administración de sistemas fueron en 2007 gracias a los cuadernos de Hack x Crack, los cuales leía y tenía a mano para poner en práctica. Los conseguí en formato PDF ya que para esa fecha ya no estaban a la venta, pero gran parte de su contenido sigue siendo válido hasta hoy en día.\n\n"
                          "Aunque como desarrollador full stack no he profundizado tanto en esta área, mi experiencia laboral de 2010 a 2012 me introdujo en el mundo de los servidores. Realicé configuraciones de RAID en servidores IBM y HP, también he instalado y configurado sistemas operativos, herramientas de acceso remoto y de monitoreo tanto en sistemas operativos Windows Server como Linux.\n\n"
                          "Además, he realizado un curso de redes donde aprendí los conceptos teóricos, pero en el campo laboral tuve la experiencia de configurar routers Cisco, hardware firewalls y VLANs en switches Cisco. También he tenido la experiencia de montar racks completos donde tenía que conectar los parches UTP y de fibra óptica, y configurar e instalar el sistema operativo correspondiente.\n\n"
                          "Actualmente he profundizado mis estudios en web servers y he puesto en practica un cluster en kubernets, tambien tengo experiencia con algunos servicios de la plataforma Google Clound.\n\n"  
                          "Mi experiencia laboral y mi interés en el aprendizaje constante me han permitido adquirir conocimientos y habilidades en la administración de sistemas, lo que me ha permitido tener una visión más amplia del mundo de la tecnología y ser capaz de resolver problemas de manera efectiva.",
          
          "full_stack_text":"Para mí, ser un desarrollador full stack es una tarea desafiante y emocionante que implica ser capaz de llevar a cabo todas las tareas necesarias para crear una aplicación completa y lista para su público destinado. En mi caso, no solo aplicaciones web, sino también móviles y en sistemas embebidos.\nDesde el diseño y la implementación del front-end hasta la gestión de servidores y el despliegue.",
          
          "frontend_text":"Como desarrollador frontend, nuestra principal responsabilidad es crear una experiencia agradable para el usuario de la aplicación que estamos creando. "
                           "Esto implica prestar atención a la experiencia del usuario, al diseño y al rendimiento. Para lograrlo, es necesario observar el proyecto desde diferentes perspectivas, considerándolo como un todo, lo cual puede resultar todo un reto.\n\n"
                           "La aplicación cliente requiere mucho más que solo diseño e interfaz de usuario. También es importante realizar conexiones eficientes con el backend, utilizar tecnologías para la persistencia de datos, procesar datos y representar información real al usuario. "
                           "Además, es necesario implementar una estructura adecuada y mantener la lógica de la interfaz separada de la lógica para la adquisición y procesamiento de datos, a todo esto le sumamos que se tiene que tener en cuenta aspectos como el rendimiento, compatibilidad, accessibilidad, pruebas y para finalizar implementar una estructura de mantenimento y actualizacion.\n\n"
                           "En resumen, como desarrollador frontend debemos enfocarnos en crear una experiencia de usuario agradable, prestando atención al diseño y al rendimiento. Debemos considerar la aplicación como un todo y observarla desde diferentes perspectivas.",
          
          "backend_text": "Como desarrollador backend, he aprendido que una de las cosas más importantes es saber cómo implementar una arquitectura sólida y escalable. Si bien es cierto que hay muchos aspectos a tener en cuenta, como el rendimiento y la seguridad, considero que sin una arquitectura sólida que lo respalde, todo lo demás carece de validez.\n\n"
                          "Desde mi perspectiva, la implementación de microservicios bien definidos y una buena estructuración de la base de datos son los pilares de un sistema backend eficaz. Los microservicios son una forma de dividir una aplicación en componentes más pequeños y manejables, lo que facilita la escalabilidad y el mantenimiento. Por otro lado, una buen diseño de la base de datos es fundamental para garantizar que los datos se almacenen de manera eficiente y se puedan recuperar de manera rápida.\n\n"
                          "Además, como desarrollador backend, también he aprendido la importancia de trabajar de manera colaborativa con otros miembros del equipo de desarrollo, especialmente con los desarrolladores frontend. La comunicación y la colaboración son fundamentales para garantizar que el sistema funcione sin problemas y que se cumplan los objetivos del proyecto.",
          
          "deployment_text":"Mi experiencia con mi propio emprendimiento me ha enseñado que desplegar una aplicación en el mundo real no es tarea de un solo individuo. Es necesario tener en cuenta muchos aspectos, como la seguridad, el rendimiento, la escalabilidad y la accesibilidad de la aplicación. Además, es fundamental trabajar con el equipo de desarrollo para lograr una integración continua, que garantice que el código se integre y pruebe constantemente a medida que se desarrolla, lo que reduce el tiempo y los riesgos asociados al despliegue.\n\n"
                            "Una vez que se ha desarrollado la aplicación y se han realizado las pruebas necesarias, llega el momento de desplegarla. Sin embargo, este proceso requiere de una planificación adecuada para garantizar que todo funcione correctamente en un entorno de producción.\n\n"
                            "Además, una vez que la aplicación está en producción, es necesario gestionarla adecuadamente para garantizar que siga funcionando sin problemas y que se realicen las actualizaciones y mantenimientos necesarios. Esto puede implicar la supervisión del rendimiento, la identificación y resolución de problemas, la implementación de mejoras y actualizaciones, y la gestión de la escalabilidad para manejar aumentos en el tráfico o la carga de trabajo.",
          
          "electronic_text":"Comencé mi interés por la electrónica a los 9 años, leyendo la sección de electrónica de una enciclopedia y experimentando con pilas y motores DC. Tomé un curso de un año donde aprendí los fundamentos de la electrónica analógica y experimenté con componentes como transistores y diodos. Luego, seguí experimentando con circuitos integrados básicos como el CI 555 y construí circuitos en PCB utilizando componentes como compuertas lógicas y registros de desplazamiento. Después de varios años, adquirí los conocimientos necesarios para experimentar con microcontroladores, lo que fue un hito importante en mi vida. El primer código que escribí fue en Assembler y fue emocionante replicar el comportamiento de un temporizador 555 en un microcontrolador.\n\n"
                       "En 2013, construí un router CNC con partes de impresoras de descarte para mi proyecto de tesis. El software CNC que desarrollé tenía una interfaz gráfica para realizar formas y materializarlas mediante mi rudimentario CNC conectado al antiguo puerto paralelo (puerto de impresora). Aunque la electrónica comenzó como un hobby para mí, realicé un conmutador de cámaras para acceso rápido que se instaló en una embarcación (Catamarán). También he experimentado con MicroPython y la IDE de Arduino en sistemas embebidos como el ESP8266 y el ATmega2560",
        "about_me_title":", Información personal",
          "about":"Sobre Mí",
          "_age":"Edad: ",
          "_nationality":"Nacionalidad: ",
          "_profession":"Profesión: ",
          "_current_residence":"Ciudad de Residencia: ",
          "age":"32 años.",
          "nationality":"Argentino.",
          "profession":"Full Stack Developer",
          "current_residence":"Posadas, Misiones, Argentina",
          "programming": "Programación",
          "electronic":"Electrónica",
          "sysadmin":"Administrador de sistemas",
          "soft_skills":"Habilidades blandas",
          // ChartProgOptions
         "languages":"Lenguajes",
         "queryLanguages":"Lenguajes de consulta",
         "paradigms":"Paradigmas",
          // ChartProgParadigms
          "objectOriented":"Orientada a objectos (POO)",
          "concurrent":"Concurrente",
          "reactive":"Reactiva",
          "parallel":"Paralelo",
          "funcional":"Funcional",
          "declarative":"Declarativo",
          "serviceOriented":"Orientada a Servicio",
         // Drawer
         "_about_me":"Sobre Mí",
         "_knowledge":"Conocimientos",
         "_experience":"Experiencia",
         "_projects":"Projectos",
         "_contact":"Contacto",

         //Full stack developer Frame
         "full_stack_developer":"Desarrollador Full Stack",
         "frontend":"Interfaz",
         "backend":"Back-end",
         "deployment_management":"Gestión de Despliegue",

         "structure_planification":"Planificación de la Estructura",
         "database_design":"Diseño de Base de Datos",
         "security_implementation":"Implementación de Seguridad",

         "ux":"Experiencia de Usuario",
         "ui":"Interfaz de Usuario",
         "performance":"Performance",

         "deployment_structure":"Estructura de Despliegue",
         "ci":"Integración Continua",
         "cd":"Entrega Continua",

         //TimeLine 
         "qualitech_title": "Qualitech",
         "overup_title": "OverUp",
         "cyberlink_title": "Cyberlink",
         "independent_title": "Independiente",
         "guazuapp_title": "GuazuApp",
         // TimeLine centerText
         "qualitech_years":"2011 - 2013",
         "overUp_years":"2015 - 2017",
         "cyberlink_years":"2017 - 2018",
         "independent_years":"2018 - 2020",
         "guazuapp_years":"Actualidad",
         // TimeLine rightTitle
         "qualitech_right_title":"Soluciones informáticas",
         "overUp_right_title":"Soluciones informáticas",
         "cyberlink_right_title":"Empresa de informática",
         "independent_right_title":"Desarrollador full stack independiente",
         "guazuapp_right_title":"Sistema de mensajería multicanal",
         // TimeLine rightSubTitle
         "qualitech_right_subtitle":"Rol: Técnico en redes y sistemas.",
         "overUp_right_subtitle": "Rol: Socio fundador, desarrollador de software y, eventualmente, en el área de electrónica.",
         "cyberlink_right_subtitle":"Rol: Técnico general en el área de soporte.",
         "independent_right_subtitle":"",
         "guazuapp_right_subtitle":"Rol: Socio fundador, desarrollador full stack y líder de desarrollo.",
         // TimeLine rightThirdLine
         "qualitech_third_line":"Página web: https://qualitech.com.ar/",
         "overUp_third_line":"",
         "cyberlink_third_line":"Página web: https://cyberlink.com.ar/",
         "independent_third_line":"",
         "guazuapp_third_line":"Aplicación web: https://app.guazuapp.com.",
         // TimeLine rightFourthLine
         "qualitech_fourth_line":"",
         "overUp_fourth_line":"",
         "cyberlink_fourth_line":"",
         "independent_fourth_line":"",
         "guazuapp_fourth_line":"Aplicación para Android: https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp",
          
          // Projects
          
          // title
          "cnc_cad_title":"",
          "quick_camerea_title":"",
          "nordeste_api_title":"",
          "guazuApp_title":"",
          "myResume_title":"",
          //subtitle
          "cnc_cad_subtitle":"",
          "quick_camerea_subtitle":"",
          "nordeste_api_subtitle":"",
          "guazuApp_subtitle":"",
          "guazuApp_myResume":"",
          //text
          "cnc_cad_text":"",
          "quick_camerea_text":"",
          "nordeste_api_text":"",
          "guazuApp_text":"",
          "myResume_text":"",
          //link1
          "cnc_cad_name_link1":"",
          "quick_camerea_name_link1":"",
          "nordeste_api_name_link1":"",
          "guazuApp_name_link1":"",
          "myResume_name_link1":"",
          //link2
          "cnc_cad_name_link2":"",
          "quick_camerea_name_link2":"",
          "nordeste_api_name_link2":"",
          "guazuApp_name_link2":"",
          "myResume_name_link2":"",

        }
      };
}
