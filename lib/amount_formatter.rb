class AmountFormatter
  FORMAT_DEFAULT_ARGS = {:precision => 2, :seperator => ".", :delimiter => ","}
  
  #Returns the number as a formatted string.
  def self.format(number, args = {})
    args = FORMAT_DEFAULT_ARGS.merge(args)
    number = number.to_f unless number.is_a?(Float)
    return sprintf("%.#{args[:precision].to_i}f", number).gsub(".", args[:seperator]) if number < 1 && number > -1
    number = sprintf("%.#{args[:precision].to_i}f", number).split(".")
    
    str = ""
    number[0].reverse.scan(/(.{1,3})/) do |match|
      if match[0] == "-"
        #This happens if the number is a negative number and we reach the minus-sign.
        str << match[0]
      else
        str << args[:delimiter] if str.length > 0
        str << match[0]
      end
    end
    
    str = str.reverse
    str << "#{args[:seperator]}#{number[1]}" if args[:precision] > 0
    
    return str
  end
end
