# Makefile dla DevNote

.PHONY: generate-locales clean

# Generowanie typowanych kluczy tłumaczeń
generate-locales:
	dart run easy_localization:generate -S assets/translations -f keys -o lib/generated/locale_keys.g.dart

# Generowanie wszystkich plików
generate:
	flutter packages pub run build_runner build --delete-conflicting-outputs
	$(MAKE) generate-locales

# Czyszczenie wygenerowanych plików
clean:
	flutter packages pub run build_runner clean
	rm -f lib/generated/locale_keys.g.dart

# Uruchomienie aplikacji
run:
	flutter run

# Testy
test:
	flutter test
