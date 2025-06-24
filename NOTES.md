# Luma

## Types
- int
- str
- float
- arr
- bool



## classes and methods without params dont need paren

```
class Foo {
    bar {
    }
}

class Foo() {
    bar() {
    }
}
```

## to test memory alloc
➜  /usr/bin/time -v target/release/luma lum/main.lum
