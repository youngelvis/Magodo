import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magodo/components/components_for_class_of_varable/userGroup.dart';
import 'package:magodo/pages/admin_page/admin_page.dart';
import 'package:magodo/pages/central_admin/central_admin.dart';
import 'package:magodo/pages/central_security_admin/central_security_admin.dart';
import 'package:magodo/pages/dependant/dependant.dart';
import 'package:magodo/pages/resident_Page/resident_page.dart';
import 'package:magodo/pages/schoolPage/school_page.dart';
import 'package:magodo/pages/security_page/secruty_page.dart';
import 'package:magodo/pages/super_admin/super_admin.dart';
import 'package:magodo/pages/vas2nets/vas2nets_page.dart';
import 'package:magodo/pages/zonal_admin/zonal_admin.dart';
import 'package:magodo/pages/zonal_super_admin/zonal_super_admin.dart';

class LoginRouter extends StatefulWidget {
  final data;
  const LoginRouter({Key? key, required this.data}) : super(key: key);

  @override
  State<LoginRouter> createState() => _LoginRouterState();
}

class _LoginRouterState extends State<LoginRouter> {

  router(data){
    if(data['data']['usr_group']== UserGroup.CENTRAL_ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const CentralAdmin()));
    } else if(data['data']['usr_group']== UserGroup.CENTRAL_SECURITY_ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const CentralSecurityAdmin()));
    }else if(data['data']['usr_group']== UserGroup.MEMBER){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const ResidentPage()));
    }else if(data['data']['usr_group']== UserGroup.ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const Admin()));
    }else if(data['data']['usr_group']== UserGroup.SECURITY){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const SecurityPage()));
    }else if(data['data']['usr_group']== UserGroup.SUPER_ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const SuperAdmin()));
    }else if(data['data']['usr_group']== UserGroup.VAS2NETS){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const Vas2Nets_page()));
    }else if(data['data']['usr_group']== UserGroup.ZONAL_ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const ZonalAdmin()));
    }else if(data['data']['usr_group']== UserGroup.ZONAL_SUPER_ADMIN){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const ZonalSuperAdmin()));
    }else if(data['data']['usr_group']== UserGroup.DEPENDANT){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const Dependant()));
    }else if(data['data']['usr_group']== UserGroup.SCHOOL){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> const SchoolPage()));
    }
    print(data);
  }
    @override
  Widget build(BuildContext context) {
      var data = widget.data;
    return router(data);
  }
}

