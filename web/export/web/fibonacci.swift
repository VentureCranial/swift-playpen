#! /usr/bin/env swift

/* Basic fibonacci function in swift.
   Demostrates func calls and recursion.
*/

func fibonacci(i: Int) -> Int {
    if i <= 2 {
        return 1
    } else {
        return fibonacci(i - 1) + fibonacci(i - 2)
    }
}

print("Content-type: text/html\r\n\r\n<b>Fibonacci: </b>")
print(fibonacci(22))
