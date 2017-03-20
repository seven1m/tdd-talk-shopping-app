# TDD Talk Shopping App

Sample app for demonstrating methods of testing for TulsaWebDevs, March 20, 2017

## Rationale

I've seen talks about testing and TDD, but they tend to be based on either:

* abstract reasoning
* simple example code

I prefer to see real-world examples. When someone talks abstractly, I have a hard time relating to my own experiences.

On the other hand, when the speakers demonstrate TDD using example code, the example code tends to be so simple I find
myself wondering why anyone would bother writing tests.

I'm sure others, new to TDD, have similar experiences.

## The Aha Moment

Every programmer eventually obtains at least some appreciation for testing, sometimes the hard way: after DAYS of
wasted brainpower attempting to debug programs where the problem was a typo, or simple faulty assumption,
or deep workflow-based edge case.

The aha moment for me wasn't hearing abstract ideas or seeing someone write tests for simple example code --
it happened when I realized that applying testing to my own big hairy monolithic apps could **save me time**.

## Learning the Hard Way

Here are the steps I think just about every programmer experiences at least once in their lifetime:

1. **Programming is fun!** (aka `rails new`)
   * I'm creating models, migrations, controllers, views! My database schema fits on a sheet of paper.
   * I'm using Bootstrap to make it look pretty. Nothing can stop me!!

2. **This is getting a little harder.**
   * My pace is slowing a bit, but that's OK. This app has a few rough edges, but at least I know where they all are!
   * I don't mind banging my head on the wall for a couple hours here and there. *Uggg, it was a typo.*
   * We got a new team member and they're taking up a bunch of my time asking how everything works.

3. **The new team member keeps breaking stuff.**
   * I tried to explain to him that he shouldn't really mess with that model, but he didn't believe me. There's
     stuff in there I don't even remember, and I wrote it!
   * He tried to refactor it and now we're tracking down edge case bugs at the office at 7pm after it went
     to production.

4. **The managers don't understand.**
   * They want our team to make a change that would require rewriting a couple of our core models.
     They just don't understand what they're asking!
   * I'm nervous about trying to make such a huge change to this app.

5. **There just isn't enough time.**
   * We don't have enough time to QA everything before it gets released, and then our customers find the problems.
   * The higher-ups want to know who's at fault every time there's a bug like that, and I'm tired of everyone
     on the team trying to CYA.

6. **This app sucks.**
   * This app is so creaky and old I think we should just rewrite it.

Maybe you can identify with some or all of those points.

## Demo Time

I hope to take you through a progression using this somewhat real-world application. It's not a huge app, but
it's big enough to demonstrate some common pitfalls of programming without tests.

1. First, we'll build some features and find some bugs without any tests whatsoever. We'll just use our browser
   and some elbow grease.

2. Next, we'll show what it might look like to write tests that catch bugs (mostly regressions) and how that
   can save your bacon.

3. Last, we'll show how TDD can catch even more bugs and make you into a hero.

### Tools

* Rspec
* Observr / Guard
* Webmock
* CircleCI / Travis CI

### Testing Techniques

* **Going on the offensive**

  Learn to think offensively when you're writing tests, and then defensively when you're making them pass.

* **Faking it**

  When you are writing a test and you don't know exactly what a value should be, just write something ridiculous
  at first. Once you write the code, the value will become clear and you can fix the test to make the test green.

* **Puts**

  The tight loop of a test (especially when focused) is an ideal place to use `puts` statements. The output is
  available in the same window where your tests run, so it's easy to see what you need to see.
