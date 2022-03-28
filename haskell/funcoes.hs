main :: IO ()
main = do c <- getChar
          putChar c
       getLine1			 
getLine1     :: IO String
getLine1     =  do c <- getChar
                   if c == '\n'
                       then return ""
                       else do l <- getLine1
                               return (c:l)
area_quad::Int->Int
area_quad x = x * x

area_ret::Int->Int->Int
area_ret b a = b * a

fatorial::Int->Int
fatorial n | (n == 0) = 1
           | otherwise = n * fatorial (n-1)

fib :: Int->Int
fib n | (n == 1) || (n == 2) = 1
      | otherwise = fib (n-1) + fib (n-2)

mdc :: Int->Int->Int
mdc x y | (x == y) = x
        | (x > y)  = mdc (x - y) y
        | otherwise = mdc y x
  
soma 1 = 1
soma n = soma (n-1) + n

sumOfNums = sum [1..1000]  

doubleUs x y = doubleMe x + doubleMe y
doubleMe x = x + x
doubleSmallNumber x = 
    if x > 100
    then x
    else x * 2

