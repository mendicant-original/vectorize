a = "1.100.4"
b = "1.11.2"

def foo(a,b)

          a.split(".").each_with_index do |version, index|
            compairison = (version.to_i <=> b.split(".")[index].to_i)
            return compairison unless compairison == 0
          end
          0
end


puts foo(a,b)
