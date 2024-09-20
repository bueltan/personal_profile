import 'package:get/get.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "about_me": "With over 10 years of programming experience, I have honed my skills and expanded my knowledge through practical work and continuous learning. My deep interest in software and understanding system functionalities has driven me to explore this field extensively.\n" +
              "Beyond my professional endeavors, I prioritize staying active with activities such as swimming and kayaking. I also enjoy traveling by motorcycle, which allows me to experience diverse cultures and landscapes.\n" +
              "With a strong work ethic and dedication, I bring experience in software development and managing projects of various sizes. I am committed to problem-solving and finding innovative solutions to the technical challenges I face.",
          
          "programming_text": "I started programming in 2007, initially working with Microchip's PIC16x microcontrollers. I learned basic Assembler instructions and later continued with C using the MPLAB compiler, working on various learning projects.\n\n" +
              "Later, I completed tertiary studies in Systems Analysis and Programming, where I developed additional skills in object-oriented programming with Java and Python.\n\n" +
              "In my early projects with microcontrollers, I learned basic Assembler instructions, which facilitated my understanding of hardware-level operation. Using C and MPLAB, I worked on projects like a centralized lighting controller, an automatic irrigation system, and an environmental monitoring system. These projects helped me grasp structured programming and develop skills for more complex solutions.\n\n" +
              "Over time, I expanded my interests into other areas of computing, obtaining a Systems Analyst and Programming qualification. This allowed me to work on more ambitious projects, using Java and Python to develop a hotel reservation system and a messaging integration platform, among others.\n\n" +
              "Currently, my preferred language for frontend development is Dart with the Flutter framework, while for the backend I use Python due to its versatility and my experience with it. I am also exploring the Rust language to diversify my skills.\n\n" +
              "In summary, my beginnings with PIC16x microcontrollers allowed me to discover my interest in programming and develop the skills needed to tackle challenges in the field of computing.",

          "soft_skills_text": "Soft skills are crucial for personal and professional growth. Over time, I have observed that these skills naturally develop through various experiences. In my work and daily life, I have learned to handle difficult situations effectively and find creative solutions to complex problems.\n\n" +
              "Although I was originally reserved, I have managed this trait more effectively over time. Open and honest communication is essential for any project's success, and I have worked on improving my communication skills to convey my ideas clearly and effectively.\n\n" +
              "I have taken on various roles throughout my career, from employee to entrepreneur and project leader. These experiences have allowed me to develop a wide range of soft skills, such as teamwork, conflict resolution, and motivating others to achieve common goals.\n\n" +
              "I have faced challenging moments and learned to overcome them with resilience and determination. These experiences have highlighted the importance of being an empathetic and understanding leader, capable of supporting others in difficult times and fostering a positive and collaborative work environment.\n\n" +
              "While I acknowledge that there are still areas to improve in soft skills, I am confident in my ability to lead projects and achieve goals both individually and as part of a team. With a positive attitude, an open mindset, and a strong commitment, I am sure I can continue developing these skills to become a more effective and successful leader in the future.",

          "sysadmin_text": "My interest in system administration began in 2007 when I read the Hack x Crack notebooks. Although these documents were no longer for sale, I obtained PDF versions that still contain relevant content today.\n\n" +
              "Although I did not specialize completely in this area as a full stack developer, my work experience between 2010 and 2012 introduced me to server environments. I performed RAID configurations on IBM and HP servers and installed and configured operating systems, remote access tools, and monitoring tools on Windows Server and Linux systems.\n\n" +
              "Additionally, I completed a networking course that provided theoretical concepts. In the workplace, I gained experience configuring Cisco routers, hardware firewalls, and VLANs on Cisco switches. I also assembled full racks, connecting UTP and fiber optic cables, and configuring and installing the corresponding operating systems.\n\n" +
              "Currently, I have expanded my knowledge in web servers and implemented a cluster in Kubernetes. I also have experience with various Google Cloud services.\n\n" +
              "My experience and interest in continuous learning have allowed me to acquire skills in system administration, giving me a broader view of the tech world and the ability to solve problems effectively.",

          "full_stack_text":
              "As a full stack developer, I handle the entire lifecycle of an application, from UI design to server implementation and management. This includes both front-end and back-end development, as well as integration and deployment across various environments. My experience covers web, mobile, and embedded systems applications, ensuring complete and functional solutions for each project.",

          "frontend_text":
              "As a frontend developer, my main goal is to create an engaging and efficient user experience. This involves not only designing visually appealing interfaces but also ensuring optimal performance and seamless integration with the backend.\n\nFrontend development goes beyond design. It involves building effective connections with the backend, managing data persistence, and processing and presenting information to the user accurately. It is essential to maintain a clear structure that separates user interface logic from data handling logic.\n\nAdditionally, aspects like performance, compatibility, accessibility, and testing need to be considered, along with establishing a plan for ongoing maintenance and updates.\n\nIn summary, the role of a frontend developer is to deliver a comprehensive user experience, paying attention to both design and functionality and ensuring the application's performance.",

          "backend_text":
              "As a backend developer, my main focus is on creating a solid and scalable architecture. Implementing well-defined microservices and efficient database design are key to achieving an effective backend system. Microservices divide the application into manageable components, facilitating scalability and maintenance, while good database design ensures efficient data storage and retrieval.\n\n" +
                  "It is also crucial to collaborate closely with frontend developers to ensure the system functions smoothly and project goals are met.",

          "deployment_text":
              "My experience with my own venture has shown me that deploying an application requires a collaborative approach. It's essential to consider security, performance, scalability, and accessibility. Working with the development team for continuous integration helps reduce risks and time during deployment.\n\n" +
                  "Once deployed, the application needs proper management, including performance monitoring, problem resolution, and maintenance to ensure continuous operation and handle increases in traffic or workload.",

          "electronic_text":
              "My interest in electronics began at age 9, experimenting with batteries and motors. I studied analog electronics and worked with components like transistors and diodes. Later, I built circuits with basic ICs and microcontrollers, writing my first code in Assembler.\n\n" +
                  "In 2013, I developed a CNC router for my thesis and a software with a graphical interface to control shapes with the CNC. While electronics started as a hobby, I also created a camera switch for a catamaran and worked with MicroPython and Arduino on embedded systems like the ESP8266 and ATmega2560.",
          "about_me_title": "Personal Information",
          "about": "About Me",
          "_age": "Age: ",
          "_profession": "Profession: ",
          "_nationality": "Nationality: ",
          "_current_residence": "City of Residence: ",
          "age": " %age years.",
          "profession": "Full Stack Developer",
          "nationality": "Argentinian.",
          "current_residence": "Las Grutas, Rio Negro, Argentina",
          "programming": "Programming",
          "electronic": "Electronic",
          "sysadmin": "Systems Administrator",
          "soft_skills": "Soft Skills",
          // ChartProgOptions
          "languages": "Languages",
          "queryLanguages": "Query Languages",
          "paradigms": "Paradigms",
          // ChartProgParadigms
          "objectOriented": "Object Oriented (POO)",
          "concurrent": "Concurrent",
          "reactive": "Reactive",
          "parallel": "Parallel",
          "functional": "Functional",
          "declarative": "Declarative",
          "serviceOriented": "Service Oriented",
          // Drawer
          "_about_me": "About Me",
          "_knowledge": "Skills",
          "_experience": "Experience",
          "_projects": "Projects",
          "_contact": "Contact",
          //Full stack developer Frame
          "full_stack_developer": "Full Stack Developer",
          "frontend": "Frontend",
          "backend": "Backend",
          "deployment_management": "Deployment Management",

          "structure_planning": "Structure Planning",
          "database_design": "Database Design",
          "security_implementation": "Security Implementation",

          "ux": "User experience",
          "ui": "User interface",
          "performance": "Performance",

          "deployment_structure": "Deployment Structure",
          "ci": "Continuous Integration",
          "cd": "Continuous Delivery",

          //TimeLine
          "qualitech_title": "Qualitech",
          "overup_title": "OverUp",
          "cyberlink_title": "Cyberlink",
          "independent_title": "Independent",
          "guazuapp_title": "GuazuApp",
          "ghp_title": "Gilson H. P.",
          "foxy_title": "Foxy Project",

          // TimeLine centerText
          "qualitech_years": "2011 - 2013",
          "overUp_years": "2015 - 2017",
          "cyberlink_years": "2017 - 2018",
          "independent_years": "2018 - 2020",
          "guazuapp_years": "2021 - 2023",
          "ghp_years": "2023 - 2024",
          "foxy_years": "Present",

          // TimeLine rightTitle
          "qualitech_right_title": "IT solutions",
          "overUp_right_title": "IT solutions",
          "cyberlink_right_title": "IT company",
          "independent_right_title": "Independent full-stack developer",
          "guazuapp_right_title": "Multichannel messaging system",
          "ghp_right_title": "Full-stack developer",
          "foxy_right_title":
              "Real-Time Web and Video Scraping for Data Extraction",

          // TimeLine rightSubTitle
          "qualitech_right_subtitle": "Role: Network and systems technician.",
          "overUp_right_subtitle":
              "Role: Co-founder and software developer and eventually expanded into electronics.",
          "cyberlink_right_subtitle":
              "Role: General technician in the support area.",
          "independent_right_subtitle": "",
          "guazuapp_right_subtitle":
              "Role: Co-founder, full-stack developer, and development leader.",
          "ghp_right_subtitle":
              "Full Stack Developer and CareCart Lead Project",
          "foxy_right_subtitle": "Role: Developer Founder",

          // TimeLine rightThirdLine
          "qualitech_third_line": "Website: https://qualitech.com.ar/",
          "overUp_third_line": "",
          "cyberlink_third_line": "Website: https://cyberlink.com.ar/",
          "independent_third_line": "",
          "guazuapp_third_line": "Web app: %DOWN https://app.guazuapp.com.",

          "ghp_third_line": "Web app: https://carecart.com/",
          "foxy_third_line": "Web site: https://foxysoftware.github.io/",

          // TimeLine rightFourthLine
          "qualitech_fourth_line": "",
          "overUp_fourth_line": "",
          "cyberlink_fourth_line": "",
          "independent_fourth_line": "",
          "guazuapp_fourth_line":
              "Android app:  %DOWN  https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp",
          "ghp_fourth_line": "Web Site: https://gilsonhousingpartners.com",
          "foxy_fourth_line":
              "Source Code: https://github.com/FoxySoftware/Foxy",

          // Projects

          // title
          "cnc_cad_title": "CNCAD",
          "quick_camerea_title": "Camera Switch QuickAccess",
          "entity_api_title": "Entity Project API",
          "guazuApp_title": "GuazuaApp",
          "myResume_title": "My Personal Resume",
          //subtitle
          "cnc_cad_subtitle":
              "Prototype Design Software, CNC Software Controller, and Router for Polyethylene Cutting",
          "quick_camerea_subtitle":
              "The project was developed to facilitate boarding maneuvers by providing fast access to the cameras on a vessel",
          "entity_api_subtitle":
              "Real-time Notifications and Task Creation A GraphQL API written in Python utilizing WebSockets for Push Messages",
          "guazuApp_subtitle": "Multichannel messaging system",
          "myResume_subtitle":
              "I am excited to share my work with the community and hope it will be useful for other developers",

          "foxy_subtitle":
              "Foxy is a cross-platform tool. It offers real-time web scraping, Optical Character Recognition (OCR), data labeling, and modeling, with export options to databases and spreadsheets.",

          //text
          "cnc_cad_text": "The decision to develop this project was driven by a desire to learn. Initiated in early 2013, it was completed in mid-2014 due to various reasons. "
              "The primary motivation behind the development of this project was to gain knowledge and experience in computer-programmed machining processes, independent of software and hardware already developed by third parties. In contrast to complex industrial CNC machines and software, this project provides a more basic perspective.\n\n"
              "The objective of this project is to provide a foundational tool for students and individuals seeking to understand or venture into CNC machine processes.\n\n"
              "The material, documentation, and experience gained from this project are intended to support and serve new ideas, whether for different purposes or not. Furthermore, individuals can use this prototype project as a basis to develop more elaborate and complex CNC systems.",

          "quick_camerea_text":
              "In the source code repository there is a circuit schematic, 3D model (for Proteus) and the code for the microcontroller written in C. The system is 8-channel, includes a 16x2 LCD screen and a matrix keyboard. It is based on a PIC 18F4550 microcontroller, but can be downgraded to one with lower specs if needed.",
          "entity_api_text":
              "The project I'm describing is a software that provides a GraphQL-based API written in Python for task creation and tracking, as well as product requesting and real-time notifications to their recipients. The system communicates through WebSockets, allowing for efficient and real-time push messaging.\n\n "
                  "Users can interact with the system and receive real-time notifications about the status of their tasks and orders. Additionally, the API has been designed to be easily integrable into other applications and systems.",

          "guazuApp_text":
              "GuazúApp aimed to be a tool for communicating with your customers and within your organization. It was an ambitious project designed to integrate all your social media interactions into one place, redirecting customers to the right people within your organization.\n\nAdditionally, GuazúApp also intended to enhance internal communication.\n\nUnfortunately, the project has been canceled.",

          "ghp_text":
              "Gilson Software Solutions, has been dedicated to providing software products that utilize the latest technology for housing markets.",

          "foxy_text":
              "It is composed of two main modules: Collector and Processor.\nThe Collector Module manages the capture process by allowing users to configure images that signal the start, optional captures during, and the end of a session. It also monitors specific areas for changes and automatically captures new images if changes are detected.\nThe Processor Module focuses on defining areas of interest within captured images, crucial for OCR and data extraction. It allows users to label areas, test extraction settings, and export processed data to databases or spreadsheets for further analysis.",

          "myResume_text":
              "This website has been developed using Dart/Flutter technology. The widget for the 'Skills' section was created from scratch to offer a personalized and engaging experience. Soon, this widget will be available in the official package repository (pub.dev).",
          //link1
          "cnc_cad_name_link1": "Web Page",
          "quick_camerea_name_link1": "Source Code",
          "entity_api_name_link1": "Source Code",
          "guazuApp_name_link1": "App Web",
          "myResume_name_link1": "Source Code",
          "foxy_name_link1": "Site Web",

          //link2
          "cnc_cad_name_link2": "Source Code",
          "quick_camerea_name_link2": "",
          "entity_api_name_link2": "",
          "guazuApp_name_link2": "Google PLay App",
          "myResume_name_link2": "",
          "ghp_name_link2": "",
          "foxy_name_link2": "Source Code",

          // show More and show less
          "show_more": "Show more",
          "show_less": "Show less",
          // Contact Page
          "send": "SEND",
          "clipboard": "Copied to clipboard",
          "contact_to_me": "Get in touch!",
          "required_field": "This field is required",
          "required_message": "Your message is required!",
          "email_format_incorrect": "Email address is incorrect format",
          "message_sent_fail": "An error occurred while sending the message.",
          "message_sent_success": "The message was sent successfully",
          "name": "Name",
          "phone": "Phone",
        },
        'es_AR': {
          "about_me": "Con más de 10 años de experiencia en programación, he perfeccionado mis habilidades y ampliado mi conocimiento a través del trabajo práctico y el aprendizaje continuo. Mi profundo interés en el software y en comprender las funcionalidades de los sistemas me ha llevado a explorar este campo en profundidad.\n" +
              "Más allá de mis compromisos profesionales, valoro mantenerme activo con actividades como la natación y el kayak. También disfruto viajar en motocicleta, lo que me permite experimentar diversas culturas y paisajes.\n" +
              "Con una sólida ética de trabajo y dedicación, aporto experiencia en desarrollo de software y gestión de proyectos de diferentes escalas. Estoy comprometido con la resolución de problemas y la búsqueda de soluciones innovadoras a los desafíos técnicos que enfrento.",
          "programming_text": "Comencé en la programación en 2007, inicialmente trabajando con microcontroladores de la serie PIC16x de Microchip. Aprendí instrucciones básicas de Assembler y, posteriormente, continué con el lenguaje C utilizando el compilador MPLAB, realizando varios proyectos de aprendizaje.\n\n"
              "Más adelante, completé estudios terciarios en Análisis de Sistemas y Programación, donde desarrollé habilidades adicionales en programación orientada a objetos con Java y Python.\n\n"
              "En mis primeros proyectos con microcontroladores, aprendí instrucciones básicas de Assembler, lo que facilitó mi comprensión del funcionamiento a nivel de hardware. Luego, con el lenguaje C y el compilador MPLAB, trabajé en proyectos como un controlador de iluminación centralizado, un sistema de riego automático y un sistema de monitoreo de variables ambientales. Estos proyectos me ayudaron a comprender la programación estructurada y a adquirir habilidades para desarrollar soluciones más complejas.\n\n"
              "Con el tiempo, expandí mis intereses hacia otras áreas de la informática, obteniendo la titulación de Analista de Sistemas y Programación. Esto me permitió trabajar en proyectos más ambiciosos, utilizando Java y Python para desarrollar un sistema de reservas para hoteles y una plataforma de integración de mensajería, entre otros.\n\n"
              "Actualmente, mi lenguaje preferido para el desarrollo frontend es Dart con el framework Flutter, mientras que para el backend utilizo Python debido a su versatilidad y mi experiencia con él. También estoy explorando el lenguaje Rust para diversificar mis habilidades.\n\n"
              "En resumen, mis inicios con los microcontroladores PIC16x me permitieron descubrir mi interés en la programación y desarrollar las habilidades necesarias para enfrentar desafíos en el campo de la informática.",

          "soft_skills_text": "Las habilidades blandas son fundamentales para el crecimiento personal y profesional. Con el tiempo, he observado que estas habilidades se desarrollan de manera natural a través de diversas experiencias. En mi trayectoria laboral y cotidiana, he aprendido a manejar situaciones difíciles de manera efectiva y a encontrar soluciones creativas a problemas complejos.\n\n"
              "Aunque originalmente era una persona reservada, he logrado gestionar esta característica de manera más efectiva con el tiempo. La comunicación abierta y honesta es esencial para el éxito de cualquier proyecto, y he trabajado en mejorar mis habilidades de comunicación para transmitir mis ideas de manera clara y efectiva.\n\n"
              "He asumido diferentes roles a lo largo de mi carrera, desde empleado hasta emprendedor y líder de proyectos. Estas experiencias me han permitido desarrollar una amplia gama de habilidades blandas, como el trabajo en equipo, la resolución de conflictos y la capacidad de motivar a otros para lograr objetivos comunes.\n\n"
              "He enfrentado momentos desafiantes y aprendido a superarlos con resiliencia y determinación. Estas experiencias han resaltado la importancia de ser un líder empático y comprensivo, capaz de apoyar a otros en tiempos difíciles y de fomentar un ambiente de trabajo positivo y colaborativo.\n\n"
              "Aunque reconozco que aún hay áreas por mejorar en habilidades blandas, confío en mi capacidad para liderar proyectos y alcanzar objetivos tanto individualmente como en equipo. Con una actitud positiva, una mentalidad abierta y un fuerte compromiso, estoy seguro de que puedo seguir desarrollando estas habilidades para ser un líder más efectivo y exitoso en el futuro.",

          "sysadmin_text": "Mi interés en la administración de sistemas comenzó en 2007, cuando leí los cuadernos de Hack x Crack. Aunque estos documentos ya no estaban a la venta, obtuve versiones en PDF que contenían contenido aún relevante hoy en día.\n\n"
              "A pesar de no haberme especializado completamente en esta área como desarrollador full stack, mi experiencia laboral entre 2010 y 2012 me introdujo en el ámbito de los servidores. Realicé configuraciones de RAID en servidores IBM y HP, y llevé a cabo la instalación y configuración de sistemas operativos, herramientas de acceso remoto y monitoreo en sistemas Windows Server y Linux.\n\n"
              "Además, completé un curso de redes que me proporcionó conceptos teóricos. En el ámbito laboral, adquirí experiencia configurando routers Cisco, hardware firewalls y VLANs en switches Cisco. También he montado racks completos, conectando cables UTP y fibra óptica, y configurando e instalando los sistemas operativos correspondientes.\n\n"
              "Actualmente, he ampliado mis conocimientos en servidores web y he implementado un clúster en Kubernetes. También tengo experiencia con varios servicios de Google Cloud.\n\n"
              "Mi experiencia y el interés por el aprendizaje continuo me han permitido adquirir habilidades en administración de sistemas, brindándome una visión más amplia del mundo tecnológico y la capacidad para resolver problemas de manera efectiva.",

          "full_stack_text":
              "Como desarrollador full stack, manejo todo el ciclo de vida de una aplicación, desde el diseño de la interfaz de usuario hasta la implementación y gestión del servidor. Esto incluye el desarrollo tanto del front-end como del back-end, así como la integración y despliegue en diferentes entornos. Mi experiencia abarca aplicaciones web, móviles y sistemas embebidos, asegurando soluciones completas y funcionales en cada proyecto.",

          "frontend_text":
              "Como desarrollador frontend, mi objetivo principal es crear una experiencia de usuario atractiva y eficiente. Esto implica no solo diseñar interfaces visualmente agradables, sino también asegurar un rendimiento óptimo y una integración fluida con el backend.\n\n"
                  "El desarrollo frontend va más allá del diseño. Se trata de construir conexiones efectivas con el backend, gestionar la persistencia de datos, y procesar y presentar información al usuario de manera precisa. Es esencial mantener una estructura clara que separe la lógica de la interfaz de usuario de la lógica de datos.\n\n"
                  "Además, se deben considerar aspectos como el rendimiento, la compatibilidad, la accesibilidad y las pruebas, y establecer un plan para el mantenimiento y actualización continua de la aplicación.\n\n"
                  "En resumen, el rol de un desarrollador frontend es ofrecer una experiencia de usuario integral, prestando atención tanto al diseño como a la funcionalidad y el rendimiento de la aplicación.",

          "backend_text":
              "Como desarrollador backend, mi enfoque principal es crear una arquitectura sólida y escalable. La implementación de microservicios bien definidos y un diseño eficiente de bases de datos son clave para lograr un sistema backend eficaz. Los microservicios dividen la aplicación en componentes manejables, facilitando la escalabilidad y mantenimiento, mientras que un buen diseño de la base de datos asegura un almacenamiento y recuperación de datos eficiente.\n\n"
                  "También es crucial colaborar estrechamente con los desarrolladores frontend para asegurar que el sistema funcione sin problemas y cumplir los objetivos del proyecto.",

          "deployment_text":
              "La experiencia en mi propio emprendimiento me ha mostrado que desplegar una aplicación requiere un enfoque colaborativo. Es fundamental considerar la seguridad, el rendimiento, la escalabilidad y la accesibilidad. Trabajar con el equipo de desarrollo para una integración continua ayuda a reducir riesgos y tiempo durante el despliegue.\n\n"
                  "Una vez desplegada, la aplicación necesita una gestión adecuada que incluya supervisión del rendimiento, resolución de problemas, y mantenimiento para asegurar su funcionamiento continuo y manejar aumentos en el tráfico o carga de trabajo.",

          "electronic_text":
              "Mi interés por la electrónica comenzó a los 9 años, experimentando con pilas y motores. Estudié electrónica analógica y trabajé con componentes como transistores y diodos. Más tarde, construí circuitos con integrados básicos y microcontroladores, escribiendo mi primer código en Assembler.\n\n"
                  "En 2013, desarrollé un router CNC para mi tesis y un software con interfaz gráfica para controlar formas mediante el CNC. Aunque la electrónica comenzó como un hobby, también creé un conmutador de cámaras para un catamarán y he trabajado con MicroPython y Arduino en sistemas embebidos como el ESP8266 y el ATmega2560.",

          "about_me_title": "Información Personal",
          "about": "Sobre Mí",
          "_age": "Edad: ",
          "_nationality": "Nacionalidad: ",
          "_profession": "Profesión: ",
          "_current_residence": "Ciudad de Residencia: ",
          "age": "%age años.",
          "nationality": "Argentino.",
          "profession": "Full Stack Developer",
          "current_residence": "Las Grutas, Rio Negro, Argentina",
          "programming": "Programación",
          "electronic": "Electrónica",
          "sysadmin": "Administrador de sistemas",
          "soft_skills": "Habilidades blandas",
          // ChartProgOptions
          "languages": "Lenguajes",
          "queryLanguages": "Lenguajes de consulta",
          "paradigms": "Paradigmas",
          // ChartProgParadigms
          "objectOriented": "Orientada a objectos (POO)",
          "concurrent": "Concurrente",
          "reactive": "Reactiva",
          "parallel": "Paralelo",
          "functional": "Functional",
          "declarative": "Declarativo",
          "serviceOriented": "Orientada a Servicio",
          // Drawer
          "_about_me": "Sobre Mí",
          "_knowledge": "Habilidades",
          "_experience": "Experiencia",
          "_projects": "Projectos",
          "_contact": "Contacto",

          //Full stack developer Frame
          "full_stack_developer": "Desarrollador Full Stack",
          "frontend": "Interfaz",
          "backend": "Back-end",
          "deployment_management": "Gestión de Despliegue",

          "structure_planning": "Planificación de la Estructura",
          "database_design": "Diseño de Base de Datos",
          "security_implementation": "Implementación de Seguridad",

          "ux": "Experiencia de Usuario",
          "ui": "Interfaz de Usuario",
          "performance": "Performance",

          "deployment_structure": "Estructura de Despliegue",
          "ci": "Integración Continua",
          "cd": "Entrega Continua",

          //TimeLine
          "qualitech_title": "Qualitech",
          "overup_title": "OverUp",
          "cyberlink_title": "Cyberlink",
          "independent_title": "Independiente",
          "guazuapp_title": "GuazuApp",
          "ghp_title": "Gilson H. P.",
          "foxy_title": "Foxy Project",

          // TimeLine centerText
          "qualitech_years": "2011 - 2013",
          "overUp_years": "2015 - 2017",
          "cyberlink_years": "2017 - 2018",
          "independent_years": "2018 - 2020",
          "guazuapp_years": "2021 - 2023",
          "ghp_years": "2023 - 2024",
          "foxy_years": "Actualidad",

          // TimeLine rightTitle
          "qualitech_right_title": "Soluciones informáticas",
          "overUp_right_title": "Soluciones informáticas",
          "cyberlink_right_title": "Empresa de informática",
          "independent_right_title": "Desarrollador full stack independiente",
          "guazuapp_right_title": "Sistema de mensajería multicanal",
          "ghp_right_title": "Desarrollador full-stack",
          "foxy_right_title":
              "Extracción en tiempo real de datos mediante scraping de web y video",

          // TimeLine rightSubTitle
          "qualitech_right_subtitle": "Rol: Técnico en redes y sistemas.",
          "overUp_right_subtitle":
              "Rol: Socio fundador, desarrollador de software y, eventualmente, en el área de electrónica.",
          "cyberlink_right_subtitle":
              "Rol: Técnico general en el área de soporte.",
          "independent_right_subtitle": "",
          "guazuapp_right_subtitle":
              "Rol: Socio fundador, desarrollador full stack y líder de desarrollo.",
          "ghp_right_subtitle":
              "Desarrollador Full Stack y Líder de Proyecto en CareCart",
          "foxy_right_subtitle": "Rol: Desarrollador Fundador",

          // TimeLine rightThirdLine
          "qualitech_third_line": "Página web: https://qualitech.com.ar/",
          "overUp_third_line": "",
          "cyberlink_third_line": "Página web: https://cyberlink.com.ar/",
          "independent_third_line": "",
          "guazuapp_third_line":
              "Aplicación web: %DOWN https://app.guazuapp.com.",
          "ghp_third_line": "Aplicación web: https://carecart.com/",
          "foxy_third_line": "Web site: https://foxysoftware.github.io/",

          // TimeLine rightFourthLine
          "qualitech_fourth_line": "",
          "overUp_fourth_line": "",
          "cyberlink_fourth_line": "",
          "independent_fourth_line": "",
          "guazuapp_fourth_line":
              "Aplicación para Android: %DOWN https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp",
          "ghp_fourth_line": "Web Site: https://gilsonhousingpartners.com",
          "foxy_fourth_line":
              "Source Code: https://github.com/FoxySoftware/Foxy",

          // Projects

          // title
          "cnc_cad_title": "CNCAD",
          "quick_camerea_title": "Conmutador de Camara, QuickAccess",
          "entity_api_title": "Entity API",
          "guazuApp_title": "GuazuaApp",
          "myResume_title": "Mi Currículum Personal",

          //subtitle
          "cnc_cad_subtitle":
              "Software de diseño de prototipos, controlador de software CNC y enrutador para corte de polietileno",
          "quick_camerea_subtitle":
              "El proyecto fue desarrollado para facilitar las maniobras de abordaje al proporcionar un acceso rápido a las cámaras en una embarcación.",
          "entity_api_subtitle":
              "Notificaciones en tiempo real y creación de tareas Una API GraphQL escrita en Python que utiliza WebSockets para mensajes push",
          "guazuApp_subtitle": "Sistema de mensajería multicanal",
          "myResume_subtitle":
              "Estoy emocionado de compartir mi trabajo con la comunidad y espero que sea útil para otros desarrolladores.",
          "foxy_subtitle":
              "Foxy es una herramienta multiplataforma que soporta Linux, Windows y macOS. Ofrece scraping web en tiempo real, Reconocimiento Óptico de Caracteres (OCR), etiquetado y modelado de datos, con opciones de exportación a bases de datos y hojas de cálculo.",

          //text
          "cnc_cad_text": "La decisión de desarrollar este proyecto fue impulsada por el deseo de aprender. Iniciado a principios de 2013, se completó a mediados de 2014 por diversas razones. "
              "La principal motivación detrás del desarrollo de este proyecto fue ganar conocimiento y experiencia en procesos de maquinado programados por computadora, independientes del software y hardware ya desarrollado por terceros. A diferencia de las complejas máquinas CNC industriales y el software, este proyecto ofrece una perspectiva más básica.\n\n"
              "El objetivo de este proyecto es proporcionar una herramienta fundamental para estudiantes e individuos que buscan comprender o aventurarse en los procesos de máquinas CNC.\n\n"
              "El material, la documentación y la experiencia obtenida de este proyecto están destinados a respaldar y servir nuevas ideas, ya sea para diferentes propósitos o no. Además, las personas pueden utilizar este proyecto prototipo como base para desarrollar sistemas CNC más elaborados y complejos.",

          "quick_camerea_text":
              "En el repositorio del codigo fuente se encuentra esquema de circuito, modelo 3D (para Proteus) y el código para el microcontrolador escrito en C, El sistema es de 8 canales, incluye una pantalla LCD 16x2 y un teclado de matriz. Se basa en un microcontrolador PIC 18F4550, pero puede ser reemplazado por uno que tenga especificaciones más bajas si es necesario.",

          "entity_api_text":
              "El proyecto es un software que proporciona una API basada en GraphQL escrita en Python para la creación y seguimiento de tareas, así como la solicitud de productos y notificaciones en tiempo real a sus destinatarios. El sistema se comunica a través de WebSockets, lo que permite una mensajería push eficiente y en tiempo real.\n\n "
                  "Los usuarios pueden interactuar con el sistema y recibir notificaciones en tiempo real sobre el estado de sus tareas y pedidos. Además, la API ha sido diseñada para ser fácilmente integrable en otras aplicaciones y sistemas.",

          "guazuApp_text":
              "GuazúApp pretendía ser una herramienta para comunicarte con tus clientes y dentro de tu organización. Era un proyecto ambicioso diseñado para integrar todas tus interacciones en redes sociales en un solo lugar, redirigiendo a los clientes a las personas adecuadas dentro de tu organización.\n\nAdemás, GuazúApp también tenía como objetivo mejorar la comunicación interna.\n\nLamentablemente, el proyecto ha sido cancelado.",
          "myResume_text":
              "Este sitio web ha sido desarrollado utilizando la tecnología de Dart/Flutter. El widget de la sección 'Habilidades' fue creado desde cero para ofrecer una experiencia personalizada y atractiva. Pronto, este widget estará disponible en el repositorio oficial de paquetes (pub.dev).",

          "ghp_text":
              "Gilson Software Solutions se ha dedicado a proporcionar productos de software que utilizan la última tecnología para mercados inmobiliarios.",
          "foxy_text":
              "Está compuesto por dos módulos principales: Colector y Procesador.\nEl Módulo Colector gestiona el proceso de captura permitiendo a los usuarios configurar imágenes que indiquen el inicio, capturas opcionales durante la sesión y el final de la misma. También monitorea áreas específicas en busca de cambios y captura nuevas imágenes automáticamente si se detectan cambios.\nEl Módulo Procesador se enfoca en definir áreas de interés dentro de las imágenes capturadas, lo cual es crucial para OCR y la extracción de datos. Permite a los usuarios etiquetar áreas, probar configuraciones de extracción y exportar los datos procesados a bases de datos o hojas de cálculo para su análisis posterior.",

          //link1
          "cnc_cad_name_link1": "Página Web",
          "quick_camerea_name_link1": "Código Fuente",
          "entity_api_name_link1": "Código Fuente",
          "guazuApp_name_link1": "App Web",
          "myResume_name_link1": "Código Fuente",
          "foxy_name_link1": "Página Web",

          //link2
          "cnc_cad_name_link2": "Código Fuente",
          "quick_camerea_name_link2": "",
          "entity_api_name_link2": "",
          "ghp_name_link2": "",
          "foxy_name_link2": "Source Code",

          "guazuApp_name_link2": "Google PLay App",
          "myResume_name_link2": "",
          // show More and show less
          "show_more": "Mostrar más",
          "show_less": "Mostrar menos",
          // Contact Page
          "send": "ENVIAR",
          "clipboard": "Copiado al portapales",
          "contact_to_me": "¡Contáctame!",
          "required_field": "Este campo es necesario.",
          "required_message": "Tú mensaje es requerido!",
          "email_format_incorrect":
              "La dirección de correo electrónico tiene un formato incorrecto.",
          "message_sent_fail": "Se produjo un error al enviar el mensaje.",
          "message_sent_success": "El mensaje fue enviado con éxito.",
          "name": "* Nombre",
          "phone": "Teléfono",
        }
      };
}
