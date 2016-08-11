Feature: Create a Party
    As a Consultant
    I want to create a party
    Because I want the guests to buy my products.

Scenario: Consultant creates a party
    Given the consultant is on "/parties"
    When the consultant clicks "New Party"
    Then the consultant should be sent to "/parties/create"

Scenario: Consulant adds a party name
    Given the consultant is on "/parties/create"
    When the party name is filled
    Then the default name should no longer be visible.

Scenario: Consulant selects a party date
    Given the consultant is on "/parties/create"
    When the party date is filled
    Then the party date should be validated as a future date.

Scenario: Consultant adds an invitee
    Given the consultant is on "/parties/create"
    When first name, last name, and email address is filled
    Then the email should be validated
        And the email should be added to the "Invited List"

Scenario: Consultant adds duplicate invitee
    Given the "Consultant adds an invitee"
    When first name, last name, and email address is filled with the same data
    Then the email should be validated
        And the consultant should recevie an error: "That person has already been invited."

Scenario: Consultant submits the party
    Given the consultant has selected a "party date"
        And the consultant has added at least one "invitee"
    When the consultant clicks "Create"
    Then the consultant should be sent to "/parties"
        And the party should be visible 

