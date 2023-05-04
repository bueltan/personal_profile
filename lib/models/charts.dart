enum ChartFullStack { frontend, backend, deploymentManagement}
enum ChartFrontEnd {ux, ui, performance}
enum ChartBackEnd {structurePlanification, databaseDesign, securityImplementation}
enum ChartDeploymentManagement { deploymentStructure, ci, cd}

extension FullStackExtension on ChartFullStack {
  String get keyName {
    switch (this) {
      case ChartFullStack.frontend:
       return "frontend";
      case ChartFullStack.backend:
        return "backend";
      case ChartFullStack.deploymentManagement:
        return "deployment_management";
     
    }
  }
   double get level {
    switch (this) {
    
      case ChartFullStack.frontend:
        return 7;
      case ChartFullStack.backend:
        return 8;
      case ChartFullStack.deploymentManagement:
        return 5;
    
    }
  }
}

extension FrontEndExtension on ChartFrontEnd {
  String get keyName {
    switch (this) {
    
      case ChartFrontEnd.ux:
        return "ux";
      case ChartFrontEnd.ui:
        return "ui";
      case ChartFrontEnd.performance:
        return "performance";
    }
  }
   double get level {
    switch (this) {      
      case ChartFrontEnd.ux:
       return 6;
      case ChartFrontEnd.ui:
       return 7;
      case ChartFrontEnd.performance:
        return 8;
    }
  }
}

extension BackendExtension on ChartBackEnd {
  String get keyName {
    switch (this) {
      case ChartBackEnd.structurePlanification:
        return "structure_planification";
      case ChartBackEnd.databaseDesign:
        return "database_design";
      case ChartBackEnd.securityImplementation:
        return "security_implementation";
    }
  }
   double get level {
       switch (this) {
         case ChartBackEnd.structurePlanification:
          return 7;
         case ChartBackEnd.databaseDesign:
          return 8;
         case ChartBackEnd.securityImplementation:
          return 6;
       }
    }
  }


extension DeploymentManagementExtension on ChartDeploymentManagement {
  String get keyName {
    switch (this) {
      case ChartDeploymentManagement.deploymentStructure:
        return "deployment_structure";
      case ChartDeploymentManagement.ci:
        return "ci";
      case ChartDeploymentManagement.cd:
        return "cd";
    }
  }
   double get level {
    switch (this) {      
   
      case ChartDeploymentManagement.deploymentStructure:
       return 6;
      case ChartDeploymentManagement.ci:
      return 4;
      case ChartDeploymentManagement.cd:
      return 4;
    }
  }
}




enum ChartProgOptions { languages, queryLanguages, paradigms }


enum ChartProgLanguages {python, php ,java, dart, c, rust }

enum ChartProgQueryLanguages { graphql, sql, others }

enum ChartProgParadigms {
  objectOriented,
  concurrent,
  reactive,
  parallel,
  funcional,
  declarative,
  serviceOriented,
}

extension LanguagesExtension on ChartProgLanguages {
  String get name {
    switch (this) {
      case ChartProgLanguages.python:
        return 'Python';
      case ChartProgLanguages.java:
        return 'Java';
      case ChartProgLanguages.dart:
        return 'Dart';
      case ChartProgLanguages.c:
        return 'C';
      case ChartProgLanguages.rust:
        return 'Rust';
      case ChartProgLanguages.php:
        return 'PHP';
    }
  }
   double get level {
    switch (this) {
      case ChartProgLanguages.python:
        return 9;
      case ChartProgLanguages.java:
        return 3;
      case ChartProgLanguages.dart:
        return 7;
      case ChartProgLanguages.c:
        return 4;
      case ChartProgLanguages.rust:
        return 2;
      case ChartProgLanguages.php:
        return 4;
    }
  }
}

extension QueryLanguagesExtension on ChartProgQueryLanguages {
  String get name {
    switch (this) {
      case ChartProgQueryLanguages.graphql:
        return "GraphQl";
      case ChartProgQueryLanguages.sql:
        return "SQL";
      case ChartProgQueryLanguages.others:
       return "Others";
    }
  }
   double get level {
    switch (this) {
      case ChartProgQueryLanguages.graphql:
          return 7;
      case ChartProgQueryLanguages.sql:
        return 8;
      case ChartProgQueryLanguages.others:
        return 1;
    }
  }
}

extension ParadigmsExtension on ChartProgParadigms {
  String get keyName {
    switch (this) {
    
      case ChartProgParadigms.objectOriented:
        return "objectOriented";
      case ChartProgParadigms.concurrent:
        return "concurrent";
      case ChartProgParadigms.reactive:
        return "reactive";
      case ChartProgParadigms.parallel:
        return "parallel";
      case ChartProgParadigms.funcional:
        return "funcional";
      case ChartProgParadigms.declarative:
        return "declarative";
      case ChartProgParadigms.serviceOriented:
        return "serviceOriented";
    }
  }
   double get level {
    switch (this) {
      
      case ChartProgParadigms.objectOriented:
        return 8;
      case ChartProgParadigms.concurrent:
        return 7;
      case ChartProgParadigms.reactive:
        return 8;
      case ChartProgParadigms.parallel:
        return 5;
      case ChartProgParadigms.funcional:
        return 6;
      case ChartProgParadigms.declarative:
        return 9;
      case ChartProgParadigms.serviceOriented:
        return 8;
    }
  }
}