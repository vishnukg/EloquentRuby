.PHONY: test install update

install:
	bundle install

update:
	bundle update

test:
	bundle exec ruby test/test_maitre_d.rb
