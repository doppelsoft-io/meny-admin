fresh: ## Runs `clean`, `codegen-build`
	make clean codegen-build

clean: ## Cleans Flutter project.
	rm -f pubspec.lock
	flutter clean
	flutter pub get
	(cd ios/; rm -rf Pods Podfile.lock; flutter precache --ios; pod install)

codegen-build: ## Generate codegen files once.
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	(cd doppelsoft-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)
	(cd doppelsoft-ui/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)
	(cd meny-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-watch: ## Generate codegen files and watch for changes.
	flutter pub get
	flutter pub run build_runner watch --delete-conflicting-outputs

lint: ## Runs `flutter analyze`.
	flutter analyze
