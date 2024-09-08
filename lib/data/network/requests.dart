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

class BreedImagesRequest {
  String uid;
  String breedId;
  int pageNum;

  BreedImagesRequest(this.uid, this.breedId, this.pageNum);
}

class NoCategoryImagesRequest {
  String uid;
  int pageNum;
  String order;

  NoCategoryImagesRequest(this.uid, this.pageNum, this.order);
}

class CategoryImagesRequest {
  String uid;
  String categoryId;
  int pageNum;
  String order;

  CategoryImagesRequest(this.uid, this.categoryId, this.pageNum, this.order);
}

class UidPageNumRequest {
  String uid;
  int pageNum;

  UidPageNumRequest(this.uid, this.pageNum);
}

class DeleteFavouriteRequest {
  String uid;
  String favId;

  DeleteFavouriteRequest(this.uid, this.favId);
}

class DeleteImageRequest {
  String uid;
  String imgId;

  DeleteImageRequest(this.uid, this.imgId);
}
