# Keyword arguments are similar to positional arguments with default values:
def add_values(first: 1, second: 2)
    p first + second
end

add_values
add_values()

# Arbitrary keyword arguments will be accepted with **:
def gather_arguments(first: nil, **rest)
    p first, rest
end

gather_arguments first: 1, second: 2, third: 3 # prints 1 then {:second=>2, :third=>3}
gather_arguments first: 1, second: 2, third: 3, quarto: 4 # prints 1 then {:second=>2, :third=>3}

#When calling a method with keyword arguments the arguments may appear in any order. If an unknown keyword argument is sent by the caller an ArgumentError is raised.
#When mixing keyword arguments and positional arguments, all positional arguments must appear before any keyword arguments.

# The block argument is indicated by & and must come last:
def my_method(&my_block)
    my_block.call(self)
end

#Most frequently the block argument is used to pass a block to another method:

def each_item(&block)
    @items.each(&block)
end

#Methods have an implied exception handling block so you do not need to use begin
#or end to handle exceptions. This:

def my_method
    begin
        # code that may raise an exception
    rescue
        # handle exception
    end
end

# May be written as:
def my_method
    # code that may raise an exception
rescue
    # handle exception
end

klass = Class.new do
    def initialize(*args)
        @initialized = true
    end

    def initialized?
        @initialized || false
    end
end
puts klass.allocate.initialized? #=> false


