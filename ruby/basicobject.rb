class MyObjectSystem < BasicObject
end

class MyObjectSystem < BasicObject
    DELEGATE = [:puts, :p]

    def method_missing(name, *args, &block)
        super unless DELEGATE.include? name
        ::Kernel.send(name, *args, &block)
    end

    def respond_to_missing?(name, include_private = false)
        DELEGATE.include?(name) or super
    end
end

class MyObjectSystem < BasicObject
    def self.const_missing(name)
        ::Object.const_get(name)
    end
end


obj   = "a"
other = obj.dup
p obj == other #=> true
p obj.equal? other #=> false
p obj.equal? obj #=> true


p 1 == 1.0     #=> true
p 1.eql? 1.0   #=> false


p Object.new.object_id  == Object.new.object_id  # => false
p (21 * 2).object_id    == (21 * 2).object_id    # => true
p "hello".object_id     == "hello".object_id     # => false
p "hi".freeze.object_id == "hi".freeze.object_id # => true


class Klass
    def hello(*args)
        "Hello " + args.join(' ')
    end
end
k = Klass.new
p k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"


class Teste
    def nome(*args)
        p "Ola, " + args.join(' ')
    end
end

v = Teste.new
v.send :nome, 'Vilmar'


class KlassWithSecret
    def initialize
        @secret = 99
    end
    private
    def the_secret
        "Ssssh! The secret is #{@secret}."
    end
end
k = KlassWithSecret.new
p k.instance_eval { @secret }          #=> 99
p k.instance_eval { the_secret }       #=> "Ssssh! The secret is 99."
p k.instance_eval {|obj| obj == self } #=> true


module Chatty
    def Chatty.singleton_method_added(id)
        puts "Adding #{id.id2name}"
    end
    def self.one()     end
    def two()          end
    def Chatty.three() end
end


module Chatty
    def Chatty.singleton_method_removed(id)
        puts "Removing #{id.id2name}"
    end
    def self.one()     end
    def two()          end
    def Chatty.three() end
    class << self
        remove_method :three
        remove_method :one
    end
end

module Chatty
    def Chatty.singleton_method_undefined(id)
        puts "Undefining #{id.id2name}"
    end
    def Chatty.one()   end
    class << self
        undef_method(:one)
    end
end


