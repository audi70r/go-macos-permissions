.PHONY: build test example clean

build:
	go build ./...

test:
	go test ./...

example:
	cd example && go run main.go

clean:
	go clean
	rm -f example/example