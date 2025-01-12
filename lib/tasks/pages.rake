namespace :pages do
  desc "Runs check for all pages"
  task run_checks: :environment do
    Page.find_each(&:run_and_notify)
    puts "Checks completed"
  end
end
