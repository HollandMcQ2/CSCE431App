namespace :payments do
  desc "Resetting Payments"
  task reset_paid: :environment do
    sem = Semester.where(:end => Date.today)
    if sem.length > 0 
      User.update_all has_paid_dues: false
      puts "User payment status reset"
    
    else
      puts "Payments not reset today."
    
    end
  end

end
