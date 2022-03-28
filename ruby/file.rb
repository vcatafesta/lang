#Truncates the file file_name to be at most integer bytes long. Not available on all platforms.
f = File.new("out", "w")
p f.write("1234567890") #=> 10
p f.write("1234567890") #=> 10
p f.write("1234567890") #=> 10
p f.write("1234567890") #=> 10
p f.write("1234567890") #=> 10
p f.close #=> nil
p File.size("out") #=> 10
p File.truncate("out", 5) #=> 0
p File.size("out") #=> 5


begin
    exit
    puts "never get here"
rescue SystemExit
    puts "rescued a SystemExit exception"
end
puts "after begin block"

p Process.pid


t = Process.times
p [t.utime, t.stime, t.cutime, t.cstime] #=> [0.0, 0.02, 0.00, 0.00]

p Random.new_seed

p srand 1234               # => 268519324636777531569100071560086917274
p [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]
p [ rand(10), rand(1000) ] # => [4, 664]
p srand 1234               # => 1234
p [ rand, rand ]           # => [0.1915194503788923, 0.6221087710398319]


p Random.new == Random.new             # => false
p Random.new(1234) == Random.new(1234) # => true


p (10..20).first     #=> 10
p (10..20).first(3)  #=> [10, 11, 12]


p ("a".."z").include?("g")   #=> true
p ("a".."z").include?("A")   #=> false
p ("a".."z").include?("cc")  #=> false


p (10..20).last      #=> 20
p (10...20).last     #=> 20
p (10..20).last(3)   #=> [18, 19, 20]
p (10...20).last(3)  #=> [17, 18, 19]

p (10..20).min    #=> 10
p (10..20).size    #=> 11
p ('a'..'z').size  #=> nil
p (-Float::INFINITY..Float::INFINITY).size #=> Infinity


Customer = Struct.new(:name, :address, :zip)
joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12_345)
vil = Customer.new("Vilmar Catafesta", "Av Castelo Branco, Pimenta Bueno, RO, BR", 76_976_000)

p joe["name"]   #=> "Joe Smith"
p joe[:name]    #=> "Joe Smith"
p joe[0]        #=> "Joe Smith"
joe.each {|x| puts(x) }
joe.each_pair {|name, value| puts("#{name} => #{value}") }
p joe.length   #=> 3
p joe.members   #=> [:name, :address, :zip]
p joe.to_a[1]   #=> "123 Maple, Anytown NC"
p joe.to_h[:address]   #=> "123 Maple, Anytown NC"


vil.each {|x| puts(x) }
vil.each_pair {|name, value| puts("#{name} => #{value}") }
p vil.length   #=> 3
p vil.members   #=> [:name, :address, :zip]
p vil.to_a[1]   #=> "123 Maple, Anytown NC"
p vil.to_h[:address]   #=> "123 Maple, Anytown NC"
p vil.values_at(0, 2)   #=> ["Joe Smith", 12345]





