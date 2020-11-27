#include <cstdio>

void skip_lines(int n) {
	while (n) {
		int c = getchar();
		if (c == '\n') n--;
	}
}

void mark(char *s) {
	while (*(s++)) {
		if (*s == '_') {
			*s = '\0';
			return;
		}
	}
}

int main(int argc, char **argv) {
	// skip 44 lines
	skip_lines(44);

	int access, hit;
	scanf("%*s%*s%*s%d%*s%d", &access, &hit);
	mark(argv[1]);
	printf("%-15s%7d %7d  %5.2lf%%\n", argv[1], access, hit, (double)hit / access * 100);

	return 0;
}
