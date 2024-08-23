.PHONY: gen apk web win ncommit pull ico get starter build

gen:
	flutter pub run build_runner build --delete-conflicting-outputs

apk:
	flutter build apk 

web:
	flutter run -d web 

win:
	flutter run -d windows

ncommit:
	git add .
	git commit -m "wip"
	git push origin main 

pull:
	git add .
	git commit -m "ncommit"
	git pull origin main

ico:
	flutter pub get
	flutter pub run flutter_launcher_icons

get:
	flutter pub get

starter:
	flutter pub add iconsax
	flutter pub add iconsax_flutter
	flutter pub add freezed_annotation
	flutter pub add dev:build_runner
	flutter pub add dev:freezed
	flutter pub add json_annotation
	flutter pub add dev:json_serializable
	flutter pub add dev:flutter_launcher_icons
	flutter pub add isar isar_flutter_libs path_provider
	flutter pub add -d isar_generator build_runner

build:
	flutter build windows

caches:
	flutter pub run build_runner build -d --build-filter=lib/cache/**