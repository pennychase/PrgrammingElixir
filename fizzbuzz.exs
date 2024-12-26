fizz_buzz = fn 
    0, 0, _ -> "FizzBuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, x -> x
end

# FizzBuzz tests
IO.puts fizz_buzz.(0,0,42)
IO.puts fizz_buzz.(0, 7, 42)
IO.puts fizz_buzz.(9,0,42)
IO.puts fizz_buzz.(9,7,42)

fizz_buzz_rem = fn 
    n -> fizz_buzz.(rem(n,3), rem(n,5), n)
end

# FizzBuzz remainder tests
IO.puts fizz_buzz_rem.(10)
IO.puts fizz_buzz_rem.(11)
IO.puts fizz_buzz_rem.(12)
IO.puts fizz_buzz_rem.(13)
IO.puts fizz_buzz_rem.(14)
IO.puts fizz_buzz_rem.(15)
IO.puts fizz_buzz_rem.(16)