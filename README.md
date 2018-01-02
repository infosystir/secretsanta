Intro
=====

**secret-santa** can help you manage a list of secret santa participants by
randomly assigning pairings and sending emails. It can avoid pairing 
couples to their significant other, and allows custom email messages to be 
specified.

Dependencies
------------

pytz
pyyaml

Usage
-----

Copy config.yml.template to config.yml and enter in the connection details 
for your outgoing mail server. Modify the participants and couples lists and 
the email message if you wish.

    cd secret-santa/
    cp config.yml.template config.yml

Here is the example configuration unchanged:

    # Required to connect to your outgoing mail server. Example for using gmail:
    # gmail
    SMTP_SERVER: smtp.gmail.com
    SMTP_PORT: 587
    USERNAME: you@gmail.com
    PASSWORD: "you're-password"
#If authenticating to google you can get an application specific password to use instead of turning off 2FA
    TIMEZONE: 'US/Pacific'

    PARTICIPANTS:
#Make sure there is no unicode here or other symbols that freak out yaml. Also remember that if sending fails partially through, they've all been randomized so you can't just re-run it again.

- Jon Smith;handle;<jon.smith@gmail.com>;"123 test st, maintown ohio 12345 USA"
- Jane Smith;handle;<jane.smith@gmail.com>;"234 test st, maintown ohio 12345 USA"
- Jill Smith;handle;<jill.smith@gmail.com>;"345 test st, maintown ohio 12345 USA"
- Joe Smith;handle;<joe.smith@gmail.com>;"456 test st, maintown ohio 12345 USA"

    # Warning -- if you mess this up you could get an infinite loop
    DONT-PAIR:
      - Chad, Jen    # Chad and Jen are married
      - Chad, Bill   # Chad and Bill are best friends
      - Bill, Sharon

  # From address should be the organizer in case participants have any questions
    FROM: You <you@gmail.net>

  # Both SUBJECT and MESSAGE can include variable substitution for the 
  # "santa", "santee", "santeehandle", and "santeeaddr"
    SUBJECT: Your secret santa recipient is {santee}
    MESSAGE: 
  Dear {santa},
  
  Ho Ho Ho! Thanks for participating in the Hacker Secret Santa this year!!! We've had over 170 participants this year from 17 different countries (up from 40/7 last year) :D
  
   
  Again to remind you of the rules/notes
  
  1. Soft limit of $25
  
  2. Try to have your gifts delivered by Christmas.
  
  3. Feel free to do some OSINT on the person who's name you've been given. Don't dox them or their loved ones, but if you can find out they prefer Star Wars vs Star Trek then that's ok.
  
  4. It's up to you if you want to tell them or not who the gift has come from.
  
  5. Have fun and use your imagination!!!
  
   
  Also, not really rules, but probably good to know....
   
  1. I won't share any of your data (other than with google and the person that gets you for secret santa)
  
  2. Last year we did have a few mix ups with foreign delivery services (*cough* DHL *cough*). So if you're somewhere outside of the US/Canada there's no guarantees on how soon you'll get your gifts.
  
  3. Seriously, don't fuck it up. We've had a pretty good rate of people delivering on it and I'd like to have it again next year. If for some reason you can't fulfill a gift, let me know and I'm sure someone would take over your spot.
  
   
  DON'T FORGET to tweet out a picture or note of your gift with the HackerSanta hashtag!! We all love seeing the unique and thoughtful hackery things people have sent in the past.
  
   
  Your Hacker Secret Santa recipient is --
  
  {santee} with a handle of {santeehandle} and their address is {santeeaddr}

     
  This message was automagically generated from a computer. 
  
  Nothing could possibly go wrong...

Once configured, call secret-santa:

    python secret_santa.py

Calling secret-santa without arguments will output a test pairing of 
participants.

        Test pairings:

        Chad ---> Bill
        Jen ---> Sharon
        Bill ---> Chad
        Sharon ---> Jen

        To send out emails with new pairings,
        call with the --send argument:

            $ python secret_santa.py --send

To send the emails, call using the `--send` argument

    python secret_santa.py --send

Things to Add
-------------

1. Error handling
2. Cache matches so if script bombs, you don't have to manually match the rest
3. export pairs to csv
