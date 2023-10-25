/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 26 (13 per locale)
///
/// Built on 2023-10-25 at 09:36 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.it;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.it) // set locale
/// - Locale locale = AppLocale.it.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.it) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsIt> {
	it(languageCode: 'it', build: _TranslationsIt.build),
	en(languageCode: 'en', build: _TranslationsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _TranslationsIt> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsIt get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translation).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = translation.someKey.anotherKey;
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
_TranslationsIt get translation => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final translation = Translations.of(context); // Get translation variable.
/// String a = translation.someKey.anotherKey; // Use translation variable.
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsIt of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsIt>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsIt> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _TranslationsIt> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsIt>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.translation.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsIt get translation => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsIt> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsIt> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsIt implements BaseTranslations<AppLocale, _TranslationsIt> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsIt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, _TranslationsIt> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _TranslationsIt _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsNotFoundPageIt notFoundPage = _TranslationsNotFoundPageIt._(_root);
	late final _TranslationsHomePageIt homePage = _TranslationsHomePageIt._(_root);
	late final _TranslationsResultsPageIt resultsPage = _TranslationsResultsPageIt._(_root);
	late final _TranslationsFormsIt forms = _TranslationsFormsIt._(_root);
}

// Path: notFoundPage
class _TranslationsNotFoundPageIt {
	_TranslationsNotFoundPageIt._(this._root);

	final _TranslationsIt _root; // ignore: unused_field

	// Translations
	String get somethingWentWrong => 'Qualcosa è andato storto...';
	String get retry => 'Riprova';
}

// Path: homePage
class _TranslationsHomePageIt {
	_TranslationsHomePageIt._(this._root);

	final _TranslationsIt _root; // ignore: unused_field

	// Translations
	String get title => 'Benvenuto!\nScegli una razza tra quelle elencate';
	String get hintBreed => 'Scegli una razza';
	String get hintSubBreed => 'Scegli una sotto-razza';
	String get getRandomImage => 'Ottieni un\'immagine randomica';
	String get getAllImages => 'Ottieni tutte le immagini';
	String get breed => 'Razza';
	String get subBreed => 'Sotto-razza';
	String get all => 'Tutte';
}

// Path: resultsPage
class _TranslationsResultsPageIt {
	_TranslationsResultsPageIt._(this._root);

	final _TranslationsIt _root; // ignore: unused_field

	// Translations
	String get noResults => 'Non ci sono risultati';
}

// Path: forms
class _TranslationsFormsIt {
	_TranslationsFormsIt._(this._root);

	final _TranslationsIt _root; // ignore: unused_field

	// Translations
	String get selectValue => 'Seleziona un opzione';
	String get search => 'Cerca...';
}

// Path: <root>
class _TranslationsEn extends _TranslationsIt {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _TranslationsIt> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsNotFoundPageEn notFoundPage = _TranslationsNotFoundPageEn._(_root);
	@override late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
	@override late final _TranslationsResultsPageEn resultsPage = _TranslationsResultsPageEn._(_root);
	@override late final _TranslationsFormsEn forms = _TranslationsFormsEn._(_root);
}

// Path: notFoundPage
class _TranslationsNotFoundPageEn extends _TranslationsNotFoundPageIt {
	_TranslationsNotFoundPageEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get somethingWentWrong => 'Something went wrong...';
	@override String get retry => 'Retry';
}

// Path: homePage
class _TranslationsHomePageEn extends _TranslationsHomePageIt {
	_TranslationsHomePageEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welcome!\nChoose a breed from those listed';
	@override String get hintBreed => 'Choose a breed';
	@override String get hintSubBreed => 'Choose a sub-breed';
	@override String get getRandomImage => 'Get a random picture';
	@override String get getAllImages => 'Get all the pictures';
	@override String get breed => 'Breed';
	@override String get subBreed => 'Sub-breed';
	@override String get all => 'All of them';
}

// Path: resultsPage
class _TranslationsResultsPageEn extends _TranslationsResultsPageIt {
	_TranslationsResultsPageEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get noResults => 'No results available';
}

// Path: forms
class _TranslationsFormsEn extends _TranslationsFormsIt {
	_TranslationsFormsEn._(_TranslationsEn root) : this._root = root, super._(root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get selectValue => 'Select an option';
	@override String get search => 'Search...';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsIt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'notFoundPage.somethingWentWrong': return 'Qualcosa è andato storto...';
			case 'notFoundPage.retry': return 'Riprova';
			case 'homePage.title': return 'Benvenuto!\nScegli una razza tra quelle elencate';
			case 'homePage.hintBreed': return 'Scegli una razza';
			case 'homePage.hintSubBreed': return 'Scegli una sotto-razza';
			case 'homePage.getRandomImage': return 'Ottieni un\'immagine randomica';
			case 'homePage.getAllImages': return 'Ottieni tutte le immagini';
			case 'homePage.breed': return 'Razza';
			case 'homePage.subBreed': return 'Sotto-razza';
			case 'homePage.all': return 'Tutte';
			case 'resultsPage.noResults': return 'Non ci sono risultati';
			case 'forms.selectValue': return 'Seleziona un opzione';
			case 'forms.search': return 'Cerca...';
			default: return null;
		}
	}
}

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'notFoundPage.somethingWentWrong': return 'Something went wrong...';
			case 'notFoundPage.retry': return 'Retry';
			case 'homePage.title': return 'Welcome!\nChoose a breed from those listed';
			case 'homePage.hintBreed': return 'Choose a breed';
			case 'homePage.hintSubBreed': return 'Choose a sub-breed';
			case 'homePage.getRandomImage': return 'Get a random picture';
			case 'homePage.getAllImages': return 'Get all the pictures';
			case 'homePage.breed': return 'Breed';
			case 'homePage.subBreed': return 'Sub-breed';
			case 'homePage.all': return 'All of them';
			case 'resultsPage.noResults': return 'No results available';
			case 'forms.selectValue': return 'Select an option';
			case 'forms.search': return 'Search...';
			default: return null;
		}
	}
}
