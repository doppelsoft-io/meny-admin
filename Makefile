fresh: ## Runs `clean`, `codegen-build`
	make clean codegen-parallel

clean: ## Cleans Flutter project.
	rm -f pubspec.lock
	flutter clean
	flutter pub get
	(cd ios/; rm -rf Pods Podfile.lock; flutter precache --ios; pod install --repo-update)

codegen-build: ## Generate codegen files once.
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	(cd doppelsoft-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)
	(cd doppelsoft-ui/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)
	(cd meny-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-parallel:
	@$(MAKE) codegen-app -j$(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null)

codegen-app: codegen-doppelsoft-core \
	codegen-doppelsoft-ui \
	codegen-meny-core \
	codegen-root

codegen-root:
	(flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-doppelsoft-core:
	(cd doppelsoft-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-doppelsoft-ui:
	(cd doppelsoft-ui/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-meny-core:
	(cd meny-core/; flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs)

codegen-watch: ## Generate codegen files and watch for changes.
	flutter pub get
	flutter pub run build_runner watch --delete-conflicting-outputs

lint: ## Runs `flutter analyze`.
	flutter analyze
