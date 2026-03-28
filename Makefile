.PHONY: help test install update format

help:
	@echo "Available targets:"
	@echo "  install  - Install dependencies"
	@echo "  update   - Update dependencies"
	@echo "  test     - Run tests"
	@echo "  format   - Format code using StandardRB"

install:
	bundle install

update:
	bundle update --all

format:
	bundle exec standardrb --fix

test:
	bundle exec ruby -Itest -r coverage_helper test/maitre_d_test.rb
