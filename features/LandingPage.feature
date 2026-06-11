# features/LandingPage.feature
Feature: landing page
  As a platform user
  I want to access the landing page
  So that I can see trending works, top-rated works and search for content

  Scenario: view trending works
    Given the system has the trending works "Dune: Part Two" and "Shōgun"
    When I view the landing page
    Then the trending works are listed ordered by their recent 30-day view count

  Scenario: view top-rated works
    Given the system has the top-rated work "Shōgun" with average score "9.4"
    When I view the landing page
    Then the top-rated works are listed ordered by their average score

Scenario: Reveal additional trending works beyond the initial view
  Given the trending list contains "Duna: Parte 2", "Shogun", "X-Men '97", "Breaking Bad", "Oppenheimer", and "Avengers: Endgame"
  And the initial view only displays up to 5 items
  When the user scrolls the trending carousel to the right
  Then the work "Avengers: Endgame" should become visible on the screen

  Scenario: search for a work from the landing page
    Given the system has a work titled "Fallout"
    When I search for "Fallout" from the landing page
    Then the works matching "Fallout" are listed
