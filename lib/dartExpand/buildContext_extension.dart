//
//  context_extension.dart
//  fluttertemplet
//
//  Created by shang on 10/14/21 2:21 PM.
//  Copyright © 10/14/21 shang. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


extension on BuildContext {

  get scaffoldMessenger => ScaffoldMessenger.of(this);

  // ScaffoldMessengerState scaffoldMessenger() {
  //   return ScaffoldMessenger.of(this);
  // }

  void showSnackBar(SnackBar snackBar) {
    this.scaffoldMessenger.showSnackBar(snackBar);
  }
}
