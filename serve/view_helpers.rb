require 'digest/md5'

module ViewHelpers
  def ben
    Person.new.tap do |p|
      p.name  = 'Ben Shymkiw'
      p.email = 'ben@t.apio.ca' 
      p.url   = 'http://github.com/iamsolarpowered'
      p.bio   = 'Rubyist'
    end
  end

  def stu
    Person.new.tap do |p|
      p.name  = 'Stuart Basden'
      p.email = 'stu@t.apio.ca' 
      p.url   = 'http://github.com/thugsb'
      p.bio   = 'Javascriptor'
    end
  end
end

class Person
  attr_accessor :name, :email, :url, :bio

  def id
    return unless email
    email.split('@').first.downcase
  end

  def avatar_url
    return unless email
    hash = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash}?s=152"
  end
end