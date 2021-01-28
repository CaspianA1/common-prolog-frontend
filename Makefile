CC = gcc
CFLAGS = -o $(OUT) -ll y.tab.c lex.yy.c
TEST_COUNT = 7
OUT = front_end

all: tokenizer parser bin test

test:
	for i in {1..$(TEST_COUNT)};\
		do echo "Test #$$i running";\
		./dist/$(OUT) tests/test_$$i.pl;\
	done

bin:
	cd dist; $(CC) $(CFLAGS)

tokenizer:
	flex tokenize.l
	mv lex.yy.c dist

parser:
	yacc -d -v parse.y
	mv y.tab.* y.output dist

debug: tokenizer parser
	cd dist; $(CC) -g3 $(CFLAGS); lldb $(OUT) ../tests/$(TEST).pl

clean:
	rm -r dist/*