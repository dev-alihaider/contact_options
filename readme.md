# Contact Options

## Unit testing

- run this command to run test cases `ruby test_contact_options.rb`

## Class usage
- Go to project directory in terminal
- Go to `irb`
- Load class in irb `source("contact_options.rb")`
- create dummy contacts data e.g
  - ```yaml
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
- Run this to get sorted contacts with ranking and options `ContactOptions.new(contacts).get_contacts`

