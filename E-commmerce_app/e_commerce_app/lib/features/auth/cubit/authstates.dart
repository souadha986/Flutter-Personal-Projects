abstract class Authstates {}

class InitialState extends Authstates {}

class Loadingstate extends Authstates {}

class Successstate extends Authstates {
  final String success;
  Successstate(this.success);
}

class Errorstate extends Authstates {
  final String error;
  Errorstate(this.error);
}
