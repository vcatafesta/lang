class Dog
    def speak
        puts "Au Au"
    end
end

class Mammal
    def breathe
        puts "inhale and exhale"
    end
end

class Cat<Mammal
    def speak
        puts "Meow"
    end
end


class Bird
    def preen
        puts "I am cleaning my feathers."
    end

    def fly
        puts "I am flying."
    end
end

class Penguin<Bird
    def fly
        fail "Sorry. I'd rather swim."
    end
end
   

pochi = Dog.new
puts(pochi)
pochi.speak

(Dog.new).speak
Dog.new.speak


tama = Cat.new
puts(tama)
tama.breathe
tama.speak

