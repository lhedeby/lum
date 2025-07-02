# Lum

Lum is a class based programming language with dynamic typing. The language is self-hosted, meaning the compiler can compile itself.
So there is only a small amount of rust code left for the runtime (vm) that takes the lum code and runs it.

The code - both rust and lum - are far from perfect. This is mainly an excercise in self-hosting. Writing a programing language and
then write the compiler for the language itself was something that I had a hard time wrapping my head around. It still confuses me from
time to time.

## Installation and usage

## Lum examples
```
#print("hash tags are used to call built-in functions")
    
class Foo {
    print_param(p) {
        #print("This is the param", p)
    }
    bar {
        #print("If a method has no arguments, the () can be left out")
    }
}

def foo = Foo()

foo.print_param()
foo.bar()

class Data(list, category) { 
    print_data {
        #print("@ can be used to access data on the instance")
        #print("list:", @list)
        #print("category:", @category)
    }
}

def dogs = Data(["Husky", "Labrador", "German shepherd"], "dogs")

dogs.print_data()

```


## Bytecode

At this moment the "bytecode" is stored in plain text, this should be changed in the future
