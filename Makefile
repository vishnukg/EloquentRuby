.PHONY: help test install update format

help:
	@echo "Available targets:"
	@echo "  install  - Install dependencies"
	@echo "  update   - Update dependencies"
	@echo "  test     - Run tests"
	@echo "  format   - Format code using StandardRB"

install:
	bundle exec rake install

update:
	bundle exec rake update

format:
	bundle exec rake format

test:
	bundle exec rake test
