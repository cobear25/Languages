
exception NotImplemented

(* Write a function cube of type int -> int that returns the cube of
its parameter *)

fun cube x = x * x * x;

(* Write a function cuber of type real -> real that returns the cube
of its parameter *)

fun cuber x:real = x * x * x;

(* Write a function fourth of type 'a list -> 'a that returns the
fourth element of a list. Your function need not behave well on
lists with less than four elements. *)

fun fourth [] = 0
  | fourth (a::b::c::d::tail) = d;

(* Write a function min3 of type int * int * int -> int that returns
the smallest of three integers *)

fun min3 (a, b, c) = if a <= b andalso a <= c then a else if b <= a andalso b <= c then b else c;

fun max3 (a, b, c) = if a >= b andalso a >= c then a else if b >= a andalso b >= c then b else c;
(* Write a function red3 of type 'a * 'b * 'c -> 'a * 'c that
converts a tuple with three elements into one with two by elminating
the second element *)

fun red3 (a, b, c) = (a, c);

(* Write a function thirds of type string -> char that returns the
third character of a string. Your function need not behave well on
strings with lengths less than 3 *)

fun third [] = #"-"
  | third (a::b::c::d) = c;
fun thirds string = third (explode string);

(* Write a function cycle1 of type 'a list -> 'a list whose output
list is the same as the input list, but with the first element of
the list moved to the end. For example, cycle1 [1,2,3,4] shoudl
return [2,3,4,1] *)

fun cycle1 [] = []
  | cycle1 (x::xs) = xs@[x];

(* Write a function sort3 of type real * real * real -> real list
that returns a sorted list of three real numbers *)

fun min3Real (a:real, b:real, c:real) = if a <= b andalso a <= c then a else if b <= a andalso b <= c then b else c;
fun max3Real (a:real, b:real, c:real) = if a >= b andalso a >= c then a else if b >= a andalso b >= c then b else c;
fun min2 (a:real, b:real) = if a <= b then a else b;
fun sort3 (a, b, c) =
  let fun notMins (a, b, c) = if a >= c andalso b >= c then (a,b)
                              else if a >= b andalso c >= b then (a,c)
                              else (b,c)
  in
    [min3Real (a,b,c), min2 (notMins (a,b,c)), max3Real (a,b,c)]
  end;


(* Write a function del3 of type 'a list -> 'a list whose output
list is the same as the input list, but with the third element
deleted. Your function need not behave well on lists with lengths
less than 3 *)

fun del3 (a::b::c::d) = [a,b]@d;

(* Write a function sqsum of type int -> int that takes a
non-negative integer n and returns the sum of the squares of all the
integers 0 through n. Your function need not behave well on inputs
less than zero *)

fun sqsum 0 = 0
  | sqsum x = x * x + sqsum (x-1);

(* Write a function cycle of type 'a list * int -> 'a list that
takes a list and an integer n as input and returns the same list,
but with the first element cycled to the end of the list n times.
(Make use of your cycle1 function from a previous exercise.) For
example, cycle ([1,2,3,4,5,6],2) should return the list
[3,4,5,6,1,2] *)

fun cycle ([], a) = []
  | cycle (lst, a) = if a <= 0 then lst
                     else cycle(cycle1 lst, a-1);

(* Write a function pow of type real * int -> real that raises a
real number to an integer power. Your function need not behave well
if the integer power is negative *)

fun pow (x:real, y:int) = if y <= 0 then 1.0
                          else x*(pow(x, y-1)); 

(* Write a function max of type int list -> int that returns the
largest element of a list of integers. Your function need not behave
well if the list is empty. Hint: Write a helper function maxhelper
that takes as a second parameter the largest element seen so far.
Then you can complete the exercise by defining

    fun max x = maxhelper (tl x, hd x)
*)
fun max2 (x, y) = if x >= y then x else y
fun maxHelper ([], largest) = largest
  | maxHelper ((x::xs), largest) = max2 (largest, maxHelper(xs, x)) 
fun max (x::xs) = maxHelper (xs, x)

(* Write a function isPrime of type int -> bool that returns true
if and only if its integer parameter is a prime number. Your
function need not behave well if the parameter is negative *)
fun primeHelp (x:int, y:int) = if y = 1 then true else if x mod y = 0 then false else
  primeHelp (x, y-1)
fun isPrime x = if x = 1 then false else if x = 2 then true else primeHelp (x, (x div 2) + 1)

(* Write a function select of type 'a list * ('a -> bool) -> 'a list
that takes a list and a function f as parameters. Your function
should apply f to each element of the list and should return a new
list containing only those elements of the original list for which f
returned true. (The elements of the new list may be given in any
order.) For example, evaluating select ([1,2,3,4,5,6,7,8,10],
isPrime) should result in a list like [7,5,3,2]. This is an example
of a higher-order function, since it takes another function as a
parameter *)

fun select ([], f) = []
  | select ((x::xs), f) = if f x = true then x::select(xs,f) else select(xs,f)
val lst = select ([1,2,3,4,5,6,7], isPrime)
                          
