all: clean build install

clean:
	rm -f ./*.gem

build:
	gem build sibilant-rails.gemspec

install: 
	gem install ./sibilant-rails-0.0.1.gem
