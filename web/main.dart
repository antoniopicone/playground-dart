// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:async';
import 'dart:html';

String daJson;

UListElement wordList = querySelector('#wordList');
ButtonElement mybutton = querySelector('#getWords');

int squareFunc(int n) {
  return n*n;
}

Future<void> makeRequest(Event _) async {
  const path = 'https://www.dartlang.org/f/portmanteaux.json';
  print('clicked');

  try {
    // Make the GET request
    final jsonString = await HttpRequest.getString(path);
    // The request succeeded. Process the JSON.
    processResponse(jsonString);
  } catch (e) {
    // The GET request failed. Handle the error.
    print('Couldn\'t open $path');
    // wordList.children.add(LIElement()..text = 'Request failed.');
  }
  
}

// void processResponse(String jsonString) {
//   daJson = json.decode(jsonString);
//   print('ora '+daJson);
// }
void processResponse(String jsonString) {
  for (final portmanteau in json.decode(jsonString)) {
    wordList.children.add(LIElement()..text = portmanteau);
  }
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

  // var ajson = jsonEncode(myObj);
  // print(ajson);

  //querySelector('#test').onLoad.listen(makeRequest);
  
  mybutton.onClick.listen(makeRequest);
}

