class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String userName;
  String email;
  String password;
  String countryMobileCode;
  String phoneNumber;
  String gender;

  RegisterRequest(this.userName, this.email, this.password,
      this.countryMobileCode, this.phoneNumber, this.gender);
}

class CatImageRequest {
  String uid;
  String imgid;

  CatImageRequest(this.uid, this.imgid);
}

class BreedInfoRequest {
  String uid;
  String breedId;

  BreedInfoRequest(this.uid, this.breedId);
}
