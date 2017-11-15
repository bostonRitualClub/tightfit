# tightfit

#### Setup

1. Install ruby 2.4.1
2. `gem install bundler`
3. `bundle install`
4.
```
$ echo "RACK_ENV=development" >>.env
$ echo "PORT=3000" >> .env
```
5. `rake db:create` or `rake db:setup`
6. `git remote add staging https://git.heroku.com/tightfit-staging.git`
  https://tightfit-staging.herokuapp.com/
7. `git remote add heroku https://git.heroku.com/tightfit.git`
  https://tightfit.herokuapp.com/


#### Deployment
Always deploy to staging first!
You can deploy to staging with: `git push staging`
You can deploy to production with `git push heroku`

You can deploy specific branches with: `git push staging [branchNameHere]:master`
You can deploy specific branches with: `git push heroku [branchNameHere]:master`

After deploying you can run migrations with either:

`heroku run rake db:migrate --remote staging` or `heroku run rake db:migrate --remote heroku`
