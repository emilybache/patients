module ApplicationHelper

  def row_id(name)
    downcased_name = name.downcase
    downcased_name.gsub(/[\s?"'%<>]/, "_")
  end
end
