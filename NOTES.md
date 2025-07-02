# Lum

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
➜  /usr/bin/time -v target/release/lum lum/main.lum
