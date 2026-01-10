import 'package:get/get.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "about_me":
              "I am a Software Engineer with over 12 years of experience specializing in Python backend development, microservices, and API design. I have more than 8 years of hands-on Python experience building robust platforms, automation frameworks, and production-grade systems.\n\nCurrently, I focus on developing automation and production pipeline tools for Digital Content Creation (DCC) environments. I have worked both within organizations and on independent projects, delivering workflow-oriented solutions that are actively used in real production. I am passionate about turning complex technical processes into stable, well-tested systems that teams can rely on.",
          "programming_text":
              "I started programming in 2007 working with PIC microcontrollers using Assembler and C. Later, I completed tertiary studies in Systems Analysis and Programming, strengthening my skills in Java and Python.\n\nOver time, I transitioned into backend engineering, focusing on Python microservices, API design, automation frameworks, and production pipeline systems. Today, I work primarily with Python for backend development and Flutter for selected mobile applications, while continuously exploring new technologies such as Rust.",
          "soft_skills_text":
              "Throughout my career I have developed strong communication, problem-solving, and collaboration skills. I have worked in roles ranging from employee to entrepreneur and technical lead, which helped me strengthen teamwork, conflict resolution, and leadership capabilities in complex technical environments.",
          "sysadmin_text":
              "My experience with system administration began in 2007 and expanded through professional work configuring servers, RAID systems, and networking infrastructure. Over time I gained hands-on experience with Linux, Windows Server, virtualization, networking, Kubernetes clusters, and Google Cloud services, giving me a solid understanding of production infrastructure and deployment workflows.",
          "full_stack_text":
              "Although I work across the full stack when required, my main contribution is on backend platforms and automation systems that power production workflows, including Python-based services, configuration validation tools, environment builders, and pipeline integrations used in real-world DCC production.",
          "frontend_text":
              "My frontend experience is strongly tied to production needs. I have developed Flutter mobile applications such as Dockaboat and CareCart, implementing complex features like payment systems with Stripe, real-time integrations, authentication, and data synchronization, always ensuring clean communication with backend services.",
          "backend_text":
              "My core expertise lies in building Python backend platforms and microservice-based systems. I design and implement REST and GraphQL APIs, asynchronous services, WebSocket-based real-time communication layers, configuration validation tooling, and automation frameworks that are actively used in production environments.",
          "deployment_text":
              "I have hands-on experience deploying and maintaining production systems, including Docker-based services, CI/CD pipelines, environment provisioning tools, and monitoring workflows. My work ensures that backend platforms, pipeline tools, and mobile applications can be reliably built, deployed, and updated across development and production environments.",
          "electronic_text":
              "My interest in electronics started in childhood and later expanded into embedded systems, CNC development, and hardware–software integration projects using microcontrollers and MicroPython.",
          "about_me_title": "Personal Information",
          "about": "About Me",
          "_age": "Age: ",
          "_profession": "Profession: ",
          "_nationality": "Nationality: ",
          "_current_residence": "City of Residence: ",
          "age": " %age years.",
          "profession": "Python Backend & Automation Platforms",
          "nationality": "Argentinian.",
          "current_residence": "Bariloche, Río Negro, Argentina",

          "programming": "Programming",
          "electronic": "Electronic",
          "sysadmin": "Systems Administrator",
          "soft_skills": "Soft Skills",

          "languages": "Languages",
          "queryLanguages": "Query Languages",
          "paradigms": "Paradigms",

          "objectOriented": "Object Oriented (OOP)",
          "concurrent": "Concurrent",
          "reactive": "Reactive",
          "parallel": "Parallel",
          "functional": "Functional",
          "declarative": "Declarative",
          "serviceOriented": "Service Oriented",

          "_about_me": "About Me",
          "_knowledge": "Skills",
          "_experience": "Experience",
          "_projects": "Projects",
          "_contact": "Contact",

          "full_stack_developer": "Backend & Automation Engineer",
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

          // Timeline
          "icvr_title": "ICVR",
          "dockaboat_title": "Dockaboat",
          "qualitech_title": "Qualitech",
          "overup_title": "OverUp",
          "cyberlink_title": "Cyberlink",
          "independent_title": "Independent",
          "guazuapp_title": "GuazúApp",
          "ghp_title": "GHP — CareCart",
          "foxy_title": "Foxy",

          "icvr_years": "2025 - Present",
          "dockaboat_years": "2024 - 2025",
          "qualitech_years": "2011 - 2013",
          "overUp_years": "2015 - 2017",
          "cyberlink_years": "2017 - 2018",
          "independent_years": "2018 - 2020",
          "guazuapp_years": "2021 - 2023",
          "ghp_years": "2023 - 2024",

          "icvr_right_title": "Pipeline Tools Developer for DCC Applications",
          "dockaboat_right_title": "Mobile Application Developer (Flutter)",
          "qualitech_right_title": "IT Solutions",
          "overUp_right_title": "IT Solutions",
          "cyberlink_right_title": "IT Company",
          "independent_right_title": "Independent Backend Engineer",
          "guazuapp_right_title": "Multichannel Messaging Platform",
          "ghp_right_title": "Full-Stack Developer — CareCart Project",

          "icvr_right_subtitle":
              "Role: Pipeline tools developer focusing on Python automation and DCC integrations (Blender) for production environments.",
          "dockaboat_right_subtitle":
              "Role: Sole Flutter developer responsible for delivery, stabilization, and payments/subscriptions integration.",
          "qualitech_right_subtitle": "Role: Network and systems technician.",
          "overUp_right_subtitle": "Role: Co-founder and software developer.",
          "cyberlink_right_subtitle": "Role: Technical support specialist.",
          "independent_right_subtitle":
              "Role: Independent backend engineer delivering automation platforms and microservice-based systems for multiple clients.",
          "guazuapp_right_subtitle":
              "Role: Co-founder, full-stack engineer, and technical lead.",
          "ghp_right_subtitle": "Role: Lead mobile platform developer.",

          "icvr_third_line": "Website: https://ictools.io/",
          "dockaboat_third_line": "Website: https://dockaboat.app",
          "qualitech_third_line": "Website: https://qualitech.com.ar/",
          "overUp_third_line": "",
          "cyberlink_third_line": "Website: https://cyberlink.com.ar/",
          "independent_third_line": "",
          "guazuapp_third_line": "Web app: %DOWN https://app.guazuapp.com.",
          "ghp_third_line": "Web app: https://carecart.com/",
          "foxy_third_line": "Web site: https://foxysoftware.github.io/",

          "icvr_fourth_line": "",
          "dockaboat_fourth_line": "",
          "qualitech_fourth_line": "",
          "overUp_fourth_line": "",
          "cyberlink_fourth_line": "",
          "independent_fourth_line": "",
          "guazuapp_fourth_line":
              "Android app:  %DOWN  https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp",
          "ghp_fourth_line": "",
          "foxy_fourth_line":
              "Source Code: https://github.com/FoxySoftware/Foxy",

          // Projects
          "cnc_cad_title": "CNCAD",
          "quick_camerea_title": "Camera Switch QuickAccess",
          "entity_api_title": "Entity Project API",
          "guazuApp_title": "GuazuaApp",
          "myResume_title": "My Personal Resume",

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

          "cnc_cad_text":
              "The decision to develop this project was driven by a desire to learn. Initiated in early 2013, it was completed in mid-2014 due to various reasons. The primary motivation behind the development of this project was to gain knowledge and experience in computer-programmed machining processes, independent of software and hardware already developed by third parties. In contrast to complex industrial CNC machines and software, this project provides a more basic perspective.\n\nThe objective of this project is to provide a foundational tool for students and individuals seeking to understand or venture into CNC machine processes.\n\nThe material, documentation, and experience gained from this project are intended to support and serve new ideas, whether for different purposes or not. Furthermore, individuals can use this prototype project as a basis to develop more elaborate and complex CNC systems.",

          "quick_camerea_text":
              "In the source code repository there is a circuit schematic, 3D model (for Proteus) and the code for the microcontroller written in C. The system is 8-channel, includes a 16x2 LCD screen and a matrix keyboard. It is based on a PIC 18F4550 microcontroller, but can be downgraded to one with lower specs if needed.",

          "entity_api_text":
              "The project I'm describing is a software that provides a GraphQL-based API written in Python for task creation and tracking, as well as product requesting and real-time notifications to their recipients. The system communicates through WebSockets, allowing for efficient and real-time push messaging.\n\nUsers can interact with the system and receive real-time notifications about the status of their tasks and orders. Additionally, the API has been designed to be easily integrable into other applications and systems.",

          "guazuApp_text":
              "GuazúApp aimed to be a tool for communicating with your customers and within your organization. It was an ambitious project designed to integrate all your social media interactions into one place, redirecting customers to the right people within your organization.\n\nAdditionally, GuazúApp also intended to enhance internal communication.\n\nUnfortunately, the project has been canceled.",

          "ghp_text":
              "Gilson Software Solutions has been dedicated to providing software products that utilize the latest technology for housing markets.",

          "foxy_text":
              "It is composed of two main modules: Collector and Processor.\nThe Collector Module manages the capture process by allowing users to configure images that signal the start, optional captures during, and the end of a session. It also monitors specific areas for changes and automatically captures new images if changes are detected.\nThe Processor Module focuses on defining areas of interest within captured images, crucial for OCR and data extraction. It allows users to label areas, test extraction settings, and export processed data to databases or spreadsheets for further analysis.",

          "myResume_text":
              "This website has been developed using Dart/Flutter technology. The widget for the 'Skills' section was created from scratch to offer a personalized and engaging experience. Soon, this widget will be available in the official package repository (pub.dev).",

          "cnc_cad_name_link1": "Web Page",
          "quick_camerea_name_link1": "Source Code",
          "entity_api_name_link1": "Source Code",
          "guazuApp_name_link1": "App Web",
          "myResume_name_link1": "Source Code",
          "foxy_name_link1": "Site Web",

          "cnc_cad_name_link2": "Source Code",
          "quick_camerea_name_link2": "",
          "entity_api_name_link2": "",
          "guazuApp_name_link2": "Google Play App",
          "myResume_name_link2": "",
          "ghp_name_link2": "",
          "foxy_name_link2": "Source Code",

          "show_more": "Show more",
          "show_less": "Show less",

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
        'es_ES': {
          "about_me":
              "Soy Ingeniero de Software con más de 12 años de experiencia, especializado en desarrollo backend con Python, microservicios y diseño de APIs. Cuento con más de 8 años de experiencia práctica en Python construyendo plataformas robustas, frameworks de automatización y sistemas listos para producción.\n\nActualmente me enfoco en el desarrollo de herramientas de automatización y pipelines de producción para entornos de Creación de Contenido Digital (DCC). He trabajado tanto dentro de organizaciones como en proyectos independientes, entregando soluciones orientadas a flujos de trabajo que se utilizan activamente en producción. Me apasiona transformar procesos técnicos complejos en sistemas estables y bien testeados en los que los equipos puedan confiar.",

          "programming_text":
              "Comencé a programar en 2007 trabajando con microcontroladores PIC utilizando Assembler y C. Posteriormente completé estudios terciarios en Análisis y Programación de Sistemas, fortaleciendo mis habilidades en Java y Python.\n\nCon el tiempo me orienté hacia la ingeniería backend, enfocándome en microservicios en Python, diseño de APIs, frameworks de automatización y sistemas de pipelines de producción. Actualmente trabajo principalmente con Python para backend y Flutter para aplicaciones móviles seleccionadas, mientras continúo explorando nuevas tecnologías como Rust.",

          "soft_skills_text":
              "A lo largo de mi carrera desarrollé sólidas habilidades de comunicación, resolución de problemas y colaboración. He trabajado en roles que van desde empleado hasta emprendedor y líder técnico, lo que me permitió fortalecer el trabajo en equipo, la resolución de conflictos y capacidades de liderazgo en entornos técnicos complejos.",

          "sysadmin_text":
              "Mi experiencia en administración de sistemas comenzó en 2007 y se amplió mediante trabajos profesionales configurando servidores, sistemas RAID e infraestructura de red. Con el tiempo adquirí experiencia práctica en Linux, Windows Server, virtualización, redes, clústeres de Kubernetes y servicios de Google Cloud, lo que me brinda una sólida comprensión de infraestructuras de producción y flujos de despliegue.",

          "full_stack_text":
              "Si bien trabajo en todo el stack cuando es necesario, mi principal aporte está en plataformas backend y sistemas de automatización que impulsan flujos de producción, incluyendo servicios en Python, herramientas de validación de configuración, constructores de entornos e integraciones de pipeline utilizadas en entornos reales de DCC.",

          "frontend_text":
              "Mi experiencia frontend está ligada a necesidades de producción. He desarrollado aplicaciones móviles en Flutter como Dockaboat y CareCart, implementando sistemas de pago con Stripe, integraciones en tiempo real, autenticación y sincronización de datos.",

          "backend_text":
              "Mi principal especialidad es la construcción de plataformas backend en Python y sistemas basados en microservicios. Diseño e implemento APIs REST y GraphQL, servicios asíncronos, comunicación en tiempo real con WebSockets y frameworks de automatización utilizados en producción.",

          "deployment_text":
              "Tengo experiencia en despliegue y mantenimiento de sistemas en producción usando Docker, CI/CD, aprovisionamiento de entornos y monitoreo continuo.",

          "electronic_text":
              "Mi interés por la electrónica comenzó en la infancia y se expandió a sistemas embebidos, CNC e integración hardware–software.",

          "about_me_title": "Información Personal",
          "about": "Sobre mí",
          "_age": "Edad: ",
          "_profession": "Profesión: ",
          "_nationality": "Nacionalidad: ",
          "_current_residence": "Ciudad de residencia: ",
          "age": " %age años.",
          "profession": "Plataformas Backend y Automatización en Python",
          "nationality": "Argentino",
          "current_residence": "Bariloche, Río Negro, Argentina",

          "programming": "Programación",
          "electronic": "Electrónica",
          "sysadmin": "Administrador de Sistemas",
          "soft_skills": "Habilidades Blandas",

          "languages": "Lenguajes",
          "queryLanguages": "Lenguajes de Consulta",
          "paradigms": "Paradigmas",

          "objectOriented": "Orientado a Objetos (OOP)",
          "concurrent": "Concurrente",
          "reactive": "Reactivo",
          "parallel": "Paralelo",
          "functional": "Funcional",
          "declarative": "Declarativo",
          "serviceOriented": "Orientado a Servicios",

          "_about_me": "Sobre mí",
          "_knowledge": "Habilidades",
          "_experience": "Experiencia",
          "_projects": "Proyectos",
          "_contact": "Contacto",

          "full_stack_developer": "Ingeniero Backend y de Automatización",
          "frontend": "Frontend",
          "backend": "Backend",
          "deployment_management": "Gestión de Despliegue",

          "structure_planning": "Planificación de Estructura",
          "database_design": "Diseño de Base de Datos",
          "security_implementation": "Implementación de Seguridad",

          "ux": "Experiencia de Usuario",
          "ui": "Interfaz de Usuario",
          "performance": "Rendimiento",

          "deployment_structure": "Estructura de Despliegue",
          "ci": "Integración Continua",
          "cd": "Entrega Continua",

          // Timeline
          "icvr_title": "ICVR",
          "dockaboat_title": "Dockaboat",
          "qualitech_title": "Qualitech",
          "overup_title": "OverUp",
          "cyberlink_title": "Cyberlink",
          "independent_title": "Independiente",
          "guazuapp_title": "GuazúApp",
          "ghp_title": "GHP — CareCart",
          "foxy_title": "Foxy",

          "icvr_years": "2025 - Presente",
          "dockaboat_years": "2024 - 2025",
          "qualitech_years": "2011 - 2013",
          "overUp_years": "2015 - 2017",
          "cyberlink_years": "2017 - 2018",
          "independent_years": "2018 - 2020",
          "guazuapp_years": "2021 - 2023",
          "ghp_years": "2023 - 2024",

          "icvr_right_title":
              "Desarrollador de Herramientas de Pipeline para DCC",
          "dockaboat_right_title":
              "Desarrollador de Aplicaciones Móviles (Flutter)",
          "qualitech_right_title": "Soluciones IT",
          "overUp_right_title": "Soluciones IT",
          "cyberlink_right_title": "Empresa IT",
          "independent_right_title": "Ingeniero Backend Independiente",
          "guazuapp_right_title": "Plataforma de Mensajería Multicanal",
          "ghp_right_title": "Desarrollador Full Stack — Proyecto CareCart",

          "icvr_right_subtitle":
              "Rol: desarrollo de herramientas de automatización en Python e integraciones DCC (Blender) para entornos de producción.",
          "dockaboat_right_subtitle":
              "Rol: único desarrollador Flutter responsable de entrega, estabilización e integración de pagos y suscripciones.",
          "qualitech_right_subtitle": "Rol: técnico en redes y sistemas.",
          "overUp_right_subtitle":
              "Rol: cofundador y desarrollador de software.",
          "cyberlink_right_subtitle": "Rol: especialista en soporte técnico.",
          "independent_right_subtitle":
              "Rol: ingeniero backend independiente desarrollando plataformas de automatización y microservicios.",
          "guazuapp_right_subtitle":
              "Rol: cofundador, ingeniero full stack y líder técnico.",
          "ghp_right_subtitle":
              "Rol: desarrollador líder de la plataforma móvil.",

          "show_more": "Mostrar más",
          "show_less": "Mostrar menos",

          "send": "ENVIAR",
          "clipboard": "Copiado al portapapeles",
          "contact_to_me": "¡Contáctame!",
          "required_field": "Este campo es obligatorio",
          "required_message": "¡Tu mensaje es obligatorio!",
          "email_format_incorrect": "Formato de correo incorrecto",
          "message_sent_fail": "Error al enviar el mensaje",
          "message_sent_success": "Mensaje enviado con éxito",
          "name": "Nombre",
          "phone": "Teléfono"
        }
      };
}
