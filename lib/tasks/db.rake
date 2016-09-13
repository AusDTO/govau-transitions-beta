namespace :db do
  desc 'Wipe out all data. (Because we can\'t db:reset on CF.)'
  task :wipe => :environment do
    if Rails.env.production?
      unless '1' == ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK']
        raise 'Preventing destruction of prod data. Run again with ' +
          'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 if you\'re sure you know ' +
          'what you\'re doing.'
      end
    end

    [Answer, Condition, Question, Result, AnswerSession, Wizard].each do |clazz|
      clazz.delete_all
    end
  end
end
