all: build

.PHONY: build
build:
	mkdir -p bin
	for file in bashpp bashpc bashp; do \
	./bashpc $$file >bin/$$file && \
	chmod +x bin/$$file; \
done

.PHONY: clean
clean:
	rm -rf bin
