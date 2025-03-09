module nlibc::stdlib(<Type>);

struct Div_t {
    int quot, rem;
}

struct Ldiv_t {
    long quot, rem;
}

def Size_t = usz;
const NULL = 0;


def CompFn = fn bool(Type*, Type*);
fn ulong bsearch(Type[] arr, Type target, CompFn comparator) {
    Size_t low = 0;
    Size_t max = arr.len - 1;
    Size_t mid;
    Type elem;

    while (low <= max) {
        mid = (low + max) / 2;
        elem = arr[mid];

        if (comparator(&elem, &target)) { return (ulong)mid; }
        else if (elem > target)       { max = mid - 1; }
        else if (elem < target)       { low = mid + 1; }
    }

    return -1;
}

macro ulong Type[*].bsearch(Type[*] self, Type target, CompFn comparator) => bsearch(&self, target, comparator);