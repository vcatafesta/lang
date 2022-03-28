p String.try_convert("str")     #=> "str"
p String.try_convert(/re/)      #=> nil


p "%05d" % 123                              #=> "00123"
p "%-5s: %08x" % [ "ID", self.object_id ]   #=> "ID   : 200e14d6"
p "foo = %{foo}" % { :foo => 'bar' }        #=> "foo = bar"

p "Ho! " * 3   #=> "Ho! Ho! Ho! "
p "Ho! " * 0   #=> ""

p "Hello from " + self.to_s   #=> "Hello from main"

a = "hello "
p a << "world"   #=> "hello world"
p a.concat(33)   #=> "hello world!"
p a              #=> "hello world!"

b = "sn"
p b.concat(b, b)    #=> "snsnsn"

p "abcdef" <=> "abcde"     #=> 1
p "abcdef" <=> "abcdef"    #=> 0
p "abcdef" <=> "abcdefg"   #=> -1
p "abcdef" <=> "ABCDEF"    #=> 1
p "abcdef" <=> 1           #=> nil

p "cat o' 9 tails" =~ /\d/   #=> 7
p "cat o' 9 tails" =~ 9      #=> nil


a = "hello there"

a[1]                   #=> "e"
a[2, 3]                #=> "llo"
a[2..3]                #=> "ll"

a[-3, 2]               #=> "er"
a[7..-2]               #=> "her"
a[-4..-2]              #=> "her"
a[-2..-4]              #=> ""

a[11, 0]               #=> ""
a[11]                  #=> nil
a[12, 0]               #=> nil
a[12..-1]              #=> nil

a[/[aeiou](.)\1/]      #=> "ell"
a[/[aeiou](.)\1/, 0]   #=> "ell"
a[/[aeiou](.)\1/, 1]   #=> "l"
a[/[aeiou](.)\1/, 2]   #=> nil

a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] #=> "l"
a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "vowel"]     #=> "e"

a["lo"]                #=> "lo"
a["bye"]               #=> nil

p "abc".force_encoding("UTF-8").ascii_only?          #=> true
p "abc\u{6666}".force_encoding("UTF-8").ascii_only?  #=> false

p "\x80\u3042".bytesize  #=> 4
p "hello".bytesize       #=> 5


p "hello".byteslice(1)     #=> "e"
p "hello".byteslice(-1)    #=> "o"
p "hello".byteslice(1, 2)  #=> "el"
p "\x80\u3042".byteslice(1, 3) #=> "\u3042"
p "\x03\u3042\xff".byteslice(1..3) #=> "\u3042"

p "hello".capitalize    #=> "Hello"
p "HELLO".capitalize    #=> "Hello"
p "123ABC".capitalize   #=> "123abc"

a = "hello"
p a.capitalize!   #=> "Hello"
p a               #=> "Hello"
p a.capitalize!   #=> nil

p "hello".center(4)         #=> "hello"
p "hello".center(20)        #=> "       hello        "
p "hello".center(20, '123') #=> "1231231hello12312312"


p "hello".chomp                #=> "hello"
p "hello\n".chomp              #=> "hello"
p "hello\r\n".chomp            #=> "hello"
p "hello\n\r".chomp            #=> "hello\n"
p "hello\r".chomp              #=> "hello"
p "hello \n there".chomp       #=> "hello \n there"
p "hello".chomp("llo")         #=> "he"
p "hello\r\n\r\n".chomp('')    #=> "hello"
p "hello\r\n\r\r\n".chomp('')  #=> "hello\r\n\r"

a = "abcde"
p a.clear    #=> ""

a = "hello "
a << "world"   #=> "hello world"
a.concat(33)   #=> "hello world!"
a              #=> "hello world!"

b = "sn"
b.concat(b, b)    #=> "snsnsn"

a = "hello world"
a.count "lo"                   #=> 5
a.count "lo", "o"              #=> 2
a.count "hello", "^l"          #=> 4
a.count "ej-m"                 #=> 4

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4

c = "hello world\\r\\n"
c.count "\\"                   #=> 2
c.count "\\A"                  #=> 0
c.count "X-\\w"                #=> 3

