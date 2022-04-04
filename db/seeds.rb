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
User.create(:full_name => 'John Tester', :email => "t3ster219@gmail.com", :role => "admin");
User.create(:full_name => 'Johnathan Torres', :email => "torres404@tamu.edu", :role => "admin");
Semester.create(:name => 'Spring 2022', :start => "1/22/22", :end=> "5/14/22", :duescost => 200.00)

Event.create(:name => 'Test Event', :password => "testEventPassword", :description => 'This is a test event', :time => '2022-03-04', :link => "www.google.com", :location => 'Test Location', :is_mandatory => true, :is_recurring => false);
Event.create(:name => 'Test Event2', :password => "password", :description => 'This is a test event', :time => '2022-03-05', :link => "www.google.com", :location => 'Test Location2', :is_mandatory => true, :is_recurring => false);
Event.create(:name => 'Test Event3', :password => "password", :description => 'This is a test event', :time => '2022-03-06', :link => "www.google.com", :location => 'Test Location3', :is_mandatory => true, :is_recurring => false);
EventUser.create(:user_id => 2, :event_id => 1, :attended => true);

HomePage.create(:heading => 'Howdy', :summary => 'Hello');