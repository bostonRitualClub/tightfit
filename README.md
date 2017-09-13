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
5. `rake db:create`
6. `git remote add staging https://git.heroku.com/tightfit-staging.git`
  https://tightfit-staging.herokuapp.com/
7. `git remote add heroku https://git.heroku.com/tightfit.git`
  https://tightfit.herokuapp.com/

Always deploy to staging first with `git push staging`
Run migrations with:
> heroku run rake db:migrate --remote staging
