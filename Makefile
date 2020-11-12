all:
	bison -d calc1.y
	flex calc1.l
	gcc lex.yy.c calc1.tab.c -lfl

clean:
	rm lex.yy.c a.out calc1.tab.c calc1.tab.h
