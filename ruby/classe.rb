class Class
    alias old_new new

    def new(*args)
        print "Creating a new ", self.name, "\n"
        old_new(*args)
    end
end

class Name
end

n = Name.new

class Tally < Numeric
    def initialize(string)
        @string = string
    end

    def to_s
        @string
    end

    def to_i
        @string.size
    end

    def coerce(other)
        [self.class.new('|' * other.to_i), self]
    end

    def <=>(other)
        to_i <=> other.to_i
    end

    def +(other)
        self.class.new('|' * (to_i + other.to_i))
    end

    def -(other)
        self.class.new('|' * (to_i - other.to_i))
    end

    def *(other)
        self.class.new('|' * (to_i * other.to_i))
    end

    def /(other)
        self.class.new('|' * (to_i / other.to_i))
    end
end

tally = Tally.new('||')
puts tally * 2 #=> "||||"
puts tally > 1 #=> true

puts (-1..-5).to_a #=> []
puts (-5..-1).to_a #=> [-5, -4, -3, -2, -1]
puts ('a'..'e').to_a #=> ["a", "b", "c", "d", "e"]
puts ('a'...'e').to_a #=> ["a", "b", "c", "d"]

class Xs # represent a string of 'x's
    include Comparable
    attr :length

    def initialize(n)
        @length = n
    end

    def succ
        Xs.new(@length + 1)
    end

    def <=>(other)
        @length <=> other.length
    end

    def to_s
        sprintf "%2d #{inspect}", @length
    end

    def inspect
        'x' * @length
    end
end

r = Xs.new(3)..Xs.new(6) #=> xxx..xxxxxx
puts r.to_a #=> [xxx, xxxx, xxxxx, xxxxxx]
puts r.member?(Xs.new(5)) #=> true

case 79
    when 1..50 then
        print "low\n"
    when 51..75 then
        print "medium\n"
    when 76..100 then
        print "high\n"
end

print puts (1..10).begin

ary = [0, 4, 7, 10, 12]
puts (0...ary.size).bsearch {|i| ary[i] >= 4} #=> 1
puts (0...ary.size).bsearch {|i| ary[i] >= 6} #=> 2
puts (0...ary.size).bsearch {|i| ary[i] >= 8} #=> 3
puts (0...ary.size).bsearch {|i| ary[i] >= 100} #=> nil
puts (0.0...Float::INFINITY).bsearch {|x| Math.log(x) >= 0} #=> 1.0


Customer = Struct.new(:name, :address) do
    def greeting
        "Hello #{name}!"
    end
end

dave = Customer.new("Dave", "123 Main")
puts dave.name #=> "Dave"
puts dave.address #=> "123 Main"
puts dave.greeting #=> "Hello Dave!"
puts
puts Time.new(2002) #=> 2002-01-01 00:00:00 -0500
puts Time.new(2002, 10) #=> 2002-10-01 00:00:00 -0500
puts Time.new(2002, 10, 31) #=> 2002-10-31 00:00:00 -0500
puts Time.new(2002, 10, 31, 2, 2, 2, "+02:00") #=> 2002-10-31 02:02:02 +0200
puts

Dir.foreach("/python/ruby/") {|x| puts "Arquivo: #{x} #{x}"}


enumerator = %w(one two three).each
puts enumerator.class # => Enumerator
puts enumerator

enumerator.each_with_object("foo") do |item, obj|
    puts "#{obj}: #{item}"
end


o = Object.new

def o.each
    yield
    yield 1
    yield 1, 2
end

e = o.to_enum
p e.peek_values #=> []
e.next
p e.peek_values #=> [1]
p e.peek_values #=> [1]
e.next
p e.peek_values #=> [1, 2]
e.next
# p e.peek_values # raises StopIteration

to_three = Enumerator.new do |y|
    3.times do |x|
        y << x
    end
end

to_three_with_string = to_three.with_object("foo")
to_three_with_string.each do |x, string|
    puts "#{string}: #{x}"
end

t = Time.new(1993, 02, 24, 12, 0, 0, "+09:00")
puts t.monday? #=> false
t.year #=> 1993
puts t.dst? #=> false

t = Time.now.asctime
puts t

class C
    def [](a, b)
        puts a + b
    end

    def []=(a, b, c)
        puts a * b + c
    end
end

obj = C.new
obj[2, 3] # prints "5"
obj[2, 3] = 4 # prints "10"

greeting = "Hello"

def greeting.broaden
    puts self + ", world!"
end

greeting.broaden # returns "Hello, world!"

def String.hello
    puts "Hello, world!"
end

String.hello


puts "43".to_i # => 43
class String
    def to_i
        42
    end
end

puts "43".to_i #=> 42

def add_one(value)
    value + 1
end

puts add_one 1 #=> 2
puts valor = add_one(1)

def add_one value
    value + 1
end

puts valor = add_one(1)
puts add_one 1 #=> 2

def add_values(a, b)
    a + b
end

def add_values(a, b = 1)
    a + b
end

def add_values(a = 1, b = 2, c)
    a + b + c
end

def my_method((a, b))
    p a: a, b: b
end

p my_method([1, 2])

def my_method((a, b))
    p a: a, b: b
end

my_method([1, 2, 3])

def my_method((a, *b))
    p a: a, b: b
end

my_method([1, 2, 3])

def my_method(a, (b, c), d)
    p a: a, b: b, c: c, d: d
end

my_method(1, 2, 3)

def gather_arguments(*arguments)
    p arguments
end

gather_arguments 1, 2, 3 # prints [1, 2, 3]

def ignore_arguments(*)
end

