# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:full_name => 'Ken Kirkley', :email => "kenkirkley1330@gmail.com", :role => "admin");
User.create(:full_name => 'Holland McQuaid', :email => "HollandMcQ2@gmail.com", :role => "admin", :attendance_count => 1, :has_paid_dues => true);
User.create(:full_name => 'Elaine Mo', :email => "kakashiandflute@gmail.com", :role => "admin");
User.create(:full_name => 'John Knapp', :email => "jmichaelknapp@gmail.com", :role => "admin");

Semester.create(:name => 'Spring 2022', :start => Date.new(2022,1,22), :end=> Date.new(2022,5,14), :duescost => 2.00)
User.create(:full_name => 'John Tester', :email => "t3ster219@gmail.com", :role => "admin");
User.create(:full_name => 'Johnathan Torres', :email => "torres404@tamu.edu", :role => "admin");
User.find_by_email("kakashiandflute@gmail.com").update(:role => 'president')

Event.create(:name => 'Test Event', :password => "testEventPassword", :description => 'This is a test event', :time => '2022-03-04', :end_time => '2022-03-5', :link => "www.google.com", :location => 'Test Location', :is_mandatory => true, :is_recurring => false);
Event.create(:name => 'Test Event2', :password => "password", :description => 'This is a test event', :time => '2022-03-05', :end_time => '2022-03-6', :link => "www.google.com", :location => 'Test Location2', :is_mandatory => true, :is_recurring => false);
Event.create(:name => 'Test Event3', :password => "password", :description => 'This is a test event', :time => '2022-03-06', :end_time => '2022-03-7', :link => "www.google.com", :location => 'Test Location3', :is_mandatory => true, :is_recurring => false);
EventUser.create(:user_id => 2, :event_id => 1, :attended => true);

SemesterUser.create(semester_id: Semester.all.last.id, user_id: User.all.last.id, paid_dues: true);
HomePage.create(:heading => 'Howdy', :summary => 'Hello');
PaymentAccount.create(internal_name: 'Default Account', payment_address: 'AZ7cvFNlXaeTjUVqghWxEaqvBuJEHCz3BKwX7fksAdrleR1tqTQksTwO9oI6NgB3_k7Pb9XstqeIBuIW')
