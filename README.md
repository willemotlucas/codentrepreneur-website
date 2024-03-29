# README

# Ruby version

Codentrepreneur website works with Ruby 2.2.0 and Rails 5.0.0

# Installing your environment on Windows

1. Intall ruby and rails on your system. You can use the installer available on [RailsInstaller.org](http://railsinstaller.org). 
Make sure to download Ruby 2.2.4 . 
For now, Rails 5.0.0 is not packaged inside this installer, so you need to updgrade it manually.

2. Open a ruby console and run ```gem update --system```

3. Then, type ```gem update rails 5.0.0```
That will install the version 5.0.0 of rails

4. In the ruby console, type ```rails -v``` to check the version that has been installed

5. Due to a mistake from RailsInstaller developer, you have to change a ```.bat``` file
	* Go on your ruby's ```bin/``` folder ```C:\RailsInstaller\Ruby2.2.0\bin``` by default
	* Open bundle.bat with a text editor
	* Delete the entire content of the file
	* Copy and paste the following lines instead:
```
@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
ECHO.This version of Ruby has not been built with support for Windows 95/98/Me.
GOTO :EOF
:WinNT
@"%~dp0ruby.exe" "%~dpn0" %*
```

6. Go back in your ruby console, change your current directory to codentrepreneur/website folder
and run ```gem install bundler``` to update bundler. Then run ```bundle install``` to install gems located in Gemfile.
If you are facing an error telling there is a problem with SSL/TLS certificates, please follow [this short tutorial](https://gist.github.com/fnichol/867550) to install certificates on your system. Then, run ```bundle install``` again

7. Voilà! Ruby and Ruby on Rails have just been installed on your computer.
You can now clone the git project by using this URL with SourceTree : ```https://gitlab.utc.fr/codentrepreneur/website.git```

8. Go on the Codentrepreneur project directory with your terminal, and run ```bundle install``` to install all the gem located in GemFile.
If there is any issue during this process, please contact your administrator.

9. Finally, run ```rails s``` to launch the server located at [localhost:3000](http://localhost:3000)

# Database initialization

1. Assuming you already have a MySQL server installed and running, you only need to run ```rake db:migrate```.
You also may need to change your database host, port, username and password in ```config/database.yml``` before.
If you don't have a MySQL server, please install one first.

2. Finally, before running ```rake db:seed```, open the file ```website/db/seeds.rb``` and follow instructions at the top of the file.
You have to insert a few rows manually in your database, then you will be able to run ```rake db:seed``` to import sample data in your local database

# Launch tests suite

1. First, you have to create a test database. Go on your MySQL Workbench and create a new schema called website_test

2. Then, run ```rake db:migrate RAILS_ENV=test``` to create tables in test schema

3. If necessary, write your tests under the folder ```test/```

4. To run a tests suite, run ```rails test test/models/your_table_test.rb```
