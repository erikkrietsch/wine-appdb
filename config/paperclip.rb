Paperclip::Attachment.default_options[:url] = "/system/attachments/#{Rails.env}/:class/:attachment/:id_partition/:style/:filename"
Paperclip::Attachment.default_options[:path] = ":rails_root/public/system/attachments/#{Rails.env}/:class/:attachment/:id_partition/:style/:filename"
