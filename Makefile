all: clean build install

clean:
	rm -f ./*.gem

build:
	gem build sibilant-rails.gemspec

install: 
	gem install `ls *.gem`

publish: clean build
	gem push `ls *.gem`
