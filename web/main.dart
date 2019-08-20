// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

int squareFunc(int n) {
  return n*n;
}

main() {

  var myObj = {
    'arr': ['ciao','bell'],
    'string': 'hello',
    'number': 3
  };

  print('Hello World '+ myObj['number'].toString() );  

  for (var object in myObj['arr']) {
    print(object);
  }

  int n = 3;
  print(n.toString()+'^2='+squareFunc(n).toString());

}
