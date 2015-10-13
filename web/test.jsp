<!DOCTYPE html>
<html ng-app="app11">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Angular-xeditable Starter Template</title>
    <!-- Bootstrap 3 css -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Angular.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
    <!-- Angular-xeditable -->
    <link href="angular-xeditable/css/xeditable.css" rel="stylesheet">
    <script src="angular-xeditable/js/xeditable.js"></script>
    <!-- app.js -->
    <script src="controll.js"></script>
  </head>
  <body style="padding: 20px">
    <h1 style="margin-bottom: 20px">Angular-xeditable Starter Template</h1>
    <div ng-controller="Ctrl">
      <!-- editable element -->
      <a href="#" editable-text="user.name">{{ user.name || "empty" }}</a>
      <div id="debug" style="margin-top: 30px">
      {{ user | json }}
      </div>
    </div>
  </body>
</html>  