"hello".delete "l","lo"        #=> "heo"
"hello".delete "lo"            #=> "he"
"hello".delete "aeiou", "^e"   #=> "hell"
"hello".delete "ej-m"          #=> "ho"

"hello".delete_prefix("hel") #=> "lo"
"hello".delete_prefix("llo") #=> "hello"

"hello".delete_prefix!("hel") #=> "lo"
"hello".delete_prefix!("llo") #=> nil

"hello".delete_suffix("llo") #=> "he"
"hello".delete_suffix("hel") #=> "hello"

"hello".delete_suffix!("llo") #=> "he"
"hello".delete_suffix!("hel") #=> nil

"hEllO".downcase   #=> "hello"

"hello \n ''".dump  #=> "\"hello \\n ''\""

"hello".each_byte {|c| print c, ' ' }
"hello\u0639".each_codepoint {|c| print c, ' ' }

"a\u0300".each_char.to_a.size #=> 2
"a\u0300".each_grapheme_cluster.to_a.size #=> 1

print "Example one\n"
"hello\nworld".each_line {|s| p s}
print "Example two\n"
"hello\nworld".each_line('l') {|s| p s}
print "Example three\n"
"hello\n\n\nworld".each_line('') {|s| p s}

"hello".empty?   #=> false
" ".empty?       #=> false
"".empty?        #=> true

"hello".end_with?("ello")               #=> true
# returns true if one of the +suffixes+ matches.
"hello".end_with?("heaven", "ello")     #=> true
"hello".end_with?("heaven", "paradise") #=> false

"hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             #=> "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      #=> "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    #=> "h3ll*"

"0x0a".hex     #=> 10
"-1234".hex    #=> -4660
"0".hex        #=> 0
"wombat".hex   #=> 0

"hello".include? "lo"   #=> true
"hello".include? "ol"   #=> false
"hello".include? ?h     #=> true

"hello".index('e')             #=> 1
"hello".index('lo')            #=> 3
"hello".index('a')             #=> nil
"hello".index(?e)              #=> 1
"hello".index(/[aeiou]/, -3)   #=> 4

s = "hello"         #=> "hello"
s.replace "world"   #=> "world"

"abcd".insert(0, 'X')    #=> "Xabcd"
"abcd".insert(3, 'X')    #=> "abcXd"
"abcd".insert(4, 'X')    #=> "abcdX"
"abcd".insert(-3, 'X')   #=> "abXcd"
"abcd".insert(-1, 'X')   #=> "abcdX"

str = "hello"
str[3] = "\b"
str.inspect       #=> "\"hel\\bo\""


"Koala".intern         #=> :Koala
s = 'cat'.to_sym       #=> :cat
s == :cat              #=> true
s = '@cat'.to_sym      #=> :@cat
s == :@cat             #=> true

'cat and dog'.to_sym   #=> :"cat and dog"

"hello".ljust(4)            #=> "hello"
"hello".ljust(20)           #=> "hello               "
"hello".ljust(20, '1234')   #=> "hello123412341234123"


"  hello  ".lstrip   #=> "hello  "
"hello".lstrip       #=> "hello"

"  hello  ".lstrip!  #=> "hello  "
"hello  ".lstrip!    #=> nil
"hello".lstrip!      #=> nil

'hello'.match('(.)\1')      #=> #<MatchData "ll" 1:"l">
'hello'.match('(.)\1')[0]   #=> "ll"
'hello'.match(/(.)\1/)[0]   #=> "ll"
'hello'.match(/(.)\1/, 3)   #=> nil
'hello'.match('xx')         #=> nil

"Ruby".match?(/R.../)    #=> true
"Ruby".match?(/R.../, 1) #=> false
"Ruby".match?(/P.../)    #=> false
$&                       #=> nil

"abcd".succ        #=> "abce"
"THX1138".succ     #=> "THX1139"
"<<koala>>".succ   #=> "<<koalb>>"
"1999zzz".succ     #=> "2000aaa"
"ZZZ9999".succ     #=> "AAAA0000"
"***".succ         #=> "**+"

"123".oct       #=> 83
"-377".oct      #=> -255
"bad".oct       #=> 0
"0377bad".oct   #=> 255

