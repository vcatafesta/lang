if __FILE__ == $0
    word = "fo" + 'o'
    puts(word)
    puts(word[0])
    puts(word[1])

    "abc".each_byte {
            |c| printf "<%c>", c
    };
    print "\n"


    s="abc"; i=0

    while i<s.length
        printf "<%c>", s[i]; i+=1
    end;
    print "\n"

    "a\nb\nc\n".each_line {|l| print l}


    repeat(3) {puts "foo"}

    print "abcdef".length
    foo = "abc"
    puts foo.length
    foo = ["abcde", "fghij"]
    puts foo.length

    foo = 5
    puts(foo.length)
end

def repeat(num)
    while num > 0
        yield
        num -= 1
    end
end

