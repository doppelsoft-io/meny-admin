fresh: ## Runs `clean`, `codegen-build`
	make clean build

clean: ## Cleans Flutter project.
	rm -f pubspec.lock
	flutter clean
	cd ios
	rm -rf Pods Podfile.lock
	cd ..
	flutter pub get

build: ## Generate codegen files once.
	flutter pub run build_runner build --delete-conflicting-outputs

watch: ## Generate codegen files and watch for changes.
	flutter pub run build_runner watch --delete-conflicting-outputs

lint: ## Runs `flutter analyze`.
	flutter analyze
