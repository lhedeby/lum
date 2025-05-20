use luma::run_code;

fn test_code(code: &str, expected: &str) {
    let mut buf = Vec::new();
    run_code(code, &mut buf);
    let output = String::from_utf8(buf).unwrap();
    assert_eq!(output, expected);
}

#[test]
fn hello_world() {
    let code = r#"
        PRINT("Hello, world!")
    "#;
    let expected = "Hello, world!\n";
    test_code(code, expected);
}

#[test]
fn r#while() {
    let code = r#"
        def i = 0
        while i < 10 {
            i = i + 1
        }
        PRINT(TO_STRING(i))
    "#;
    let expected = "10\n";
    test_code(code, expected);
}

#[test]
fn classes() {
    let code = r#"
        class foo(int i, int j) {
            bar(int a) {
                PRINT("BAR")
                PRINT(TO_STRING(@i))
                @i = 9
            }
        }

        def f = foo(1, 5)
        f.i = 2
        PRINT(TO_STRING(f.i))
        f.i = 3

        f.bar(4)

        PRINT(TO_STRING(f.i))
    "#;
    let expected = "2\nBAR\n3\n9\n";
    test_code(code, expected);
}

#[test]
fn list() {
    let code = r#"
        def a = [1+5,2,3]<int>
        PRINT(TO_STRING(a))
    "#;
    let expected = "[6, 2, 3]\n";
    test_code(code, expected);
}

#[test]
fn nested_instances() {
    let code = r#"
        class foo(int i, int j) {}
        class bar(foo f) {}

        def f = foo(1, 2)
        def b = bar(f)

        PRINT(TO_STRING(b.f.i))
        b.f.i = 8
        PRINT(TO_STRING(b.f.i))
    "#;
    let expected = "1\n8\n";
    test_code(code, expected);
}

#[test]
fn r#if() {
    let code = r#"
        if true {
            PRINT("Its true")
        }

        if false {
            PRINT("Its not true")
        }
    "#;
    let expected = "Its true\n";
    test_code(code, expected);
}

#[test]
fn negation() {
    let code = r#"
        if !true {
            PRINT("Its true")
        }

        if !false {
            PRINT("Its not true")
        }
    "#;
    let expected = "Its not true\n";
    test_code(code, expected);
}

#[test]
fn equality() {
    let code = r#"
        PRINT(TO_STRING(1 == 1))
        PRINT(TO_STRING(1 == 2))

        PRINT(TO_STRING(1 != 1))
        PRINT(TO_STRING(1 != 2))
    "#;
    let expected = "true\nfalse\nfalse\ntrue\n";
    test_code(code, expected);
}

#[test]
fn and_or() {
    let code = r#"
        PRINT(TO_STRING(true and true))
        PRINT(TO_STRING(true and false))
        PRINT(TO_STRING(false and false))

        PRINT(TO_STRING(true or false))
        PRINT(TO_STRING(true or false))
        PRINT(TO_STRING(false or false))
    "#;
    let expected = "true\nfalse\nfalse\ntrue\ntrue\nfalse\n";
    test_code(code, expected);
}

#[test]
fn comparison() {
    let code = r#"
        PRINT(TO_STRING(1 > 2))
        PRINT(TO_STRING(1 < 2))
        PRINT(TO_STRING(1 <= 2))
        PRINT(TO_STRING(1 >= 2))
        PRINT(TO_STRING(1 >= 1))
        PRINT(TO_STRING(1 <= 1))
    "#;
    let expected = "false\ntrue\ntrue\nfalse\ntrue\ntrue\n";
    test_code(code, expected);
}



#[test]
fn class_return() {
    let code = r#"
        class foo(int i, int j) {
            bar() int {
                def k = @i + @j
                def b = 2
                return b
            }
        }

        def f = foo(2, 5)

        def c = f.bar()

        PRINT(TO_STRING(c))
    "#;
    let expected = "2\n";
    test_code(code, expected);
}

#[test]
fn index() {
    let code = r#"
        def hello = [1,2,3]<int>
        hello[0] = 55
        hello[2] = 22
        PRINT(TO_STRING(hello))
    "#;
    let expected = "[55, 2, 22]\n";
    test_code(code, expected);
}

#[test]
fn fib() {
    let code = r#"
        class fib(int curr, int prev) {
            next() int {
                def res = @prev + @curr
                @prev = @curr
                @curr = res
                return @curr
            }
        }

        def f = fib(0, 1)

        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
        PRINT(TO_STRING(f.next()))
    "#;
    let expected = "1\n1\n2\n3\n5\n8\n13\n21\n34\n55\n89\n";
    test_code(code, expected);
}
