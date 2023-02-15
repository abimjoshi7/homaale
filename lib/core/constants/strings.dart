//extensions on String
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

//String literals
const kErrorLog = 'error-log';
const kIsPersistToken = 'is-persist-token';
const kToken = 'token';
const kDefaultAvatar =
    'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png';
const kNoImage =
    'https://images.assetsdelivery.com/compings_v2/koblizeek/koblizeek2208/koblizeek220800027.jpg';
const kServiceImage =
    'https://cdn.pixabay.com/photo/2015/05/28/14/53/ux-788002_960_720.jpg';
