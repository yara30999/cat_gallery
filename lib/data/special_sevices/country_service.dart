import '../../domain/entities/country_data.dart';

abstract class ICountryDataService {
  List<CountryData> getCountries();
  CountryData? getCountryByISOCode(String iSOCode);
  int? findMaxLengthByISOCode(String iSOCode);
  int? findMinLengthByISOCode(String iSOCode);
}

class CountryDataServiceImpl implements ICountryDataService {
  @override
  List<CountryData> getCountries() {
    return CountryData.countries;
  }

  @override
  CountryData? getCountryByISOCode(String iSOCode) {
    for (var country in CountryData.countries) {
      if (iSOCode.startsWith(country.code)) {
        return country;
      }
    }
    return null;
  }

  @override
  int? findMaxLengthByISOCode(String iSOCode) {
    var country = getCountryByISOCode(iSOCode);
    return country?.maxLength;
  }

  @override
  int? findMinLengthByISOCode(String iSOCode) {
    var country = getCountryByISOCode(iSOCode);
    return country?.minLength;
  }
}
