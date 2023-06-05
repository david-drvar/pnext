import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['it', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? itText = '',
    String? enText = '',
  }) =>
      [itText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'u1wzr71a': {
      'it': 'PNext',
      'en': 'PNext',
    },
    'dkr5870r': {
      'it': 'Ben tornato',
      'en': 'Welcome back',
    },
    '678wazgn': {
      'it': 'Email Address',
      'en': 'Email Address',
    },
    '0fsbnezs': {
      'it': 'Inserisci la tua email qui...',
      'en': 'Enter your email here...',
    },
    'b6be8v2d': {
      'it': 'Password',
      'en': 'Password',
    },
    '7t4fdxev': {
      'it': 'Inserisci la tua password qui...',
      'en': 'Enter your password here...',
    },
    '5t0ihrel': {
      'it': 'Password dimenticata?',
      'en': 'Forgot password?',
    },
    '7e0jfy8f': {
      'it': 'Login',
      'en': 'Login',
    },
    'iedcp69u': {
      'it': 'Non hai un account?',
      'en': 'Do not have an account?',
    },
    'u5al57yi': {
      'it': 'Crea Account',
      'en': 'Create Account',
    },
    '32b8fll9': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // createAccount
  {
    '9vs03p63': {
      'it': 'PNext',
      'en': 'PNext',
    },
    'l2y0clhw': {
      'it': 'Get Started Below,',
      'en': 'Get Started Below,',
    },
    'jfk6qxf5': {
      'it': 'Name',
      'en': 'Name',
    },
    '4e536r9m': {
      'it': 'Enter your name here...',
      'en': 'Enter your name here...',
    },
    'eyi8v3mw': {
      'it': 'Surname',
      'en': 'Surname',
    },
    'ff53ctng': {
      'it': 'Enter your surname here...',
      'en': 'Enter your surname here...',
    },
    '2gephbwi': {
      'it': 'Phone number',
      'en': 'Phone number',
    },
    '6j7evt3x': {
      'it': 'Enter your phone number here...',
      'en': 'Enter your phone number here...',
    },
    'symmn794': {
      'it': 'Upload document',
      'en': 'Document upload',
    },
    'xmxtv84k': {
      'it': 'Upload profile photo',
      'en': 'Upload profile photo',
    },
    'p93j7753': {
      'it': 'Email address',
      'en': 'Email address',
    },
    'dir0xzk1': {
      'it': 'Enter your email here...',
      'en': 'Enter your email here...',
    },
    '196fc0e7': {
      'it': 'Password',
      'en': 'Password',
    },
    'vvjilxa1': {
      'it': 'Enter your password here...',
      'en': 'Enter your password here...',
    },
    '2u08hxez': {
      'it': 'Repeat password',
      'en': 'Repeat password',
    },
    '09xsqhc7': {
      'it': 'Repeat your password here...',
      'en': 'Repeat your password here...',
    },
    'jsj5ozmr': {
      'it': 'Create Account',
      'en': 'Create Accounts',
    },
    'j2o82rr0': {
      'it': 'Already have an account?',
      'en': 'Already have an account?',
    },
    'bsnt8b4k': {
      'it': 'Login',
      'en': 'Login',
    },
    'zn6p6qz6': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // homePage_MAIN
  {
    'dp9hej2c': {
      'it': 'Welcome!',
      'en': 'Welcome!',
    },
    'g3i22t3r': {
      'it': 'Find your Dream Space To Getaway',
      'en': 'Find your dream space to getaway',
    },
    '21irdko8': {
      'it': 'Address, city, state...',
      'en': 'Address, city, state...',
    },
    's5p4frek': {
      'it': 'Search',
      'en': 'Search',
    },
    'lmtr4jln': {
      'it': 'Rating',
      'en': 'Ratings',
    },
    'inzf46lr': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // propertyDetails
  {
    'pmo8f62h': {
      'it': 'Reviews',
      'en': 'Reviews',
    },
    'bhwo41a4': {
      'it': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    'xkf2izy1': {
      'it': 'Amenities',
      'en': 'amenities',
    },
    'x2duv1y8': {
      'it': 'What people are saying',
      'en': 'What people are saying',
    },
    '16fmrtwh': {
      'it': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    'ml6vohk1': {
      'it':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim we come...',
    },
    '13pnlstt': {
      'it': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    'oz7e8m1h': {
      'it':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim we come...',
    },
    '3w4hiuia': {
      'it': '\$156',
      'en': '\$156',
    },
    '55p7rrs0': {
      'it': '+ taxes/fees',
      'en': '+ taxes/fees',
    },
    'rqvcxbna': {
      'it': 'per night',
      'en': 'per night',
    },
    'td482g11': {
      'it': 'Book Now',
      'en': 'Book Now',
    },
    'uss0xi08': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // searchProperties
  {
    'hdpi2jug': {
      'it': 'Search',
      'en': 'Search',
    },
    'gp3c49vh': {
      'it': 'Address, city, state...',
      'en': 'Address, city, state...',
    },
    '8wlp9fhs': {
      'it': 'Search',
      'en': 'Search',
    },
    '33fwmn9a': {
      'it': 'Rating',
      'en': 'Ratings',
    },
    'a1ybmolm': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // myTrips
  {
    'kn32ai48': {
      'it': 'Upcoming',
      'en': 'Upcoming',
    },
    '8b0l78x4': {
      'it': ' - ',
      'en': '-',
    },
    '9c7kutjd': {
      'it': 'Total',
      'en': 'Total',
    },
    'xrs89ynz': {
      'it': 'Completed',
      'en': 'Completed',
    },
    'cco5mrkp': {
      'it': 'Cancelled',
      'en': 'cancelled',
    },
    '07u8darg': {
      'it': ' - ',
      'en': '-',
    },
    '4d4qc7uy': {
      'it': 'Rate Trip',
      'en': 'Rate Trips',
    },
    '78l2v6cm': {
      'it': 'My Trips',
      'en': 'My Trips',
    },
    'g1emnyjm': {
      'it': 'My Trips',
      'en': 'My Trips',
    },
  },
  // tripDetails
  {
    'vgreht1f': {
      'it': 'Trip Details',
      'en': 'Trip Details',
    },
    'z0ymrtsi': {
      'it': 'Dates of trip',
      'en': 'Dates of trip',
    },
    'xqg03fe3': {
      'it': ' - ',
      'en': '-',
    },
    'toqb16ge': {
      'it': 'Destination',
      'en': 'Destination',
    },
    'u1uf5h6y': {
      'it': 'Price Breakdown',
      'en': 'Price Breakdown',
    },
    'n57hckr5': {
      'it': 'Base Price',
      'en': 'Base Price',
    },
    'ihp3jgkg': {
      'it': 'Taxes',
      'en': 'Taxes',
    },
    '9t90bvx6': {
      'it': '\$24.20',
      'en': '\$24.20',
    },
    'eqts3tnx': {
      'it': 'Cleaning Fee',
      'en': 'Cleaning Fee',
    },
    'izk3sl8v': {
      'it': '\$40.00',
      'en': '\$40.00',
    },
    'zwn92a49': {
      'it': 'Total',
      'en': 'Total',
    },
    'm3gcn4yk': {
      'it': 'Your trip has been completed!',
      'en': 'Your trip has been completed!',
    },
    '5jzxfm7m': {
      'it': 'Review Trip',
      'en': 'Review trip',
    },
    'sxps1j0c': {
      'it': 'Host Info',
      'en': 'Host Info',
    },
    'xv399wd7': {
      'it': 'Chat',
      'en': 'Chats',
    },
    'vzfo96t9': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // propertyReview
  {
    'uz7g8lxk': {
      'it': 'Reviews',
      'en': 'Reviews',
    },
    '58obyqde': {
      'it': '# of Ratings',
      'en': '# of Ratings',
    },
    't7g5r74d': {
      'it': 'Avg. Rating',
      'en': 'Avg. Rating',
    },
    'csadhhi7': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // bookNow
  {
    'utmz08hx': {
      'it': 'Book Now',
      'en': 'Book Now',
    },
    'ld6037l7': {
      'it': 'Choose Dates',
      'en': 'Choose Dates',
    },
    'oisvynpc': {
      'it': 'Number of Guests',
      'en': 'Number of Guests',
    },
    'uadv4lju': {
      'it': 'Choose an Option',
      'en': 'Choose an Option',
    },
    'u1d0hfsk': {
      'it': 'Breakfast',
      'en': 'Breakfasts',
    },
    'gg4h3w2q': {
      'it': 'No Breakfast',
      'en': 'No Breakfasts',
    },
    'it2p72ot': {
      'it': 'Hot Tub Access',
      'en': 'Hot Tub Access',
    },
    'idu78f83': {
      'it': 'No Access',
      'en': 'No Access',
    },
    'nzz97fmt': {
      'it': 'Payment Information',
      'en': 'Payment Information',
    },
    'fnk0gxgm': {
      'it': 'Base Price',
      'en': 'Base Price',
    },
    'vd9wei26': {
      'it': '\$156.00',
      'en': '\$156.00',
    },
    'jogdyu1r': {
      'it': 'Taxes',
      'en': 'Taxes',
    },
    'wkz28tuf': {
      'it': '\$24.20',
      'en': '\$24.20',
    },
    'nfe7djuj': {
      'it': 'Cleaning Fee',
      'en': 'Cleaning Fee',
    },
    'o1plnnzu': {
      'it': '\$40.00',
      'en': '\$40.00',
    },
    'kl8hnva2': {
      'it': 'Total',
      'en': 'Total',
    },
    'yjwhlbug': {
      'it': '\$230.20',
      'en': '\$230.20',
    },
    'kfould5i': {
      'it': 'Book Now',
      'en': 'Book Now',
    },
    'x4afaixi': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // profilePage
  {
    'n0pocfap': {
      'it': 'Switch to Dark Mode',
      'en': 'Switch to Dark Mode',
    },
    'naapo2l2': {
      'it': 'Switch to Light Mode',
      'en': 'Switch to Light Mode',
    },
    'jluc8s4q': {
      'it': 'Account Details',
      'en': 'Account Details',
    },
    'ws7rfmov': {
      'it': 'Edit Profile',
      'en': 'Edit Profile',
    },
    '8s7k7b79': {
      'it': 'Payment Information',
      'en': 'Payment Information',
    },
    'h8b9p6pj': {
      'it': 'Change Password',
      'en': 'Change Password',
    },
    '1z1hertq': {
      'it': 'My Garages',
      'en': 'My Garages',
    },
    'kaazbdyf': {
      'it': 'Submit Feedback',
      'en': 'Submit Feedback',
    },
    'a0vq98x5': {
      'it': 'Log Out',
      'en': 'Log out',
    },
    'ualpfaf1': {
      'it': 'Profile',
      'en': 'Profile',
    },
  },
  // paymentInfo
  {
    'sroy7v9j': {
      'it': 'Save Changes',
      'en': 'Save Changes',
    },
    'xyjhllaz': {
      'it': 'Payment Information',
      'en': 'Payment Information',
    },
    'zxukmmcp': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // editProfile
  {
    'uo0zx2e1': {
      'it': 'Edit Profile',
      'en': 'Edit Profile',
    },
    'z4hqee5d': {
      'it': 'Change Photo',
      'en': 'Change Photo',
    },
    'evkpzu5c': {
      'it': 'Full Name',
      'en': 'Full Name',
    },
    '3eb3rmv1': {
      'it': 'Your full name...',
      'en': 'Your full name...',
    },
    '5u1h3o1b': {
      'it': 'Full Name',
      'en': 'Full Name',
    },
    'miq4vu0k': {
      'it': 'Your full name...',
      'en': 'Your full name...',
    },
    'ds2e0pl5': {
      'it': 'Email Address',
      'en': 'Email Address',
    },
    'lfbfeyov': {
      'it': 'Your email..',
      'en': 'Your email..',
    },
    'olzfnu2z': {
      'it': 'Phone number',
      'en': 'Phone number',
    },
    'pfiwn8cl': {
      'it': 'Your email..',
      'en': 'Your email..',
    },
    'z0srfpww': {
      'it': 'Change document',
      'en': 'Change documents',
    },
    'r3z5gw3c': {
      'it': 'Save Changes',
      'en': 'Save Changes',
    },
    'u3j9bxs2': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // changePassword
  {
    'zf67tqm5': {
      'it': 'Email Address',
      'en': 'Email Address',
    },
    't7s9baai': {
      'it': 'Your email..',
      'en': 'Your email..',
    },
    '2rh86q8g': {
      'it':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
    },
    '81o9esk0': {
      'it': 'Send Reset Link',
      'en': 'Send Reset Link',
    },
    'u67q9cs0': {
      'it': 'Change Password',
      'en': 'Change Password',
    },
    '05j5xf08': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_1
  {
    'h2soni65': {
      'it': 'Address',
      'en': 'Address',
    },
    '301hbfan': {
      'it': 'Address and number, e.g. Via Montebello 2',
      'en': 'Address and number, e.g. Via Montebello 2',
    },
    '4oaetb3l': {
      'it': 'City',
      'en': 'city',
    },
    '3yxqi08s': {
      'it': 'City, e.g. Milano',
      'en': 'City, e.g. Milan',
    },
    'urq3sik5': {
      'it': 'ZIP',
      'en': 'ZIP',
    },
    'o4270z5g': {
      'it': 'ZIP, e.g. 20063',
      'en': 'ZIP, e.g. 20063',
    },
    'zn5hzo8j': {
      'it': 'Use GPS positioning to determine your precise location',
      'en': 'Use GPS positioning to determine your precise location',
    },
    'i5gwkzdi': {
      'it': 'LOCATE ME',
      'en': 'LOCATE ME',
    },
    'bix1my36': {
      'it':
          'Select the maximum size of vehicle that your parking space can accommodate',
      'en':
          'Select the maximum size of vehicle that your parking space can accommodate',
    },
    'rn4v6wi6': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '57awi7x4': {
      'it': '1/3',
      'en': '1/3',
    },
    'i3xserbg': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    '7z9eteq8': {
      'it': 'Create Garage',
      'en': 'Create Garage',
    },
    'kx522eeg': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // HomePage_ALT
  {
    'dygmlgm3': {
      'it': 'Welcome!',
      'en': 'Welcome!',
    },
    'qokrdyeb': {
      'it': 'Find your Dream Space',
      'en': 'Find your dream space',
    },
    'dwyea2t8': {
      'it': 'Address, city, state...',
      'en': 'Address, city, state...',
    },
    '95hywctt': {
      'it': 'Search',
      'en': 'Search',
    },
    '4norddzl': {
      'it': '4/5 reviews',
      'en': '4/5 reviews',
    },
    'hb21agit': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_2
  {
    '3grlob0t': {
      'it': 'Create Property',
      'en': 'Create Property',
    },
    '3pwoc3su': {
      'it': 'CHOOSE YOUR AMENITIES',
      'en': 'CHOOSE YOUR AMENITIES',
    },
    '3ai2omsb': {
      'it': 'Pool',
      'en': 'Pool',
    },
    'lg93dg0t': {
      'it': 'EV Car Charging',
      'en': 'EV Car Charging',
    },
    '407pkpiu': {
      'it': 'Extra Outlets',
      'en': 'Extra Outlets',
    },
    '16dwyk4f': {
      'it': 'Air Conditioning (AC)',
      'en': 'Air Conditioning (AC)',
    },
    'e2lr65di': {
      'it': 'Heating',
      'en': 'Heating',
    },
    'zp9ksitr': {
      'it': 'Washer',
      'en': 'Washers',
    },
    'bpwojc21': {
      'it': 'Dryer',
      'en': 'dryer',
    },
    'sj41kf1m': {
      'it': 'Pet Friendly',
      'en': 'Pet Friendly',
    },
    'qzsz0g48': {
      'it': 'Workout Facility',
      'en': 'Workout Facility',
    },
    'pvymdpw1': {
      'it': 'Hip',
      'en': 'Hip',
    },
    '6nm7slft': {
      'it': 'Night Life',
      'en': 'Night Life',
    },
    'paljp9vj': {
      'it': 'STEP',
      'en': 'STEP',
    },
    'n0i41d7j': {
      'it': '2/3',
      'en': '2/3',
    },
    'us3vitvs': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    '988mgmve': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_3
  {
    'zjo88nu3': {
      'it': 'Create Property',
      'en': 'Create Property',
    },
    'yqmb335b': {
      'it': 'PRICE PER NIGHT',
      'en': 'PRICE PER NIGHT',
    },
    '1a51b7np': {
      'it': '\$ Price',
      'en': '\$Price',
    },
    'mudehfys': {
      'it': 'MINIMUM NIGHT STAY',
      'en': 'MINIMUM NIGHT STAY',
    },
    'x90naf0e': {
      'it': 'TAX RATE',
      'en': 'TAX RATE',
    },
    'mjif67n7': {
      'it': '% Rate',
      'en': '% rate',
    },
    'wpwh21x5': {
      'it': 'CLEANING FEE',
      'en': 'CLEANING FEE',
    },
    'n1n2o1k9': {
      'it': '\$ Price',
      'en': '\$Price',
    },
    'ghdujckq': {
      'it': 'Additional Notes',
      'en': 'Additional Notes',
    },
    'wkvjoe9q': {
      'it': 'Additional notes...',
      'en': 'Additional notes...',
    },
    's15pgp01': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '696nfshq': {
      'it': '3/3',
      'en': '3/3',
    },
    'ilkk8l2g': {
      'it': 'PUBLISH',
      'en': 'PUBLISH',
    },
    'np8bc499': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // myProperties
  {
    'w8i2qb61': {
      'it': 'Published',
      'en': 'Published',
    },
    'v493gzow': {
      'it': 'Price Per Night',
      'en': 'Price Per Night',
    },
    'kv9usgi8': {
      'it': 'Drafts',
      'en': 'Drafts',
    },
    'vr9wu14u': {
      'it': 'Price Per Night',
      'en': 'Price Per Night',
    },
    'ayoo2frd': {
      'it': 'My Properties',
      'en': 'My Properties',
    },
    '8gx0r6jh': {
      'it': 'My Trips',
      'en': 'My Trips',
    },
  },
  // propertyDetails_Owner
  {
    'bzn5iznf': {
      'it': 'Reviews',
      'en': 'Reviews',
    },
    'sjnp8afl': {
      'it': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    '8mhvfnad': {
      'it': 'Amenities',
      'en': 'amenities',
    },
    'zql5p8dk': {
      'it': 'What people are saying',
      'en': 'What people are saying',
    },
    'ycmg6qb6': {
      'it': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    'rs4q4xxn': {
      'it':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim we come...',
    },
    'jygr6kgt': {
      'it': 'Josh Richardson',
      'en': 'Josh Richardson',
    },
    '2s4tyeoa': {
      'it':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim we come...',
    },
    'efn2769v': {
      'it': '\$156',
      'en': '\$156',
    },
    'c9yrvrtg': {
      'it': '+ taxes/fees',
      'en': '+ taxes/fees',
    },
    '92uvvp7v': {
      'it': 'per night',
      'en': 'per night',
    },
    'yieyn7g5': {
      'it': 'Edit Property',
      'en': 'Edit Property',
    },
    'ewrjfg4o': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // myBookings
  {
    'nz0mlbw0': {
      'it': 'Upcoming ',
      'en': 'Upcoming',
    },
    'j9hl8get': {
      'it': ' - ',
      'en': '-',
    },
    'aj73ld71': {
      'it': 'Total',
      'en': 'Total',
    },
    'p98lzxy8': {
      'it': 'Completed',
      'en': 'Completed',
    },
    'nhwy1zhj': {
      'it': ' - ',
      'en': '-',
    },
    'bb5wzzeh': {
      'it': 'Total',
      'en': 'Total',
    },
    '5llvxjs1': {
      'it': 'My Bookings',
      'en': 'My Bookings',
    },
    'ojyk3qll': {
      'it': 'My Trips',
      'en': 'My Trips',
    },
  },
  // tripDetailsHOST
  {
    '77qinnvm': {
      'it': 'Trip Details',
      'en': 'Trip Details',
    },
    'b4j7mbn3': {
      'it': 'Dates of trip',
      'en': 'Dates of trip',
    },
    'fkncaudd': {
      'it': ' - ',
      'en': '-',
    },
    'pt5de0e3': {
      'it': 'Destination',
      'en': 'Destination',
    },
    '7n05ckso': {
      'it': 'Price Breakdown',
      'en': 'Price Breakdown',
    },
    'ammn2kcj': {
      'it': 'Base Price',
      'en': 'Base Price',
    },
    'u17c9ogs': {
      'it': 'Taxes',
      'en': 'Taxes',
    },
    'th0drjcc': {
      'it': '\$24.20',
      'en': '\$24.20',
    },
    '5ouk0xth': {
      'it': 'Cleaning Fee',
      'en': 'Cleaning Fee',
    },
    'qhjn2xmr': {
      'it': '\$40.00',
      'en': '\$40.00',
    },
    'z1a0wjss': {
      'it': 'Total',
      'en': 'Total',
    },
    '4jy7qzua': {
      'it': 'Mark this trip as complete below.',
      'en': 'Mark this trip as complete below.',
    },
    'ljplmaoh': {
      'it': 'Mark as Complete',
      'en': 'Mark as Complete',
    },
    '0xyp41rt': {
      'it': 'Guest Info',
      'en': 'Guest Info',
    },
    'kp8ejykd': {
      'it': 'Chat',
      'en': 'Chats',
    },
    'g7bpf3mk': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_1
  {
    '002z5uix': {
      'it': 'Edit Property',
      'en': 'Edit Property',
    },
    'w5ndto32': {
      'it': 'PROPERTY NAME',
      'en': 'PROPERTY NAME',
    },
    '3mu51lw3': {
      'it': 'Something Catchy...',
      'en': 'Something Catchy...',
    },
    '3t1n23l9': {
      'it': 'PROPERTY ADDRESS',
      'en': 'PROPERTY ADDRESS',
    },
    'q0or1s0b': {
      'it': '123 Disney way here…',
      'en': '123 Disney way here…',
    },
    'cqxxn7lz': {
      'it': 'NEIGHBORHOOD',
      'en': 'NEIGHBORHOOD',
    },
    '2b7uqfnd': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    'bmquvkoa': {
      'it': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    'f5do13k2': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    'uxxnf1ti': {
      'it': 'STEP',
      'en': 'STEP',
    },
    'dr1pktvj': {
      'it': '1/3',
      'en': '1/3',
    },
    'g2ljli9l': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    'uz7phf22': {
      'it': 'We need to know the name of the place...',
      'en': 'We need to know the name of the place...',
    },
    'j9lg9mdu': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_2
  {
    'uav5dqtv': {
      'it': 'Edit Property',
      'en': 'Edit Property',
    },
    'yij2ykk0': {
      'it': 'CHOOSE YOUR AMENITIES',
      'en': 'CHOOSE YOUR AMENITIES',
    },
    'umuwfyai': {
      'it': 'Pool',
      'en': 'Pool',
    },
    'vgwgq692': {
      'it': 'EV Car Charging',
      'en': 'EV Car Charging',
    },
    '8pr5b3jc': {
      'it': 'Extra Outlets',
      'en': 'Extra Outlets',
    },
    'h00peps2': {
      'it': 'Air Conditioning (AC)',
      'en': 'Air Conditioning (AC)',
    },
    'z8wi5kdu': {
      'it': 'Heating',
      'en': 'Heating',
    },
    'mmateffh': {
      'it': 'Washer',
      'en': 'Washers',
    },
    'g9iu68da': {
      'it': 'Dryer',
      'en': 'dryer',
    },
    '7xqvgg9p': {
      'it': 'Pet Friendly',
      'en': 'Pet Friendly',
    },
    'yg1hjz08': {
      'it': 'Workout Facility',
      'en': 'Workout Facility',
    },
    'a7tiwfkq': {
      'it': 'Hip',
      'en': 'Hip',
    },
    'ggrj35a0': {
      'it': 'Night Life',
      'en': 'Night Life',
    },
    'ruozwg6t': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '1l3vskyr': {
      'it': '2/3',
      'en': '2/3',
    },
    '50p2w27c': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    's79w45x3': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // editProperty_3
  {
    'tafowi86': {
      'it': 'Edit Property',
      'en': 'Edit Property',
    },
    '0115cfvp': {
      'it': 'PRICE PER NIGHT',
      'en': 'PRICE PER NIGHT',
    },
    '2n7fzbe3': {
      'it': '\$ Price',
      'en': '\$Price',
    },
    'idlwk4xf': {
      'it': 'MINIMUM NIGHT STAY',
      'en': 'MINIMUM NIGHT STAY',
    },
    '2m67qlxi': {
      'it': 'TAX RATE',
      'en': 'TAX RATE',
    },
    'i8h8484x': {
      'it': '% Rate',
      'en': '% rate',
    },
    'f1ys5bu2': {
      'it': 'CLEANING FEE',
      'en': 'CLEANING FEE',
    },
    'zekptzq8': {
      'it': '\$ Price',
      'en': '\$Price',
    },
    '5key8cil': {
      'it': 'Additional Notes',
      'en': 'Additional Notes',
    },
    'jpx4avd4': {
      'it': 'Additional notes...',
      'en': 'Additional notes...',
    },
    'ywfvur4o': {
      'it': 'Listing is Live',
      'en': 'Listing is live',
    },
    'dppagptn': {
      'it': 'Turn this on for guests to start booking your listing.',
      'en': 'Turn this on for guests to start booking your listing.',
    },
    '7tecv8t8': {
      'it': 'STEP',
      'en': 'STEP',
    },
    'v1llgdrk': {
      'it': '3/3',
      'en': '3/3',
    },
    'k0l3di21': {
      'it': 'Save Changes',
      'en': 'Save Changes',
    },
    'hkzawnax': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // forgotPassword
  {
    'pz7loutv': {
      'it': 'PNext',
      'en': 'PNext',
    },
    'pskxqbob': {
      'it': 'Welcome Back,',
      'en': 'Welcome Back,',
    },
    'g9cy97xu': {
      'it': 'Email Address',
      'en': 'Email Address',
    },
    'qsyk8xcw': {
      'it': 'Enter your email here...',
      'en': 'Enter your email here...',
    },
    'pq97wf9w': {
      'it': 'Send link',
      'en': 'Send link',
    },
    'ogihnoeo': {
      'it':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
    },
    'mlpbv6bk': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // garage_page1
  {
    '0xdyykah': {
      'it': 'PROPERTY NAME',
      'en': 'PROPERTY NAME',
    },
    '0c4lpvc4': {
      'it': 'Something Catchy...',
      'en': 'Something Catchy...',
    },
    '07iff1v6': {
      'it': 'PROPERTY ADDRESS',
      'en': 'PROPERTY ADDRESS',
    },
    'gdm4rdto': {
      'it': '123 Disney way here…',
      'en': '123 Disney way here…',
    },
    '9jtm6gks': {
      'it': 'NEIGHBORHOOD',
      'en': 'NEIGHBORHOOD',
    },
    '6pvv38ws': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    '8s64csmr': {
      'it': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    'kwd6c4ol': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    's86she34': {
      'it': 'STEP',
      'en': 'STEP',
    },
    'u2ky8ecn': {
      'it': '1/3',
      'en': '1/3',
    },
    'kittw1qk': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    'dgi1qmh1': {
      'it': 'Create Property',
      'en': 'Create Property',
    },
    'nkhpuf2x': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // createProperty_1Copy
  {
    'g9yfo53t': {
      'it': 'PROPERTY NAME',
      'en': 'PROPERTY NAME',
    },
    'g1az3bp1': {
      'it': 'Something Catchy...',
      'en': 'Something Catchy...',
    },
    'n5lrygx9': {
      'it': 'PROPERTY ADDRESS',
      'en': 'PROPERTY ADDRESS',
    },
    'dmx2ukki': {
      'it': '123 Disney way here…',
      'en': '123 Disney way here…',
    },
    'o4jc9gq5': {
      'it': 'NEIGHBORHOOD',
      'en': 'NEIGHBORHOOD',
    },
    '9n1407nz': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    'm64yxd4l': {
      'it': 'DESCRIPTION',
      'en': 'DESCRIPTION',
    },
    'a3jqus9f': {
      'it': 'Neighborhood or city…',
      'en': 'Neighborhood or city…',
    },
    'g2b3vwk6': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '0j9xpu2t': {
      'it': '1/3',
      'en': '1/3',
    },
    '605i15t3': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    'hkmnqsem': {
      'it': 'Create Property',
      'en': 'Create Property',
    },
    'd0p648vd': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // garage_availabilities
  {
    'k8skpntz': {
      'it': 'Crea un Garage',
      'en': '',
    },
    't4w3wzij': {
      'it':
          'Seleziona il primo giorno della settimana in cui il tuo box è disponibile. Ti chiederemo poi le fasce orarie in cui vuoi noleggiare il tuo posto auto. Replica l’operazione per ogni giorno della settimana in cui il garage è disponibile.',
      'en': 'Indicates, for each day, the available time slot',
    },
    'ljsmfon5': {
      'it': 'M',
      'en': 'm',
    },
    'fb6ntsqu': {
      'it': 'T',
      'en': 'T',
    },
    '7pbe2mbq': {
      'it': 'W',
      'en': 'w',
    },
    'v74pldr6': {
      'it': 'T',
      'en': 'T',
    },
    'upppuqmj': {
      'it': 'F',
      'en': 'f',
    },
    '1u2q7hty': {
      'it': 'S',
      'en': 'St',
    },
    '732mz6cm': {
      'it': 'S',
      'en': 'St',
    },
    '0zxet7yn': {
      'it':
          'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
      'en':
          'Your availability can be changed at any other time from the main menu',
    },
    '60f2f0z5': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'gar65yab': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_2
  {
    'n6q3vi73': {
      'it': 'Create Property',
      'en': 'Create Property',
    },
    'hifeg46w': {
      'it': 'CHOOSE YOUR AMENITIES',
      'en': 'CHOOSE YOUR AMENITIES',
    },
    'q0e5nhwi': {
      'it': 'Pool',
      'en': 'Pool',
    },
    '7ls81tvp': {
      'it': 'EV Car Charging',
      'en': 'EV Car Charging',
    },
    'gxy3scco': {
      'it': 'Extra Outlets',
      'en': 'Extra Outlets',
    },
    'l042si12': {
      'it': 'Air Conditioning (AC)',
      'en': 'Air Conditioning (AC)',
    },
    'c2nrvqnl': {
      'it': 'Heating',
      'en': 'Heating',
    },
    'tnq1b7h9': {
      'it': 'Washer',
      'en': 'Washers',
    },
    '6lvoio7i': {
      'it': 'Dryer',
      'en': 'dryer',
    },
    'tu9jwjg4': {
      'it': 'Pet Friendly',
      'en': 'Pet Friendly',
    },
    'txyx7aak': {
      'it': 'Workout Facility',
      'en': 'Workout Facility',
    },
    'f1i403v1': {
      'it': 'Hip',
      'en': 'Hip',
    },
    'och4oani': {
      'it': 'Night Life',
      'en': 'Night Life',
    },
    't67lfhg9': {
      'it': 'STEP',
      'en': 'STEP',
    },
    'etrlss3o': {
      'it': '2/3',
      'en': '2/3',
    },
    'qr5cigv8': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    'hpcc79xw': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_4_price
  {
    '1kkbbo0i': {
      'it': 'Crea un Garage',
      'en': '',
    },
    'ac9272j3': {
      'it': 'Inserisci la tua tariffa oraria',
      'en': 'Enter your hourly rate',
    },
    'kqfrxfjx': {
      'it': '0.00 €',
      'en': '\$ Price',
    },
    '4ktnb6q5': {
      'it':
          'Scegli la tariffa oraria per il tuo posto auto da affittare, ma ricordati di essere concorrenziale rispetto alla tua zona della città. \nSe prosegui, otterrai una stima del tuo potenziale guadagno nel periodo di disponibilità del posto auto che hai scelto.',
      'en':
          'Instructions on how to enter a rate that makes sense\n\nInstructions on what remains in the net user\'s pocket\nof fees',
    },
    '1wkkegs1': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    '5f0056xr': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // Create_Garage_3
  {
    '6lt9w9wp': {
      'it': 'Crea un Garage',
      'en': '',
    },
    'nn1i2s0y': {
      'it': 'Inserisci le informazioni\nper l\'accesso al tuo posto auto',
      'en': 'Enter your information\nfor access to your parking space',
    },
    'eat1v6kw': {
      'it': 'Posto auto sempre accessibile',
      'en': 'Parking space always accessible',
    },
    'bv2c6oz2': {
      'it': 'Servono chiavi o telecomando per accedere',
      'en': 'You need keys or a remote control to access',
    },
    '4bouw7jq': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // TimeslotCalendar
  {
    'sgfpkc7z': {
      'it': 'Crea un Garage',
      'en': '',
    },
    'fgpazrv5': {
      'it':
          'Seleziona il periodo di validità della disponibilità del tuo parcheggio',
      'en': 'Select the period of validity of the availability of your parking',
    },
    'fpyrvtp6': {
      'it': 'Data d\'inizio',
      'en': 'Start date',
    },
    'kf2xmaak': {
      'it': '-',
      'en': '-',
    },
    'ua3q8gos': {
      'it': 'Data di fine',
      'en': 'End date',
    },
    's537pauw': {
      'it': '-',
      'en': '-',
    },
    '57039w04': {
      'it':
          'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
      'en':
          'Your availability can be changed at any other time from the main menu',
    },
    'igha3iim': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'qyurzcgs': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_2_foto_video
  {
    'woisy49q': {
      'it': 'Descrizione',
      'en': 'Description',
    },
    'ckk19wvf': {
      'it': 'Descrizione',
      'en': 'Description',
    },
    'a4mdbw2c': {
      'it': 'FOTO',
      'en': 'PHOTO',
    },
    'bu6wxn80': {
      'it': 'VIDEO',
      'en': 'VIDEO',
    },
    'mgz6ysd6': {
      'it': 'Conferma',
      'en': 'AFTER YOU',
    },
    'ykhbeid0': {
      'it': 'Crea un Garage',
      'en': 'Create a Garage',
    },
    '9uxs5poo': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // foto_video
  {
    'dre9y8jm': {
      'it': 'Blabla photo',
      'en': 'Blabla photo',
    },
    'nhbmy0ue': {
      'it': 'FOTO',
      'en': 'PHOTO',
    },
    'levd56wi': {
      'it': 'Blabla video',
      'en': 'Blah videos',
    },
    'yda84pat': {
      'it': 'VIDEO',
      'en': 'VIDEO',
    },
    'insdoxy1': {
      'it': 'Blabla preview',
      'en': 'Blabla preview',
    },
    'bgzc0q02': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '3hf2imim': {
      'it': '1/3',
      'en': '1/3',
    },
    '686pwv58': {
      'it': 'SUBMIT',
      'en': 'SUBMIT',
    },
    '7ekzzh28': {
      'it': 'Create Garage',
      'en': 'Create Garage',
    },
    'pilprzyc': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // TimeslotCalendarCopy
  {
    '7ghcxr66': {
      'it':
          'Seleziona il periodo di validità della disponibilità del tuo parcheggio',
      'en': 'Select the period of validity of the availability of your parking',
    },
    'uu3cxh3p': {
      'it': 'Start Date',
      'en': 'Start Dates',
    },
    'xdfq6023': {
      'it': '-',
      'en': '-',
    },
    'n8l7irln': {
      'it': 'End Date',
      'en': 'End Date',
    },
    'l0xscx08': {
      'it': '-',
      'en': '-',
    },
    '76vleqxt': {
      'it':
          'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
      'en':
          'Your availability can be changed at any other time from the main menu',
    },
    'i7x03ob1': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'slavt6jw': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_disclaimer_page
  {
    'awl3lx92': {
      'it': 'Crea un Garage',
      'en': '',
    },
    'rygpw1p8': {
      'it': 'Keybox password',
      'en': 'Password Keybox',
    },
    'naw0tsyy': {
      'it': 'Password',
      'en': 'Password',
    },
    'rnztlife': {
      'it': 'Conferma',
      'en': 'I confirm',
    },
    'd7gbb2fe': {
      'it': 'Confermo di aver preso visione del disclaimer',
      'en': 'I confirm that I have read the disclaimer',
    },
    '0ty3cktg': {
      'it':
          'Attenzione! Se per raggiungere il posto auto che vuoi condividere sono necessarie chiavi o telecomandi, accertati di avere già installato una cassetta portachiavi di sicurezza ben visibile e raggiungibile dall\'esterno. Tieni a portata di mano il codice di apertura della cassetta portachiavi, ti chiederemo di inserirlo durante la registrazione. Noi condivideremo il codice di apertura solo con chi ha deciso di utilizzare il tuo posto auto. Periodicamente ti consigliamo di cambiare il codice di apertura della cassetta portachiavi.',
      'en':
          'Disclaimer that you must have one\nkey box to make them accessible\nto the customer who will access by unlocking the padlock with\npassword that you will later have to upload to the\nyour profile',
    },
    '92oegxur': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // Confirm_Page
  {
    'qwaqepcr': {
      'it': 'Crea un Garage',
      'en': '',
    },
    '2r6m22b6': {
      'it':
          'Se per metà del tempo messo a disposizione il tuo \nbox verrà affittato allora potrai guadagnare fino a ',
      'en':
          'If half the time put your own at your disposal\nbox will be rented then you can earn up to',
    },
    '152d2qgu': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'aetorj2c': {
      'it': 'Voglio modificare la tariffa oraria',
      'en': 'I want to change the hourly rate',
    },
    'wg8e2c60': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_1
  {
    '3o9sbu15': {
      'it': 'Indica quando hai bisogno del parcheggio',
      'en': 'Indicate when you need parking',
    },
    'ha283qkp': {
      'it': 'Data e orario di arrivo',
      'en': 'Date and time of arrival',
    },
    'brfl8xpp': {
      'it': 'Seleziona orario fine sosta',
      'en': 'Select stop time',
    },
    'sgd6knz9': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'fakstugh': {
      'it': 'Data e orario fine sosta',
      'en': 'Stop date and time',
    },
    'mwd62q9p': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_2
  {
    'kr4gm58a': {
      'it': 'Inserisci informazioni relative al tuo veicolo',
      'en': 'Enter information about your vehicle',
    },
    'v0z5evac': {
      'it': 'Seleziona grandezza veicolo',
      'en': 'Select vehicle size',
    },
    'kt7cpjsv': {
      'it': 'truck',
      'en': 'truck',
    },
    '8a1gi4tn': {
      'it': 'car',
      'en': 'car',
    },
    'vtq8h5ti': {
      'it': 'bike',
      'en': 'bike',
    },
    'e01o9ktr': {
      'it': 'caravan',
      'en': 'caravan',
    },
    '6s5swrqt': {
      'it': 'big truck',
      'en': 'big trucks',
    },
    'jexc8uni': {
      'it': 'inserisci targa',
      'en': 'enter license plate',
    },
    '4h7i8occ': {
      'it': 'XX000XX',
      'en': 'XX000XX',
    },
    '0druetur': {
      'it': 'Cerca parcheggio',
      'en': 'Search for parking',
    },
    'duy9t98d': {
      'it': 'size',
      'en': 'size',
    },
    'bg0yju8w': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_4
  {
    'hw2r0fyk': {
      'it': 'La tua prenotazione è avvenuta con successo',
      'en': 'Your booking has been successful',
    },
    'kglxpo56': {
      'it': 'Come accedere al posto auto',
      'en': 'How to access the parking space',
    },
    '1a7f43jx': {
      'it': 'Vai alle mie prenotazioni',
      'en': 'Go to my reservations',
    },
    'q0n6l99g': {
      'it': 'Torna alla Homepage',
      'en': 'Back to home Page',
    },
    'y2xc67m5': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_5
  {
    '7rjj2cph': {
      'it': 'Conferma pagamento',
      'en': 'Confirm payment',
    },
    'c08oez07': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // homePage_Garages
  {
    '95yukop1': {
      'it': 'Book now',
      'en': 'Book now',
    },
    'l4ckmd0s': {
      'it': 'Welcome!',
      'en': 'Welcome!',
    },
    'eeono631': {
      'it': 'Find your Garage Space To Getaway',
      'en': 'Find your garage space to get away',
    },
    'xmfxedpx': {
      'it': 'List',
      'en': 'List',
    },
    'hvyb6a97': {
      'it': '€ all\'ora + tasse',
      'en': '€ per hour + taxes',
    },
    'e8rcxj1k': {
      'it': 'Map',
      'en': 'Map',
    },
    '5poyecr3': {
      'it': 'Seleziona Location',
      'en': 'Select Location',
    },
    '698462ir': {
      'it': 'Individuare sulla mappa',
      'en': 'Locate on the map',
    },
    '7f459v7r': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // garageDetails
  {
    'g8tlg1tz': {
      'it': 'Edit',
      'en': 'Edit',
    },
    'vpjv1ga3': {
      'it': 'Delete',
      'en': 'Delete',
    },
    '81qxirj8': {
      'it': 'Description',
      'en': 'Description',
    },
    'qrv0qs85': {
      'it': 'Suitable for',
      'en': 'Suitable for',
    },
    'x6klpsip': {
      'it': 'Garage availabilities',
      'en': 'Garage availabilities',
    },
    '0imd63s1': {
      'it': 'Monday',
      'en': 'Monday',
    },
    's4z1jg2b': {
      'it': '-',
      'en': '-',
    },
    '9ferv121': {
      'it': 'Tuesday',
      'en': 'Tuesday',
    },
    '6umsbr8d': {
      'it': '-',
      'en': '-',
    },
    '2cevhn5u': {
      'it': 'Wednesday',
      'en': 'Wednesday',
    },
    'tnzaizsr': {
      'it': '-',
      'en': '-',
    },
    '387mv1rr': {
      'it': 'Thursday',
      'en': 'Thursday',
    },
    'm5y8r5zn': {
      'it': '-',
      'en': '-',
    },
    'gwyskts6': {
      'it': 'Friday',
      'en': 'Friday',
    },
    '9xhb2xkt': {
      'it': '-',
      'en': '-',
    },
    'n9pr836w': {
      'it': 'Saturday',
      'en': 'Saturday',
    },
    '3v42akl6': {
      'it': '-',
      'en': '-',
    },
    'tua84c2i': {
      'it': 'Sunday',
      'en': 'Sunday',
    },
    'jdm0tx0e': {
      'it': '-',
      'en': '-',
    },
    '5ui2od7p': {
      'it': 'Garage accessibility -',
      'en': 'Accessibility Garages -',
    },
    'ho07foba': {
      'it': ' always accessible',
      'en': 'always accessible',
    },
    'qvyii3ac': {
      'it': 'requires key or remote control',
      'en': 'requires key or remote control',
    },
    'jqlo7e0m': {
      'it': 'Keybox password -',
      'en': 'Password Keybox -',
    },
    'ngpip78c': {
      'it': 'XXXX',
      'en': 'XXXX',
    },
    '2wtdrwfe': {
      'it': '€ + taxes/fees',
      'en': '€ + taxes/fees',
    },
    '85l7wc85': {
      'it': 'per hour',
      'en': 'per hour',
    },
    'ktvp84e4': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // ownersGarages
  {
    '3rim3epx': {
      'it': '€ all\'ora + tasse',
      'en': '€ per hour + taxes',
    },
    'xezgzbnw': {
      'it': 'Your garages',
      'en': 'Your garages',
    },
    'l5te3c2c': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_3Map
  {
    'rqcks3fk': {
      'it': 'Seleziona Location',
      'en': 'Select Location',
    },
    't01k7gor': {
      'it': 'Individuare sulla mappa',
      'en': 'Locate on the map',
    },
    'ni7cyusz': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_1Peppe
  {
    'txc8sb9i': {
      'it': 'Registra con GPS dove si trova il tuo parcheggio',
      'en': 'Record with GPS where your parking is',
    },
    'qsgubxiw': {
      'it': 'Premi qui quando sei di fronte al posto auto ',
      'en': 'Press here when you are in front of the parking space',
    },
    'ylfcbkrh': {
      'it': 'OPPURE',
      'en': 'OR',
    },
    'nufdleb8': {
      'it': 'Inserisci l\'indirizzo esatto',
      'en': 'Enter the exact address',
    },
    'sk2pdndp': {
      'it': 'Address',
      'en': 'Address',
    },
    'xubpv1ur': {
      'it': 'Address and number, e.g. Via Montebello 2',
      'en': 'Address and number, e.g. Via Montebello 2',
    },
    '21cozqd8': {
      'it': 'City',
      'en': 'city',
    },
    'iadsrane': {
      'it': 'City, e.g. Milano',
      'en': 'City, e.g. Milan',
    },
    'yxug6zf7': {
      'it': 'ZIP',
      'en': 'ZIP',
    },
    'ffyyvba3': {
      'it': 'ZIP, e.g. 20063',
      'en': 'ZIP, e.g. 20063',
    },
    'g3pvwemx': {
      'it':
          'Select the maximum size of vehicle that your parking space can accommodate',
      'en':
          'Select the maximum size of vehicle that your parking space can accommodate',
    },
    'av98txlr': {
      'it': 'STEP',
      'en': 'STEP',
    },
    '3sata8vo': {
      'it': '1/3',
      'en': '1/3',
    },
    'a3y4wc6s': {
      'it': 'NEXT',
      'en': 'NEXT',
    },
    'zou2b66a': {
      'it': 'Create Garage',
      'en': 'Create Garage',
    },
    'lp4px73c': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_1PeppeCopy
  {
    'mpzqor2u': {
      'it': 'Posizione attuale',
      'en': 'Actual position',
    },
    'bhfoygcg': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservations
  {
    '1h1inw9d': {
      'it': 'Indica quando hai bisogno del parcheggio',
      'en': 'Indicate when you need parking',
    },
    'vrdf11lo': {
      'it': 'Orario di arrivo',
      'en': 'Arrival time',
    },
    '3c95llz2': {
      'it': 'hm',
      'en': 'hmm',
    },
    'bi1huivn': {
      'it': 'Seleziona orario fine sosta',
      'en': 'Select stop time',
    },
    'p0ka2wbk': {
      'it': 'Orario fine sosta',
      'en': 'Parking end time',
    },
    'ktrkd13k': {
      'it': 'Motorcycle',
      'en': 'motorcycle',
    },
    'hcwcv6we': {
      'it': 'Car',
      'en': 'Car',
    },
    '0d3x6n1u': {
      'it': 'SuV',
      'en': 'SuV',
    },
    'jfhatu0s': {
      'it': 'Truck',
      'en': 'Truck',
    },
    'axd0awdh': {
      'it': 'Caravan',
      'en': 'Caravan',
    },
    'soylc591': {
      'it': 'Cerca sulla mappa',
      'en': 'Search on the map',
    },
    '8ulc4vgq': {
      'it': 'Inserisci informazioni relative al tuo veicolo',
      'en': 'Enter information about your vehicle',
    },
    'a9ez6122': {
      'it': '[Some hint text...]',
      'en': '[Some hint text...]',
    },
    '4xwjka01': {
      'it': 'XX000XX',
      'en': 'XX000XX',
    },
    'iajguebg': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // create_garage_1PlacePicker
  {
    '4dzu8c5k': {
      'it': 'Crea un Garage',
      'en': 'Create a Garage',
    },
    '29jzb9d0': {
      'it': 'Registra con GPS dove si trova il tuo parcheggio',
      'en': 'Record with GPS where your parking is',
    },
    'gdvm5m69': {
      'it': 'Seleziona Location',
      'en': 'Select Location',
    },
    '7gqqeapa': {
      'it':
          'Seleziona la taglia del veicolo che il tuo posto auto può ospitare',
      'en': 'Select the size of vehicle your parking space can accommodate',
    },
    'z0v276a6': {
      'it': 'Conferma',
      'en': 'AFTER YOU',
    },
    'ucvrk0xl': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_address
  {
    '9zsbjsj8': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    '6neym105': {
      'it': 'Registra con GPS dove si trova il tuo parcheggio',
      'en': 'Record with GPS where your parking is',
    },
    'j4e5ifx4': {
      'it': 'Seleziona Location',
      'en': 'Select Location',
    },
    'luhxjwd9': {
      'it': 'MODIFICA',
      'en': 'EDIT',
    },
    'i6r80eg4': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage
  {
    'no9rcbkf': {
      'it': 'Dettagli del Garage',
      'en': 'Garage details',
    },
    'bcr1hjwz': {
      'it': 'Modifica indirizzo',
      'en': 'Change address',
    },
    'fymvf0rk': {
      'it': 'Modifica prezzo',
      'en': 'Change price',
    },
    'vtmw4rrn': {
      'it': 'Modifica tipo di veicolo',
      'en': 'Change vehicle type',
    },
    '6pbwkdjl': {
      'it': 'Modifica disponibilità della chiave',
      'en': 'Change key availability',
    },
    'qr5wftf0': {
      'it': 'Modifica media',
      'en': 'Average change',
    },
    '0f29g9se': {
      'it': 'Modifica disponibilità',
      'en': 'Change availability',
    },
    'unz0q4oe': {
      'it': 'Modifica periodo valido',
      'en': 'Modify valid period',
    },
    'pkzf9kqh': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    'q9kr656v': {
      'it': 'Profile',
      'en': 'Profile',
    },
  },
  // edit_garage_vehicle_type
  {
    '6canj4xw': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    'wucnnutj': {
      'it':
          'Seleziona la taglia del veicolo che il tuo posto auto può ospitare',
      'en': 'Select the size of vehicle your parking space can accommodate',
    },
    'gfe6r34q': {
      'it': 'AGGIORNA',
      'en': 'UPDATE',
    },
    'a3sc8c8b': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_validity
  {
    '9wh57ik6': {
      'it':
          'Seleziona il periodo di validità della disponibilità del tuo parcheggio',
      'en': 'Select the period of validity of the availability of your parking',
    },
    '5al7pag5': {
      'it': 'Start Date',
      'en': 'Start Dates',
    },
    'mln59au5': {
      'it': '-',
      'en': '-',
    },
    '1buljtvy': {
      'it': 'End Date',
      'en': 'End Date',
    },
    'f8rekfcy': {
      'it': '-',
      'en': '-',
    },
    '2o5c4o3p': {
      'it':
          'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
      'en':
          'Your availability can be changed at any other time from the main menu',
    },
    'isduofwz': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'ui78e6kv': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_media
  {
    'yyx26sy3': {
      'it': 'FOTO',
      'en': 'PHOTO',
    },
    'uef16a89': {
      'it': 'VIDEO',
      'en': 'VIDEO',
    },
    'rjk5xcsu': {
      'it': 'AGGIORNA',
      'en': 'UPDATE',
    },
    'qtq92hhc': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    'dsmf8ts2': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_availability
  {
    '9r5licys': {
      'it': 'Indica,  per ogni giorno,  la fascia oraria disponibile',
      'en': 'Indicates, for each day, the available time slot',
    },
    'hc8gtgm3': {
      'it': 'M',
      'en': 'm',
    },
    'oo9sm9at': {
      'it': 'T',
      'en': 'T',
    },
    'kyex3psg': {
      'it': 'W',
      'en': 'w',
    },
    'vsh44wxt': {
      'it': 'T',
      'en': 'T',
    },
    'as4mc1o2': {
      'it': 'F',
      'en': 'f',
    },
    '21o4ryg0': {
      'it': 'S',
      'en': 'St',
    },
    'j1bea5r1': {
      'it': 'S',
      'en': 'St',
    },
    'tu8ed9br': {
      'it':
          'La tua disponibiilità è modificabile in qualiasi altro momento dal menù principale',
      'en':
          'Your availability can be changed at any other time from the main menu',
    },
    'yk2g7931': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'a54y8dfz': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_key
  {
    'r1kgni7y': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    '56thneew': {
      'it': 'Inserisci le informazioni\nper l\'accesso al tuo posto auto',
      'en': 'Enter your information\nfor access to your parking space',
    },
    'puj627an': {
      'it': 'Posto auto sempre accessibile',
      'en': 'Parking space always accessible',
    },
    's9vu5rhz': {
      'it': 'Servono chiavi o telecomando per accedere',
      'en': 'You need keys or a remote control to access',
    },
    'nx8ion2e': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_disclaimer
  {
    'fsyln4u1': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    'bb5onpfw': {
      'it':
          'Disclaimer riguardo al fatto che bisogna avere una \ncasssetta per le chiavi in modo da renderle accessibili\nal clinte che accederà sbloccando il lucchetto con \npassword che dovrete successivamente caricare sul\nvostro profilo',
      'en':
          'Disclaimer that you must have one\nkey box to make them accessible\nto the customer who will access by unlocking the padlock with\npassword that you will later have to upload to the\nyour profile',
    },
    'h9qheb8m': {
      'it': 'Confermo di aver preso visione del disclaimer',
      'en': 'I confirm that I have read the disclaimer',
    },
    '93n2xcsa': {
      'it': 'Confermo',
      'en': 'I confirm',
    },
    'te5whdqx': {
      'it': 'Keybox password',
      'en': 'Password Keybox',
    },
    '5aatt3mf': {
      'it': 'Password',
      'en': 'Password',
    },
    '4t24l6oa': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // edit_garage_price
  {
    'ovwimqpl': {
      'it': 'Modifica Garage',
      'en': 'Modify Garage',
    },
    'e08tlus0': {
      'it': 'Inserisci la tua tariffa oraria',
      'en': 'Enter your hourly rate',
    },
    'jcoi5dab': {
      'it': '\$ Price',
      'en': '\$Price',
    },
    'qnnm5hcp': {
      'it':
          'Istruzioni su come inserire una tariffa che abbia senso\n\nIstruzioni su cosa rimane in tasca all\'utente al netto \ndelle fee\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
      'en':
          'Instructions on how to enter a rate that makes sense\n\nInstructions on what remains in the net user\'s pocket\nof fees',
    },
    'am7gq0d2': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'atznq706': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_1Copy
  {
    'qev9wse8': {
      'it': 'Indica quando hai bisogno del parcheggio',
      'en': 'Indicate when you need parking',
    },
    'y8oijhcv': {
      'it': 'Data ',
      'en': 'Date',
    },
    '1e2c3g5l': {
      'it': 'Conferma',
      'en': 'He confirms',
    },
    'tect6yof': {
      'it': '00',
      'en': '00',
    },
    'dods9zmq': {
      'it': '01',
      'en': '01',
    },
    'hkotrce7': {
      'it': '02',
      'en': '02',
    },
    '9d8o0hy9': {
      'it': '03',
      'en': '03',
    },
    '3ra09bmx': {
      'it': '04',
      'en': '04',
    },
    'oa89cbfy': {
      'it': '05',
      'en': '05',
    },
    'irbqoq35': {
      'it': '06',
      'en': '06',
    },
    '6jt7lkwn': {
      'it': '07',
      'en': '07',
    },
    'x4r3tcdg': {
      'it': '08',
      'en': '08',
    },
    'xkswuovf': {
      'it': '09',
      'en': '09',
    },
    'xfmek6oh': {
      'it': '10',
      'en': '10',
    },
    'nzutxlh8': {
      'it': '11',
      'en': '11',
    },
    'l93ps4xa': {
      'it': '12',
      'en': '12',
    },
    '0r72xf15': {
      'it': '13',
      'en': '13',
    },
    'tczyp18z': {
      'it': '14',
      'en': '14',
    },
    '0c6kct9n': {
      'it': '15',
      'en': '15',
    },
    'dyt09eu6': {
      'it': '16',
      'en': '16',
    },
    '3kkl25r1': {
      'it': '17',
      'en': '17',
    },
    '2rrlxlgx': {
      'it': '18',
      'en': '18',
    },
    'sscoswg9': {
      'it': '19',
      'en': '19',
    },
    'r70lacl9': {
      'it': '20',
      'en': '20',
    },
    'b4ac514r': {
      'it': '21',
      'en': '21',
    },
    '5c6gz1if': {
      'it': '22',
      'en': '22',
    },
    'hqalsm8x': {
      'it': '23',
      'en': '23',
    },
    '6ytr6fd3': {
      'it': 'hour',
      'en': 'hour',
    },
    'xhczyhri': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'xf14ddln': {
      'it': '00',
      'en': '00',
    },
    'jkm54u49': {
      'it': '15',
      'en': '15',
    },
    'k7sgeg8l': {
      'it': '30',
      'en': '30',
    },
    '11db0rho': {
      'it': '45',
      'en': '45',
    },
    'ytki0x5a': {
      'it': 'min',
      'en': 'min',
    },
    '7t16ozlw': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'x7spn7w0': {
      'it': 'Seleziona orario \nfine sosta',
      'en': 'Select time\nend of stop',
    },
    'y19r66c8': {
      'it': 'Seleziona orario \ninizio sosta',
      'en': 'Select time\nstop start',
    },
    '1xyosewk': {
      'it': '00',
      'en': '00',
    },
    '22idsmsh': {
      'it': '01',
      'en': '01',
    },
    'xb32kxwx': {
      'it': '02',
      'en': '02',
    },
    'gbbfevdu': {
      'it': '03',
      'en': '03',
    },
    'a9jqzde2': {
      'it': '04',
      'en': '04',
    },
    '75jfhtva': {
      'it': '05',
      'en': '05',
    },
    '18ioae87': {
      'it': '06',
      'en': '06',
    },
    '5y3vcf6h': {
      'it': '07',
      'en': '07',
    },
    'ai2n6i51': {
      'it': '08',
      'en': '08',
    },
    'wlpgsv5w': {
      'it': '09',
      'en': '09',
    },
    's6pdnsm8': {
      'it': '10',
      'en': '10',
    },
    '4ez0ylk2': {
      'it': '11',
      'en': '11',
    },
    '8aug2vhp': {
      'it': '12',
      'en': '12',
    },
    'dggm5xpw': {
      'it': '13',
      'en': '13',
    },
    '3yq1b6im': {
      'it': '14',
      'en': '14',
    },
    'e65bbjr2': {
      'it': '15',
      'en': '15',
    },
    'a1u70vr1': {
      'it': '16',
      'en': '16',
    },
    'zwbbw83f': {
      'it': '17',
      'en': '17',
    },
    '8p0qk2kd': {
      'it': '18',
      'en': '18',
    },
    '5ma0jjiu': {
      'it': '19',
      'en': '19',
    },
    'ffr8lnqr': {
      'it': '20',
      'en': '20',
    },
    'zhrk4hq1': {
      'it': '21',
      'en': '21',
    },
    'fbwhjh66': {
      'it': '22',
      'en': '22',
    },
    'rw9i5r90': {
      'it': '23',
      'en': '23',
    },
    'm64y46w7': {
      'it': 'hour',
      'en': 'hour',
    },
    '60tzl4xa': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'pk58mw1s': {
      'it': '00',
      'en': '00',
    },
    'vq1sjk77': {
      'it': '15',
      'en': '15',
    },
    'c9t66g4x': {
      'it': '30',
      'en': '30',
    },
    'dvjgovs9': {
      'it': '45',
      'en': '45',
    },
    'mqrzxr0a': {
      'it': 'min',
      'en': 'min',
    },
    '3vrtnq00': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'lhjxtso7': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservation_4Copy
  {
    'bvnvse95': {
      'it': 'Immagine posto auto',
      'en': 'Parking space image',
    },
    'mr3kpj18': {
      'it': 'Come accedere al posto auto',
      'en': 'How to access the parking space',
    },
    'cur276f1': {
      'it': 'Procedi con il pagamento',
      'en': 'Proceed with payment',
    },
    '4i92t839': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // garageDetailsForReservation
  {
    'dyuh1elk': {
      'it': 'Modifica',
      'en': 'Edit',
    },
    'flbw0vl4': {
      'it': 'Elimina',
      'en': 'Delete',
    },
    'up1q2qaw': {
      'it': 'Descrizione',
      'en': 'Description',
    },
    'bnmbekio': {
      'it': 'Adatto per',
      'en': 'Suitable for',
    },
    'gugjd4oe': {
      'it': 'Garage availabilities',
      'en': 'Garage availabilities',
    },
    'a3s82wks': {
      'it': 'Monday',
      'en': 'Monday',
    },
    '3m5zeuzv': {
      'it': '-',
      'en': '-',
    },
    '7s7fl7r1': {
      'it': 'Tuesday',
      'en': 'Tuesday',
    },
    'dxjdqjco': {
      'it': '-',
      'en': '-',
    },
    'qqjtrevj': {
      'it': 'Wednesday',
      'en': 'Wednesday',
    },
    'cjfqs198': {
      'it': '-',
      'en': '-',
    },
    'ys36pm6v': {
      'it': 'Thursday',
      'en': 'Thursday',
    },
    '0qjxnsqy': {
      'it': '-',
      'en': '-',
    },
    's1xrrh1l': {
      'it': 'Friday',
      'en': 'Friday',
    },
    'lb1nyuh9': {
      'it': '-',
      'en': '-',
    },
    '0uxoz8z6': {
      'it': 'Saturday',
      'en': 'Saturday',
    },
    'wk27tsxa': {
      'it': '-',
      'en': '-',
    },
    'b5jh4kbr': {
      'it': 'Sunday',
      'en': 'Sunday',
    },
    'm8zxa14l': {
      'it': '-',
      'en': '-',
    },
    '3s2uj8o9': {
      'it': 'Garage accessibility -',
      'en': 'Accessibility Garages -',
    },
    'rr3ujbnk': {
      'it': ' always accessible',
      'en': 'always accessible',
    },
    'fj9on2b0': {
      'it': 'requires key or remote control',
      'en': 'requires key or remote control',
    },
    'ck73nae5': {
      'it': '€ all\'ora',
      'en': '€ per hour',
    },
    '3rhe24y0': {
      'it': '+ tasse',
      'en': '+ taxes',
    },
    'thnj4338': {
      'it': 'Prenota ora',
      'en': 'Book now',
    },
    'p5cqnljq': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // myReservations
  {
    'rhwxgmpr': {
      'it': 'EUR',
      'en': 'EUR',
    },
    'ateazkqo': {
      'it': 'Total',
      'en': 'Total',
    },
    'scw0qct4': {
      'it': 'My Bookings',
      'en': 'My Bookings',
    },
    'vogcoqr6': {
      'it': 'Reservations',
      'en': 'Reservations',
    },
  },
  // reservationDetails
  {
    'chbb0ihy': {
      'it': 'Dettagli della prenotazione',
      'en': 'Booking details',
    },
    'v5d856l6': {
      'it': 'Data',
      'en': 'Date',
    },
    '5hsc9y9v': {
      'it': ' - ',
      'en': '-',
    },
    'hws87e1y': {
      'it': 'Dimensione',
      'en': 'Dimension',
    },
    '7ldogs4t': {
      'it': 'Targa del veicolo',
      'en': 'Vehicle license plate',
    },
    'frydmlmy': {
      'it': 'Ripartizione dei prezzi',
      'en': 'Price Breakdown',
    },
    'qybc95ed': {
      'it': 'Prezzo base all\'ora',
      'en': 'Base price per hour',
    },
    '2s4gcmlj': {
      'it': '€',
      'en': '€',
    },
    '4g1o8ngm': {
      'it': 'Tempo totale',
      'en': 'Total time',
    },
    'vjrojboj': {
      'it': 'Tasse',
      'en': 'Taxes',
    },
    'pra4glu1': {
      'it': 'Totale',
      'en': 'Total',
    },
    'd5btonz2': {
      'it': '€',
      'en': '€',
    },
    '7br0wtd6': {
      'it': 'Informazioni sull\'ospite',
      'en': 'Guest information',
    },
    '1wkewljl': {
      'it': 'Chat',
      'en': 'Chats',
    },
    'xad93rbz': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // reservationDetailsMap
  {
    '59b9wfh2': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // AllChatsPage
  {
    '9ow59cjf': {
      'it': 'All Chats',
      'en': 'All Chats',
    },
    '54jo6p6y': {
      'it': 'Chats',
      'en': 'Chats',
    },
  },
  // myReservationsTabbar
  {
    'n6gql0hc': {
      'it': 'Come noleggiatore',
      'en': 'As a renter',
    },
    'y0alcete': {
      'it': 'EUR',
      'en': 'EUR',
    },
    'p06a3791': {
      'it': 'Total',
      'en': 'Total',
    },
    'j5xd0ucs': {
      'it': 'Come proprietario',
      'en': 'As owner',
    },
    'pttg8uyv': {
      'it': 'EUR',
      'en': 'EUR',
    },
    '4cz2609o': {
      'it': 'Total',
      'en': 'Total',
    },
    'il9t2r3y': {
      'it': 'Tutte le Prenotazioni',
      'en': 'All Reservations',
    },
    'u0sxl95z': {
      'it': 'Reservations',
      'en': 'Reservations',
    },
  },
  // AllChatsPageTabbar
  {
    '39k37dc8': {
      'it': 'Tutte le Chats',
      'en': 'All Chats',
    },
    '33r9r9p5': {
      'it': 'Come noleggiatore',
      'en': 'As a renter',
    },
    '6psl93mg': {
      'it': 'Come proprietario',
      'en': 'As owner',
    },
    'd8yo138t': {
      'it': 'Chats',
      'en': 'Chats',
    },
  },
  // feedbackPage
  {
    '7324rkfk': {
      'it': 'Submit feedback',
      'en': 'Submit feedback',
    },
    'i2k341wj': {
      'it': 'How was your overall experience with PNext?',
      'en': 'How was your overall experience with PNext?',
    },
    '3nekxady': {
      'it': 'Did you find the garage booking process easy and intuitive?',
      'en': 'Did you find the garage booking process easy and intuitive?',
    },
    'i2kkwgwb': {
      'it': 'How would you rate the design of the app?',
      'en': 'How would you rate the design of the app?',
    },
    'nt8ras6s': {
      'it': 'How would you rate the overall responsiveness of the app?',
      'en': 'How would you rate the overall responsiveness of the app?',
    },
    'ggdevzle': {
      'it':
          'Did you encounter any difficulties during the booking process? If yes, please provide details.',
      'en':
          'Did you encounter any difficulties during the booking process? If yes, please provide details.',
    },
    'ywm3lbut': {
      'it': '',
      'en': 'Surname',
    },
    'l8v3y2o8': {
      'it': 'Enter details here...',
      'en': 'Enter details here...',
    },
    's3lpbpc6': {
      'it':
          'Would you recommend our garage booking app to others? If not, please share your reasons.',
      'en':
          'Would you recommend our garage booking app to others? If not, please share your reasons.',
    },
    'qeo81lxd': {
      'it': '',
      'en': 'Surname',
    },
    'l5iwb28l': {
      'it': 'Enter reasons here...',
      'en': 'Enter reasons here...',
    },
    'pc2hqv93': {
      'it':
          'Is there any specific feature or functionality you would like to see added to our app?',
      'en':
          'Is there any specific feature or functionality you would like to see added to our app?',
    },
    'z6xeyu5z': {
      'it': '',
      'en': 'Surname',
    },
    '73xjhztn': {
      'it': 'Enter functionalities here...',
      'en': 'Enter functionalities here...',
    },
    'p0sbawzw': {
      'it': 'Feel free to put any additional comment below',
      'en': 'Feel free to put any additional comments below',
    },
    'hipueyr5': {
      'it': '',
      'en': 'Surname',
    },
    'x4kvskb7': {
      'it': 'Enter comment  here...',
      'en': 'Enter comment here...',
    },
    'pzzvv8jj': {
      'it': 'Submit feedback',
      'en': 'Submit feedback',
    },
    'qp5eaakc': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // paymentConfirmed
  {
    'wnp1ismi': {
      'it': 'Pagamento confermato!',
      'en': 'Payment confirmed!',
    },
    '6shxm9fl': {
      'it':
          'Grazie per aver utilizzato PNext. Questa App è ancora in fase di sviluppo, aiutaci a migliorare lasciando un feedback. \nVai nella sezione Profilo > Invia Feedback ',
      'en':
          'Thank you for using PNext. This App is still under development, please help us improve by leaving feedback.\nGo to the Profile section > Send Feedback',
    },
    'wyjdes3m': {
      'it': 'Avanti',
      'en': 'After you',
    },
    '6z77qdec': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // PagePayWith
  {
    'rcxaa5t8': {
      'it': 'Paga con',
      'en': 'Pay with',
    },
    't41hzgc8': {
      'it': 'Valuta del pagamento:',
      'en': 'Payment currency:',
    },
    'z35ctgzv': {
      'it': 'EUR',
      'en': 'EUR',
    },
    '8e8s7r41': {
      'it': 'Carta di credito o debito',
      'en': 'Credit or debit card',
    },
    'ciuf564f': {
      'it': 'Paypal',
      'en': 'PayPal',
    },
    '2tphxfhq': {
      'it': 'Satispay',
      'en': 'Satispay',
    },
    '1wrfw2jq': {
      'it': 'Apple pay',
      'en': 'Apple pay',
    },
    'sbebu8v6': {
      'it': 'Google pay',
      'en': 'Google pay',
    },
    'p4daryq2': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // CreditCardPayment
  {
    '60iyshnh': {
      'it': 'Si accettano le seguenti carte di credito/debito:',
      'en': 'The following credit/debit cards are accepted:',
    },
    '4gq35497': {
      'it': 'Oppure inserisci manualmente i dati',
      'en': 'Or enter the data manually',
    },
    '62ffjgpc': {
      'it': 'nome e cognome',
      'en': 'name and surname',
    },
    'u1bihzov': {
      'it': '0000  0000  0000  0000',
      'en': '0000 0000 0000 0000',
    },
    'gd6lddyr': {
      'it': 'MM/AA',
      'en': 'MM/YY',
    },
    'y3tkkwwj': {
      'it': 'CVC',
      'en': 'cvc extension',
    },
    '54hhk02t': {
      'it': 'Conferma e paga',
      'en': 'Confirm and pay',
    },
    '6z8hu8ek': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // Paypalpayment
  {
    '6w91q6pp': {
      'it': 'Conferma e paga',
      'en': 'Confirm and pay',
    },
    'kwrkkbrt': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // SatispayPayment
  {
    '0lj8fxti': {
      'it': 'Conferma e paga',
      'en': 'Confirm and pay',
    },
    '9vwitzwo': {
      'it': 'Home',
      'en': 'Home',
    },
  },
  // bottomSheet
  {
    'txj68s11': {
      'it': 'Session Booked!',
      'en': 'Session Booked!',
    },
    '0e1dkrbm': {
      'it': 'You have successfully booked a session on:',
      'en': 'You have successfully booked a session on:',
    },
    'deg60cuc': {
      'it': 'Mon, Dec 11 - 2021',
      'en': 'Mon, Dec 11 - 2021',
    },
  },
  // total
  {
    'mt0oq5hd': {
      'it': 'Order Total',
      'en': 'OrderTotal',
    },
    'v6qew4cn': {
      'it':
          'Your order total is a summary of base price per hour moltiplied by number of hours plus any fees and taxes associated with your purchase.',
      'en':
          'Your order total is a summary of base price per hour multiplied by number of hours plus any fees and taxes associated with your purchase.',
    },
    '9ud60qgy': {
      'it': 'Okay',
      'en': 'Okay',
    },
  },
  // changePhoto
  {
    'c8jracy7': {
      'it': 'Change Profile Photo',
      'en': 'Change Profile Photo',
    },
    'pskd7our': {
      'it': 'Upload Photo',
      'en': 'Upload Photo',
    },
    'etme6a0x': {
      'it': 'Save Photo',
      'en': 'Save Photo',
    },
  },
  // reviewTrip
  {
    'k23g5bf4': {
      'it': 'Rate Your Trip',
      'en': 'Rate Your Trip',
    },
    'mg1qljbg': {
      'it': 'Let us know what you thought of the place below!',
      'en': 'Let us know what you thought of the place below!',
    },
    'pta11vjr': {
      'it': 'How would you rate it?',
      'en': 'How would you rate it?',
    },
    'h5015shg': {
      'it': 'Please leave a description of the place...',
      'en': 'Please leave a description of the place...',
    },
    'tikjz0ly': {
      'it': 'Submit Review',
      'en': 'Submit Review',
    },
  },
  // changeMainPhoto
  {
    'gmqcfhh3': {
      'it': 'Change Main Photo',
      'en': 'Change Main Photo',
    },
    'uhls75ju': {
      'it': 'Upload Photo',
      'en': 'Upload Photo',
    },
    '7fb6wukx': {
      'it': 'Save Photo',
      'en': 'Save Photo',
    },
  },
  // cancelTrip
  {
    '1h3jxqjj': {
      'it': 'Cancel Trip',
      'en': 'Cancel Trip',
    },
    '93b5ynxk': {
      'it':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'en':
          'If you want to cancel your trip please leave a note below to send to the host.',
    },
    '72xp1i2b': {
      'it': 'Your reason for cancelling...',
      'en': 'Your reason for cancelling...',
    },
    '854c2wst': {
      'it': 'Yes, Cancel Trip',
      'en': 'Yes, Cancel Trip',
    },
    'grvhydus': {
      'it': 'Never Mind',
      'en': 'nevermind',
    },
  },
  // cancelTripHOST
  {
    'rpsrzat6': {
      'it': 'Cancel Trip',
      'en': 'Cancel Trip',
    },
    'hbm3i4sr': {
      'it':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'en':
          'If you want to cancel your trip please leave a note below to send to the host.',
    },
    'rfp6wokt': {
      'it': 'Your reason for cancelling...',
      'en': 'Your reason for cancelling...',
    },
    '24ez2xyk': {
      'it': 'Yes, Cancel Trip',
      'en': 'Yes, Cancel Trip',
    },
    '32l96en4': {
      'it': 'Never Mind',
      'en': 'nevermind',
    },
  },
  // emailVerificationComponent
  {
    'va3a8t7u': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // informationBottomSheet
  {
    '10vq816u': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // generalInformationSheet
  {
    '63s2xlol': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // changeDocPhoto
  {
    'mt9kjacl': {
      'it': 'Change Document Photo',
      'en': 'Change Document Photo',
    },
    '4h9d8y49': {
      'it': 'Upload Photo',
      'en': 'Upload Photo',
    },
    'katucc8z': {
      'it': 'Save Photo',
      'en': 'Save Photo',
    },
  },
  // uploadGaragePhoto
  {
    'wqa0fqv2': {
      'it': 'Upload garage photo',
      'en': 'Upload garage photo',
    },
    '7e4w25wq': {
      'it': 'Upload Photo',
      'en': 'Upload Photo',
    },
    'ekaymoln': {
      'it': 'Save Photo',
      'en': 'Save Photo',
    },
  },
  // uploadGarageVideo
  {
    'haxbgjfl': {
      'it': 'Upload garage video',
      'en': 'Upload video garage',
    },
    '5tbr8gan': {
      'it': 'Upload Video',
      'en': 'Video uploads',
    },
    'wu83w1v4': {
      'it': 'Save Video',
      'en': 'Save Videos',
    },
  },
  // BottomSheetGarages
  {
    'abjrpgiy': {
      'it': 'Informazioni sull\'Host',
      'en': 'Host information',
    },
    'zts7ds0n': {
      'it': '€ all\'ora',
      'en': '€ per hour',
    },
    '2gp2r373': {
      'it': '+ tasse',
      'en': '+ taxes',
    },
    'vs2exf2s': {
      'it': 'Vedi il Garage',
      'en': 'See the Garage',
    },
  },
  // availability_bottom_sheet
  {
    'iugcupk5': {
      'it':
          'Seleziona l\'orario di disponibilità del tuo posto auto per il giorno della settimana scelto ',
      'en':
          'Select the availability time of your parking space for the chosen day of the week',
    },
    'xl8u1zg0': {
      'it': 'Fascia Oraria',
      'en': 'Time slot',
    },
    '5blhqpx9': {
      'it': 'Fascia Oraria',
      'en': 'Time slot',
    },
    'j860in6z': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // availability_bottom_sheet_intervals
  {
    'ntj4kl0o': {
      'it':
          'Seleziona l\'orario di disponibilità del tuo posto auto per il giorno della settimana scelto ',
      'en':
          'Select the availability time of your parking space for the chosen day of the week',
    },
    '83h89vye': {
      'it': 'Orario inzio',
      'en': 'Start time',
    },
    '7k3e0i7n': {
      'it': '09',
      'en': '09',
    },
    'co7zimqh': {
      'it': '10',
      'en': '10',
    },
    'ovywf9fd': {
      'it': '11',
      'en': '11',
    },
    '122ctlsh': {
      'it': '12',
      'en': '12',
    },
    '2135gw5b': {
      'it': '13',
      'en': '13',
    },
    'cdgwtmt4': {
      'it': '14',
      'en': '14',
    },
    'il9igods': {
      'it': '15',
      'en': '15',
    },
    'z3jy5f1l': {
      'it': '16',
      'en': '16',
    },
    '7vnf133v': {
      'it': '17',
      'en': '17',
    },
    'o93gnwnk': {
      'it': '18',
      'en': '18',
    },
    'up51o1du': {
      'it': '19',
      'en': '19',
    },
    '67ngmopf': {
      'it': '20',
      'en': '20',
    },
    'r3p0slfl': {
      'it': '21',
      'en': '21',
    },
    '6nvvslno': {
      'it': '22',
      'en': '22',
    },
    'u85z3ox6': {
      'it': '23',
      'en': '23',
    },
    'ankbhquh': {
      'it': '00',
      'en': '00',
    },
    'w2fx89wh': {
      'it': '01',
      'en': '01',
    },
    'xq5ie9ri': {
      'it': '02',
      'en': '02',
    },
    'jblhtb35': {
      'it': '03',
      'en': '03',
    },
    'omoo87a8': {
      'it': '04',
      'en': '04',
    },
    '8py2xb11': {
      'it': '05',
      'en': '05',
    },
    's5xiqm8m': {
      'it': '06',
      'en': '06',
    },
    'fxmv8tpc': {
      'it': '07',
      'en': '07',
    },
    'ags1zzrp': {
      'it': '08',
      'en': '08',
    },
    'z43n4eby': {
      'it': 'Hours',
      'en': 'Hours',
    },
    '0mnw9rvq': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '49kdbv7m': {
      'it': '00',
      'en': '00',
    },
    'gyibbp0n': {
      'it': '15',
      'en': '15',
    },
    'kfhcmqfg': {
      'it': '30',
      'en': '30',
    },
    '15550cma': {
      'it': '45',
      'en': '45',
    },
    '568t8i4d': {
      'it': 'Minutes',
      'en': 'Minutes',
    },
    'd804j9iy': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'pnj9fa18': {
      'it': 'Orario fine',
      'en': 'End time',
    },
    'ytg5c7rc': {
      'it': '09',
      'en': '09',
    },
    '1liupofg': {
      'it': '10',
      'en': '10',
    },
    '0a26dnr4': {
      'it': '11',
      'en': '11',
    },
    'fot7zwme': {
      'it': '12',
      'en': '12',
    },
    'yf5p1qd0': {
      'it': '13',
      'en': '13',
    },
    'ciwdlgc5': {
      'it': '14',
      'en': '14',
    },
    '077hz8kx': {
      'it': '15',
      'en': '15',
    },
    's1jzaop5': {
      'it': '16',
      'en': '16',
    },
    '3lypwcdf': {
      'it': '17',
      'en': '17',
    },
    '09oxl55y': {
      'it': '18',
      'en': '18',
    },
    '4364mhtz': {
      'it': '19',
      'en': '19',
    },
    '2e5hk8rg': {
      'it': '20',
      'en': '20',
    },
    'qp3czqrs': {
      'it': '21',
      'en': '21',
    },
    '9e4c8baf': {
      'it': '22',
      'en': '22',
    },
    '31oxl0e6': {
      'it': '23',
      'en': '23',
    },
    'p00gaeob': {
      'it': '00',
      'en': '00',
    },
    'cvw51krc': {
      'it': '01',
      'en': '01',
    },
    '3zz2cl1s': {
      'it': '02',
      'en': '02',
    },
    '2tn1xb3g': {
      'it': '03',
      'en': '03',
    },
    '5jaeo0um': {
      'it': '04',
      'en': '04',
    },
    'hsw23c8k': {
      'it': '05',
      'en': '05',
    },
    'zvlx04r9': {
      'it': '06',
      'en': '06',
    },
    'pipriy7a': {
      'it': '07',
      'en': '07',
    },
    '564ntfz6': {
      'it': '08',
      'en': '08',
    },
    'teug2wpl': {
      'it': 'Hours',
      'en': 'Hours',
    },
    'k978jigv': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '6g6cjho9': {
      'it': '00',
      'en': '00',
    },
    '2021gbv0': {
      'it': '15',
      'en': '15',
    },
    'jca28u8m': {
      'it': '30',
      'en': '30',
    },
    'kynqqpxe': {
      'it': '45',
      'en': '45',
    },
    'xlprr8nl': {
      'it': 'Minutes',
      'en': 'Minutes',
    },
    '2cqer774': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'z7otnv7d': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // availability_bottom_tryiouts
  {
    'z4wpkfdf': {
      'it': 'Credit card',
      'en': 'credit card',
    },
    '8osbwkxn': {
      'it': 'Credit card',
      'en': 'credit card',
    },
    '5w2ri3zo': {
      'it': 'Debit card',
      'en': 'debit card',
    },
    'yovxrsuo': {
      'it': 'PayPal',
      'en': 'PayPal',
    },
    'dqkj2puj': {
      'it': 'Please selectaa...',
      'en': 'Please selectaa...',
    },
    '7usthmtg': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
  },
  // availability_bottom_sheet_intervals_edit
  {
    'f6tdlrqn': {
      'it':
          'Seleziona l\'orario di disponibilità del tuo posto auto per il giorno della settimana scelto ',
      'en':
          'Select the availability time of your parking space for the chosen day of the week',
    },
    'pnbek13x': {
      'it': 'Orario inizio',
      'en': 'Start time',
    },
    'byih226c': {
      'it': '09',
      'en': '09',
    },
    'sbsy7o19': {
      'it': '10',
      'en': '10',
    },
    'c3o9d2z0': {
      'it': '11',
      'en': '11',
    },
    'gz865g22': {
      'it': '12',
      'en': '12',
    },
    'z4h1n6k9': {
      'it': '13',
      'en': '13',
    },
    'nayei21p': {
      'it': '14',
      'en': '14',
    },
    'p0bc7ujh': {
      'it': '15',
      'en': '15',
    },
    'lmg01fho': {
      'it': '16',
      'en': '16',
    },
    'uqorl5vz': {
      'it': '17',
      'en': '17',
    },
    'cghkmhhb': {
      'it': '18',
      'en': '18',
    },
    't86jr65a': {
      'it': '19',
      'en': '19',
    },
    '6vz75axt': {
      'it': '20',
      'en': '20',
    },
    'zjfwjgxm': {
      'it': '21',
      'en': '21',
    },
    'x314ooh2': {
      'it': '22',
      'en': '22',
    },
    '0udnsg7k': {
      'it': '23',
      'en': '23',
    },
    'c68ojfqw': {
      'it': '00',
      'en': '00',
    },
    '7b9y8i5c': {
      'it': '01',
      'en': '01',
    },
    'fm2y8zjn': {
      'it': '02',
      'en': '02',
    },
    'a3t1dc61': {
      'it': '03',
      'en': '03',
    },
    'g8z8jzd2': {
      'it': '04',
      'en': '04',
    },
    'me6v2n6r': {
      'it': '05',
      'en': '05',
    },
    '079we4xq': {
      'it': '06',
      'en': '06',
    },
    'zsi4hx1l': {
      'it': '07',
      'en': '07',
    },
    '0bldtznf': {
      'it': '08',
      'en': '08',
    },
    'pwz4k96g': {
      'it': 'Hours',
      'en': 'Hours',
    },
    '00ufaw8r': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'kcyzjnwb': {
      'it': '00',
      'en': '00',
    },
    '5fxw8o49': {
      'it': '15',
      'en': '15',
    },
    'os7dz59j': {
      'it': '30',
      'en': '30',
    },
    'ls7kaif5': {
      'it': '45',
      'en': '45',
    },
    'zdo0y14y': {
      'it': 'Minutes',
      'en': 'Minutes',
    },
    'wenjys2v': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'n1u9fia7': {
      'it': 'Orario fine',
      'en': 'End time',
    },
    '3sntaeeo': {
      'it': '09',
      'en': '09',
    },
    'a8yvszw6': {
      'it': '10',
      'en': '10',
    },
    '8isvlzku': {
      'it': '11',
      'en': '11',
    },
    'xkvrbfu1': {
      'it': '12',
      'en': '12',
    },
    'pj27d74x': {
      'it': '13',
      'en': '13',
    },
    '85iqsqip': {
      'it': '14',
      'en': '14',
    },
    '9yazogcl': {
      'it': '15',
      'en': '15',
    },
    '0m6jd7lm': {
      'it': '16',
      'en': '16',
    },
    'hfizchij': {
      'it': '17',
      'en': '17',
    },
    'd5lbogbb': {
      'it': '18',
      'en': '18',
    },
    'jqi0ijn2': {
      'it': '19',
      'en': '19',
    },
    '5rnl98xw': {
      'it': '20',
      'en': '20',
    },
    'kcvz2dwr': {
      'it': '21',
      'en': '21',
    },
    'hweea7lg': {
      'it': '22',
      'en': '22',
    },
    'umm0ti3h': {
      'it': '23',
      'en': '23',
    },
    'sd772s7q': {
      'it': '00',
      'en': '00',
    },
    'fxy29vxt': {
      'it': '01',
      'en': '01',
    },
    'l2l14zjd': {
      'it': '02',
      'en': '02',
    },
    'a4xzwpui': {
      'it': '03',
      'en': '03',
    },
    'y91mk122': {
      'it': '04',
      'en': '04',
    },
    '782g5ted': {
      'it': '05',
      'en': '05',
    },
    'kmqiz7iz': {
      'it': '06',
      'en': '06',
    },
    'yzwvvedh': {
      'it': '07',
      'en': '07',
    },
    '4sd8fe7p': {
      'it': '08',
      'en': '08',
    },
    'd9pfk0kk': {
      'it': 'Hours',
      'en': 'Hours',
    },
    'c1a6xezt': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'tf0ixpgp': {
      'it': '00',
      'en': '00',
    },
    'gjuuyfzt': {
      'it': '15',
      'en': '15',
    },
    '9n8ugv6t': {
      'it': '30',
      'en': '30',
    },
    '0m7gpqgj': {
      'it': '45',
      'en': '45',
    },
    '7qlgmv31': {
      'it': 'Minutes',
      'en': 'Minutes',
    },
    'ldnnswcg': {
      'it': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '31g0kbqh': {
      'it': 'OK',
      'en': 'Okay',
    },
  },
  // BottomSheetGaragesJustView
  {
    'p4hlf9a7': {
      'it': 'Informazioni sull\'Host',
      'en': 'Host information',
    },
    '75y128wm': {
      'it': '€ all\'ora',
      'en': '€ per hour',
    },
    'oqe21lgh': {
      'it': '+ tasse',
      'en': '+ taxes',
    },
    'ltb18zja': {
      'it': 'Vedi il Garage',
      'en': 'See the Garage',
    },
  },
  // bottomSheetApplePay
  {
    '94a0ms9u': {
      'it': 'Pay',
      'en': 'Pay',
    },
    'ivt4f82x': {
      'it': 'Cancel',
      'en': 'Cancel',
    },
    'kln5nl2t': {
      'it': 'CARD',
      'en': 'CARD',
    },
    'wuu0l0wn': {
      'it': '0000  0000  0000  0000',
      'en': '0000 0000 0000 0000',
    },
    'jcyb5c5w': {
      'it': 'SUBTOTAL',
      'en': 'SUBTOTAL',
    },
    'z1yfq3g4': {
      'it': 'TAX',
      'en': 'TAX',
    },
    'hf7tezsj': {
      'it': 'TOTAL ',
      'en': 'TOTAL',
    },
    'r2euv0ug': {
      'it': 'Pay',
      'en': 'Pay',
    },
  },
  // bottomSheetGooglePay
  {
    'elwypd2d': {
      'it': 'Pay',
      'en': 'Pay',
    },
    'rrt538ux': {
      'it': 'Email',
      'en': 'E-mail',
    },
    'rg8jzffx': {
      'it': '0000  0000  0000  0000',
      'en': '0000 0000 0000 0000',
    },
    'aa7g5hqi': {
      'it': 'Continue',
      'en': 'Continue',
    },
  },
  // Miscellaneous
  {
    'nkjwroiu': {
      'it': '',
      'en': '',
    },
    'qld477jm': {
      'it': '',
      'en': '',
    },
    'r40dixio': {
      'it': '',
      'en': '',
    },
    '9i2wv7fx': {
      'it': '',
      'en': '',
    },
    'kbjo1zcf': {
      'it': '',
      'en': '',
    },
    '5quydqas': {
      'it': '',
      'en': '',
    },
    'uoa5da4w': {
      'it': '',
      'en': '',
    },
    'hsqxjy1n': {
      'it': '',
      'en': '',
    },
    '5ohei2uz': {
      'it': '',
      'en': '',
    },
    'bcx2edep': {
      'it': '',
      'en': '',
    },
    'x6znwydn': {
      'it': '',
      'en': '',
    },
    '4l3adcq7': {
      'it': '',
      'en': '',
    },
    'vmjal4cf': {
      'it': '',
      'en': '',
    },
    'cmaykygm': {
      'it': '',
      'en': '',
    },
    'g63b4xjc': {
      'it': '',
      'en': '',
    },
    'bxd78hl3': {
      'it': '',
      'en': '',
    },
    'o2zor2tm': {
      'it': '',
      'en': '',
    },
    'h4152q4b': {
      'it': '',
      'en': '',
    },
    'aeoo5898': {
      'it': '',
      'en': '',
    },
    'wdg05mdp': {
      'it': '',
      'en': '',
    },
    '59m1bkiz': {
      'it': '',
      'en': '',
    },
    'g1f4fxka': {
      'it': '',
      'en': '',
    },
    '9rtcg1cc': {
      'it': '',
      'en': '',
    },
    'pqn4pjih': {
      'it': '',
      'en': '',
    },
    'lf1sirgf': {
      'it': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
