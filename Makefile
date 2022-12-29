.PHONY: test
build_test_mock:
	flutter pub run build_runner build --delete-conflicting-outputs
test:
	flutter test