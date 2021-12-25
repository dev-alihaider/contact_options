# to run test suit
# ruby test_contact_options.rb

require_relative "contact_options"
require "test/unit"

class TestContactOptions < Test::Unit::TestCase

  def test_contacts

    contacts = [
      {
        name: 'John Doe',
        email: 'john@brdg.app',
        introsOffered: {free: 3, vip: 0}
      },
      {
        name: 'Billy Ray Jenkins',
        email: 'billy.jenkins@gmail.com',
        introsOffered: {free: 5, vip: 0}
      },
      {
        name: 'Jenny Baggins',
        email: 'jeni@x.com',
        introsOffered: {free: 5, vip: 1}
      },
      {
        name: 'Lloyd Banks',
        email: 'lloyd@banks.com',
        introsOffered: {free: 0, vip: 0}
      },
      {
        name: 'BA Lewis',
        email: 'ba.lewis@outlook.com',
        introsOffered: {free: 8, vip: 0}
      },
      {
        name: 'John Johnson',
        email: 'jj@z.com',
        introsOffered: {free: 4, vip: 0}
      },
      {
        name: 'Adam Johnson',
        email: 'aj@z.com',
        introsOffered: {free: 4, vip: 0}
      },
      {
        name: 'Joey Simpson',
        email: 'joey@hotmail.com',
        introsOffered: {free: 9, vip: 1}
      },
      {
        name: 'Penny Smith',
        email: 'penny@smith.com',
        introsOffered: {free: 2, vip: 0}
      }
    ]

    co = ContactOptions.new(contacts)
    contacts = co.get_contacts

    vip = contacts.select{|x| x[:contact_option] == "Offer VIP introduction" }

    assert_equal( vip.count, 1 ) # ensure one VIP only
    assert_equal( contacts[0][:name], "Jenny Baggins" ) # ensure sorting
  end
end
