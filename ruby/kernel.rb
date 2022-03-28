p sprintf "%.1f", 1.234 #=> "1.2"


a = Array(1..150000) #=> [1, 2, 3, 4, 5]
p a
p a.size

b = Array("A".."z") #=> [1, 2, 3, 4, 5]
p b
p b.size


p Hash([]) #=> {}
p Hash(nil) #=> {}
p Hash(key: :value) #=> {:key => :value}


p Integer(123.999) #=> 123
p Integer("0x1a") #=> 26
p Integer(Time.new) #=> 1204973019
p Integer("0930", 10) #=> 930
p Integer("111", 2) #=> 7


p String(self) #=> "main"
p String(self.class) #=> "Object"
p String(123456) #=> "123456"


0.upto(100) {|x|
    p [x, Math.cbrt(x), Math.cbrt(x)**3]
    p Math.exp(x)
    p Math.log(x)
    p Math.sqrt(x)
}

1.times do
    a = 1
    puts "local variables in the block: #{local_variables.join ", "}"
end

puts "no local variables outside the block" if local_variables.empty?
puts "variables outside the block: #{local_variables.join ", "}"


for a in [1, 2, 3, 4, 5] do
    p a * 10
end

obj = Object.new

def obj.each
    yield 1; yield 2
end

for a in obj
    p a
end



class Person
    def name=(name)
        puts "Naming your person #{name}!"
        @name = name
    end

    alias full_name= name=
end

p = Person.new
p.name = "David"        # Naming your person David!

class Person
    def name=(name)
        puts "Please use full_name="
    end
end

p.name = "Joe"          # Please use full_name=
p.full_name = "Joe"     # Naming your person Joe!
puts "Hello" and "Goodbye"

x = 0
begin
    x += 1
    puts x
end until x == 10



case x
    when 1,2,3
        puts "1, 2, or 3"
    when 10
        puts "10"
    else
        puts "Some other number"
end


a = 0
begin
    1/a
rescue ZeroDivisionError => e
    puts e.message
    puts "Let's try that again..."
    a = 1
    retry
end
puts "That's better!"



sizes = [0,1,2,3,4].map do |n|
    next("big") if n > 2
    puts "Small number detected!"
    "small"
end
p sizes

o = Object.new
def o.each
    yield 1
    yield 2
    yield 3
    100
end

e = o.to_enum
puts e.next                   #=> 1
puts e.next                   #=> 2
puts e.next                   #=> 3

begin
    e.next
rescue StopIteration => ex
    puts ex.result              #=> 100
end