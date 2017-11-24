if ARGV.length != 1
  puts "Error: Can only parse one file."
  exit;
end

filename = ARGV[0] + ".moj"
puts "Parsing the file '#{filename}'"

fh = open filename

toks = []
variables = {}

fh = fh.split('\n')
for line in fh
  if line == ""
    line = ""
  else:
    for tok in line.split
      cm = tok.slice(0)
      toks.push({cm,tok.join(" "))})
    end
  end
end

def parseToks()
  i = 1
  while i < toks.length
    cm = toks[i][0]
    args = toks[i][1].split(%r{,\s*})
    if cm == "SET"
      if !args[0] or !args[1] or !args[2]
        puts "Error: Please provide all the parameters."
      else
        if args[0] == ":String"
          variables[args[1]] = args[2]
        elsif args[0] == ":Array"
          variables[args[1]] = []
        elsif args[0] == ":Dictionary"
          variables[arg[1]] = {}
        elsif args[0] == ":Number"
          variables[args[1]] = args[2].to_i
        end
      end
    elsif cm == "push" or cm == "append"
      if !args[0] or !args[1] or args[2]
        puts "Error: Please provide all the parameters."
      else
        if args[0] == ":Array"
          variables[args[1]].push(args[3])
        else args[0] == ":Dictionary"
          args
          if !args[3]
            puts "Error: Please provide all the parameters."
          else
            variables[args[1]][args[2]] = args[3]}
        end
      end
    end
  end
end
