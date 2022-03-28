puts "..."
sleep 3

puts "BIOS sleep mode activated. Entering boot mode."
sleep 1

puts "Boot mode entered. Preparing to boot."
sleep 0.5

puts "Booting..."
sleep 5

puts "Starting core..."
sleep 2
puts "Started."
sleep 1
puts "Starting kernel..."
sleep 2
puts "Started."
sleep 1
puts "Starting Star10 'GUI'..."
sleep 1
puts "Started."
sleep 0.5
puts "Starting Holographic (filesystem)..."
sleep 1
puts "Started."
sleep 0.5
puts "Starting Star Store (softwarecenter)..."
sleep 1
puts "Started."
sleep 0.5
puts "Starting Galaxy Explorer (webbrowser)..."
sleep 1
puts "Started."
sleep 0.5
puts "Finishing booting..."
sleep 10
puts "Operating system booted."
sleep 1
puts ""
puts "                              Star 10 : A terminal-based operating sytem made in Ruby."
puts "                                                  Press ENTER to login."
puts ""

# read a character without pressing enter and without printing to the screen

def read_char
    begin
        # save previous state of stty
        old_state = `stty -g`
        # disable echoing and enable raw (not having to press enter)
        system "stty raw -echo"
        c = STDIN.getc.chr
        # gather next two characters of special keys
        if (c=="\e")
            extra_thread = Thread.new {
                c = c + STDIN.getc.chr
                c = c + STDIN.getc.chr
            }
            # wait just long enough for special keys to get swallowed
            extra_thread.join(0.00001)
            # kill thread so not-so-long special keys don't wait on getc
            extra_thread.kill
        end
    rescue => ex
        puts "#{ex.class}: #{ex.message}"
        puts ex.backtrace
    ensure
        # restore previous state of stty
        system "stty #{old_state}"
    end
    return c
end

# takes a single character command
#def show_single_key
#c = read_char
#case c
#when " "
# puts "SPACE"
#when "\t"
# puts "TAB"
#when "\r"
# puts "RETURN"
#when "\n"
# puts "LINE FEED"
#when "\e"
# puts "ESCAPE"
#when "\e[A"
# puts "UP ARROW"
#when "\e[B"
# puts "DOWN ARROW"
#when "\e[C"
# puts "RIGHT ARROW"
#when "\e[D"
# puts "LEFT ARROW"
#when "\177"
# puts "BACKSPACE"
#when "\004"
# puts "DELETE"
#when /^.$/
# puts "SINGLE CHAR HIT: #{c.inspect}"
#else
# puts "SOMETHING ELSE: #{c.inspect}"
#end
#end

#show_single_key while(true)

# detects pressing ENTER for login
def detect_enter_login
    c = read_char
    case c
        when "\r"
            puts "Login"
    end
end

detect_enter_login