"a".ord         #=> 97

"hello".partition("l")         #=> ["he", "l", "lo"]
"hello".partition("x")         #=> ["hello", "", ""]
"hello".partition(/.l/)        #=> ["h", "el", "lo"]

a = "!"
a.prepend("hello ", "world") #=> "hello world!"
a                            #=> "hello world!"

s = "hello"         #=> "hello"
s.replace "world"   #=> "world"

"stressed".reverse   #=> "desserts"

"hello".rindex('e')             #=> 1
"hello".rindex('l')             #=> 3
"hello".rindex('a')             #=> nil
"hello".rindex(?e)              #=> 1
"hello".rindex(/[aeiou]/, -2)   #=> 1

"hello".rjust(4)            #=> "hello"
"hello".rjust(20)           #=> "               hello"
"hello".rjust(20, '1234')   #=> "123412341234123hello"

"hello".rpartition("l")         #=> ["hel", "l", "o"]
"hello".rpartition("x")         #=> ["", "", "hello"]
"hello".rpartition(/.l/)        #=> ["he", "ll", "o"]

"  hello  ".rstrip   #=> "  hello"
"hello".rstrip       #=> "hello"

"  hello  ".rstrip!  #=> "  hello"
"  hello".rstrip!    #=> nil
"hello".rstrip!      #=> nil

a = "cruel world"
a.scan(/\w+/)        #=> ["cruel", "world"]
a.scan(/.../)        #=> ["cru", "el ", "wor"]
a.scan(/(...)/)      #=> [["cru"], ["el "], ["wor"]]
a.scan(/(..)(..)/)   #=> [["cr", "ue"], ["l ", "wo"]]

a.scan(/\w+/) {|w| print "<<#{w}>> " }
print "\n"
a.scan(/(.)(.)/) {|x,y| print y, x }
print "\n"

a = "hello there"

a[1]                   #=> "e"
a[2, 3]                #=> "llo"
a[2..3]                #=> "ll"

a[-3, 2]               #=> "er"
a[7..-2]               #=> "her"
a[-4..-2]              #=> "her"
a[-2..-4]              #=> ""

a[11, 0]               #=> ""
a[11]                  #=> nil
a[12, 0]               #=> nil
a[12..-1]              #=> nil

a[/[aeiou](.)\1/]      #=> "ell"
a[/[aeiou](.)\1/, 0]   #=> "ell"
a[/[aeiou](.)\1/, 1]   #=> "l"
a[/[aeiou](.)\1/, 2]   #=> nil

a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] #=> "l"
a[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "vowel"]     #=> "e"

a["lo"]                #=> "lo"
a["bye"]               #=> nil

string = "this is a string"
string.slice!(2)        #=> "i"
string.slice!(3..6)     #=> " is "
string.slice!(/s.*t/)   #=> "sa st"
string.slice!("r")      #=> "r"
string                  #=> "thing"

" now's  the time".split        #=> ["now's", "the", "time"]
" now's  the time".split(' ')   #=> ["now's", "the", "time"]
" now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
"1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
"hello".split(//)               #=> ["h", "e", "l", "l", "o"]
"hello".split(//, 3)            #=> ["h", "e", "llo"]
"hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]

"mellow yellow".split("ello")   #=> ["m", "w y", "w"]
"1,2,,3,4,,".split(',')         #=> ["1", "2", "", "3", "4"]
"1,2,,3,4,,".split(',', 4)      #=> ["1", "2", "", "3,4,,"]
"1,2,,3,4,,".split(',', -4)     #=> ["1", "2", "", "3", "4", "", ""]

"1:2:3".split(/(:)()()/, 2)     #=> ["1", ":", "", "", "2:3"]

"".split(',', -1)               #=> []

"yellow moon".squeeze                  #=> "yelow mon"
"  now   is  the".squeeze(" ")         #=> " now is the"
"putters shoot balls".squeeze("m-z")   #=> "puters shot balls"

"hello".start_with?("hell")               #=> true

# returns true if one of the prefixes matches.
"hello".start_with?("heaven", "hell")     #=> true
"hello".start_with?("heaven", "paradise") #=> false




