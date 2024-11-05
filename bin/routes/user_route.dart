import 'package:shelf_router/shelf_router.dart';

import '../handlers/about_handler/edit_about_handler.dart';
import '../handlers/about_handler/get_about_handler.dart';
import '../handlers/about_handler/upload_image_handler.dart';
import '../handlers/education_handler/add_education_handler.dart';
import '../handlers/education_handler/delete_education_handler.dart';
import '../handlers/education_handler/get_education_handler.dart';
import '../handlers/projects_handler/add_project_handler.dart';
import '../handlers/projects_handler/delete_project_handler.dart';
import '../handlers/projects_handler/get_project_handler.dart';
import '../handlers/skills_handler/add_skill_handler.dart';
import '../handlers/skills_handler/delete_skill_handler.dart';
import '../handlers/skills_handler/get_skill_handler.dart';
import '../handlers/social_handler/add_social_handler.dart';
import '../handlers/social_handler/delete_social_handler.dart';
import '../handlers/social_handler/get_social_handler.dart';
import '../handlers/users_handler/get_users_handler.dart';

class UserRoute {
  Router get route {
    return Router()
      //about handlers
      ..get("/get/about", getAboutHandler)
      ..post("/edit/about", editAboutHandler)
      ..post("/upload/avatar", uploadImageHandler)

      //education handlers
      ..get("/get/education", getEducationHandler)
      ..post("/add/education", addEducationHandler)
      ..delete("/delete/education", deleteEducationHandler)

      //projects handlers
      ..get("/get/projects", getProjectsHandler)
      ..post("/add/projects", addProjectHandler)
      ..delete("/delete/projects", deleteProjectHandler)

      //skills handlers
      ..get("/get/skills", getSkillHandler)
      ..post("/add/skills", addSkillHandler)
      ..delete("/delete/skills", deleteSkillHandler)

      //social handlers
      ..get("/get/social", getSocialHandler)
      ..post("/add/social", addSocialHandler)
      ..delete("/delete/social", deleteSocialHandler)

      //users handlers
      ..get("/get/users", getUsersHandler);
  }
}
