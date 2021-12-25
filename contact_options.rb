# load class in irb
# source('contact_options.rb')

class ContactOptions
  BASE_RANKING = 3
  EMAILS = %w[gmail hotmail outlook yahoo]

  def initialize(contacts)
    @@contacts = contacts
  end

  def get_contacts
    contacts = contacts_with_ranking
    contacts = contacts_with_contact_options(contacts)

    # sort and remove extra keys
    contacts.sort_by { |x| [x[:last_name].downcase, x[:first_name].downcase] }.map{|x| x.delete_if { |k,v| [:first_name, :last_name].include? k } }
  end

  private

  def contacts_with_ranking
    contacts = []

    # calculate ranking and add first and last names
    @@contacts.each do |c|
      hsh = c
      hsh = set_names(hsh, c)

      ranking = BASE_RANKING
      ranking += 2 if EMAILS.any? { |s| hsh[:email].include?(s) }
      ranking += c[:introsOffered][:free] + c[:introsOffered][:vip]
      hsh[:ranking] = ranking
      contacts << hsh
    end
    contacts
  end

  def contacts_with_contact_options(contacts)
    # calculate contact option based on ranking and conditions specified in docs
    contact_option = []
    contacts.each do |c|
      max_ranking = contacts.select{|x| x[:introsOffered][:vip] == 0 && c[:email] != x[:email]}.map{|x| x[:ranking] }.max
      c[:contact_option] =  if c[:introsOffered][:vip] > 0
                              'Offer free introduction'
                            elsif max_ranking && c[:ranking] > max_ranking
                              'Offer VIP introduction'
                            else
                              'Offer free introduction'
                            end
      contact_option << c
    end
    contact_option
  end

  def set_names(hsh, contact)
    name = contact[:name].split
    hsh[:first_name] = name.shift
    hsh[:last_name] = name.join(' ')
    hsh
  end
end
