PROGS:=$(patsubst %.go,%,$(wildcard *.go))

.PHONY: all
all: $(PROGS)
	@:

% : %.go
	go fmt $<
	goimports -l -w $<
	go vet $<
	go build -o $@ $<

.PHONY: clean
clean:
	@rm -vf *~ $(PROGS)
