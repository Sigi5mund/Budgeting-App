class StringHelper
  def self.titleize(str)
    str.split(/ |\_/).map(&:capitalize).join(" ")
  end
end
