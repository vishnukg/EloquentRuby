.PHONY: test install update

install:
	bundle install

update:
	bundle update

test:
	bundle exec ruby -Itest -r coverage_helper test/maitre_d_test.rb
