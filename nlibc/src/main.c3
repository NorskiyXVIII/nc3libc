module nlibc;
import std::io;
import nlibc::stdlib;


def bsearch_int = nlibc::stdlib::bsearch(<int>);

fn bool is_eq(int* x, int* y) {
	return *x == *y;
}

fn int main(String[] args) {
	int[*] x = {10, 20, 30};
	io::printn(x.bsearch(20, &is_eq));
	return 0;
}
