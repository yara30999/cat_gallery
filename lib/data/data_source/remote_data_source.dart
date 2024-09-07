import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../app/extensions.dart';
import '../../domain/entities/authentication.dart';
import '../../presentation/resources/conistants_manager.dart';
import '../network/app_api.dart';
import '../network/requests.dart';
import '../request_body/favourite_body.dart';
import '../request_body/vote_body.dart';
import '../responses/cat_with_click_response.dart';
import '../responses/favourite_single_image_response.dart';
import '../responses/get_favourites_response.dart';
import '../responses/success_response.dart';
import '../responses/votes_response.dart';
import '../responses/cat_image_response.dart';
import '../responses/breeds_response.dart';
import '../responses/single_breed_response.dart';
import '../responses/vote_single_image_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationEntity> login(LoginRequest loginRequest);
  Future<void> forgotPassword(String email);
  Future<AuthenticationEntity> register(RegisterRequest registerRequest);
  Future<AuthenticationEntity> googleSignIn();
  Future<AuthenticationEntity> facebookSignIn();
  Future<void> logout();
  Future<List<BreedResponse>> getBreeds(String uid);
  Future<CatImageResponse> getCatImage(CatImageRequest catImageRequest);
  Future<SingleBreedResponse> getBreedInfo(BreedInfoRequest breedInfoRequest);
  Future<List<CatWithClickResponse>> getBreedImages(
      BreedImagesRequest breedImagesRequest);
  Future<List<CatWithClickResponse>> getNoCategoryImages(
      NoCategoryImagesRequest noCategoryImagesRequest);
  Future<List<CatWithClickResponse>> getCategoryImages(
      CategoryImagesRequest categoryImagesRequest);
  Future<List<VotesResponse>> getVotes(UidPageNumRequest uidPageNumRequest);
  Future<VoteSingleImageResponse> postVote(VoteBody voteBody);
  Future<List<GetFavoritesResponse>> getFavourites(
      UidPageNumRequest uidPageNumRequest);
  Future<FavouriteSingleImageResponse> postFavourite(
      FavouriteBody favouriteBody);
  Future<SuccessResponse> deleteFavourite(
      DeleteFavouriteRequest deleteFavouriteRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  final FirebaseAuth _firebaseAuth;

  RemoteDataSourceImpl(this._appServiceClient, this._firebaseAuth);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<AuthenticationEntity> login(LoginRequest loginRequest) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );
    //read doc
    DocumentSnapshot userData = await users.doc(credential.user?.uid).get();
    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: userData['name'],
        email: userData['email'],
        countryMobileCode: userData['Code'],
        phoneNum: userData['number'],
        gender: userData['gender']);
  }

  @override
  Future<AuthenticationEntity> register(RegisterRequest registerRequest) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: registerRequest.email,
      password: registerRequest.password,
    );
    //write doc
    await users.doc(credential.user?.uid).set({
      'name': registerRequest.userName,
      'email': registerRequest.email,
      'Code': registerRequest.countryMobileCode,
      'number': registerRequest.phoneNumber,
      'gender': registerRequest.gender,
    });
    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: registerRequest.userName,
        email: registerRequest.email,
        countryMobileCode: registerRequest.countryMobileCode,
        phoneNum: registerRequest.phoneNumber,
        gender: registerRequest.gender);
  }

  @override
  Future<AuthenticationEntity> googleSignIn() async {
    UserCredential userCredential;
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      userCredential = await _firebaseAuth.signInWithPopup(googleProvider);
    } else {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw StateError(AppConstants.google);
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      userCredential = await _firebaseAuth.signInWithCredential(credential);
    }
    return AuthenticationEntity(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName.orEmpty(),
        email: userCredential.user!.email.orEmpty(),
        countryMobileCode: '',
        phoneNum: userCredential.user!.phoneNumber.orEmpty(),
        gender: '');
  }

  @override
  Future<AuthenticationEntity> facebookSignIn() async {
    UserCredential userCredential;
    if (kIsWeb) {
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();
      userCredential = await _firebaseAuth.signInWithPopup(facebookProvider);
    } else {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken == null) {
        throw StateError(AppConstants.facebook);
      }
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      // Once signed in, return the UserCredential
      userCredential =
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    }
    return AuthenticationEntity(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName.orEmpty(),
        email: userCredential.user!.email.orEmpty(),
        countryMobileCode: '',
        phoneNum: userCredential.user!.phoneNumber.orEmpty(),
        gender: '');
  }

  @override
  Future<void> logout() async {
    if (_googleSignIn.currentUser != null) {
      // If a user is signed in via google
      await _googleSignIn.disconnect();
    }
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<List<BreedResponse>> getBreeds(String uid) async {
    return await _appServiceClient.getBreeds(uid);
  }

  @override
  Future<CatImageResponse> getCatImage(CatImageRequest catImageRequest) async {
    return await _appServiceClient.getImage(
        catImageRequest.uid, catImageRequest.imgid);
  }

  @override
  Future<SingleBreedResponse> getBreedInfo(
      BreedInfoRequest breedInfoRequest) async {
    return await _appServiceClient.getBreedInfo(
        breedInfoRequest.uid, breedInfoRequest.breedId);
  }

  @override
  Future<List<CatWithClickResponse>> getBreedImages(
      BreedImagesRequest breedImagesRequest) async {
    return await _appServiceClient.getBreedImages(breedImagesRequest.uid,
        breedImagesRequest.breedId, breedImagesRequest.pageNum);
  }

  @override
  Future<List<CatWithClickResponse>> getNoCategoryImages(
      NoCategoryImagesRequest noCategoryImagesRequest) async {
    return await _appServiceClient.getNoCategoryImages(
        noCategoryImagesRequest.uid,
        noCategoryImagesRequest.pageNum,
        noCategoryImagesRequest.order);
  }

  @override
  Future<List<CatWithClickResponse>> getCategoryImages(
      CategoryImagesRequest categoryImagesRequest) async {
    return await _appServiceClient.getCategoryImages(
        categoryImagesRequest.uid,
        categoryImagesRequest.categoryId,
        categoryImagesRequest.pageNum,
        categoryImagesRequest.order);
  }

  @override
  Future<List<VotesResponse>> getVotes(
      UidPageNumRequest uidPageNumRequest) async {
    return await _appServiceClient.getVotes(
        uidPageNumRequest.uid, uidPageNumRequest.pageNum);
  }

  @override
  Future<VoteSingleImageResponse> postVote(VoteBody voteBody) async {
    return await _appServiceClient.postVote(voteBody);
  }

  @override
  Future<List<GetFavoritesResponse>> getFavourites(
      UidPageNumRequest uidPageNumRequest) async {
    return await _appServiceClient.getFavorites(
        uidPageNumRequest.uid, uidPageNumRequest.pageNum);
  }

  @override
  Future<FavouriteSingleImageResponse> postFavourite(
      FavouriteBody favouriteBody) async {
    return await _appServiceClient.postFavorite(favouriteBody);
  }

  @override
  Future<SuccessResponse> deleteFavourite(
      DeleteFavouriteRequest deleteFavouriteRequest) async {
    return await _appServiceClient.deleteFavorite(
        deleteFavouriteRequest.uid, deleteFavouriteRequest.favId);
  }
}
