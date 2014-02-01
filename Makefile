
all: tofu.ttf tofu.ttf.base64

%.ttf: %.ttx
	ttx -o $@ $^

%.base64: %
	{ \
		echo -n "data:application/x-font-ttf;base64,"; \
		uuencode -m $^ < $^ | head -n -1 | tail -n +2 | tr -d '\n'; \
	} > $@

#clean:
#	rm -f tofu.ttf tofu.ttf.base64
