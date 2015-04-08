Feature: basic

  Scenario: basic
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "collapse"


  Scenario: show show toc
    Given a fixture app "basic-app"
    And a file named "source/index.html.erb" with:
      """
      ---
      show_toc: true
      ---
      <%= render_toc(current_page) %>
      
      """
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "collapse in"
    


  Scenario: show not 
    Given a fixture app "basic-app"
    And a file named "source/index.html.erb" with:
      """
      ---
      show_toc: false
      ---
      <%= render_toc(current_page) %>
      
      """
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should not see "collapse in"

  Scenario: not show (default)
    Given a fixture app "basic-app"
    And a file named "source/index.html.erb" with:
      """
      ---
      ---
      <%= render_toc(current_page) %>
      
      """
    And the Server is running at "basic-app"
    When I go to "/index.html.erb"
    Then I should not see "collapse in"
    



