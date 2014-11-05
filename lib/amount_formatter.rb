class AmountFormatter
  FORMAT_DEFAULT_ARGS = {precision: 2}

  def self.locale_engine=(engine)
    @locale_engine = engine
  end

  #Returns the number as a formatted string.
  def self.format(number, args = {})
    separator = args[:separator] || default_separator
    delimiter = args[:delimiter] || default_delimiter

    args = FORMAT_DEFAULT_ARGS.merge(args)
    number = number.to_f unless number.is_a?(Float)
    return sprintf("%.#{args[:precision].to_i}f", number).gsub(".", separator) if number < 1 && number > -1
    number = sprintf("%.#{args[:precision].to_i}f", number).split(".")

    str = ""
    number[0].reverse.scan(/(.{1,3})/) do |match|
      if match[0] == "-"
        #This happens if the number is a negative number and we reach the minus-sign.
        str << match[0]
      else
        str << delimiter if str.length > 0
        str << match[0]
      end
    end

    str = str.reverse
    str << "#{separator}#{number[1]}" if args[:precision] > 0

    return str
  end

private

  def self.default_separator
    if @locale_engine == :i18n && I18n.exists?("number.format.separator")
      translation = I18n.t("number.format.separator").to_s.strip
      return translation unless translation.empty?
    end

    return "."
  end

  def self.default_delimiter
    if @locale_engine == :i18n && I18n.exists?("number.format.delimiter")
      translation = I18n.t("number.format.delimiter").to_s.strip
      return translation unless translation.empty?
    end

    return ","
  end
end
