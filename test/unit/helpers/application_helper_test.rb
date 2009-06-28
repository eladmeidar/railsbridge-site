require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  
  context "#anonymous_only" do
    should "call the supplied block if the current user is anonymous" do
      self.stubs(:logged_in?).returns(false)
      assert_equal "result", anonymous_only {"result"}
    end

    should "not call the supplied block if the current user is logged in" do
      self.stubs(:logged_in?).returns(true)
      assert_nil anonymous_only {"result"}
    end
  end
  
  context "#authenticated_only" do
    should "call the supplied block if the current user is logged in" do
      self.stubs(:logged_in?).returns(true)
      assert_equal "result", authenticated_only {"result"}
    end

    should "not call the supplied block if the current user is anonymous" do
      self.stubs(:logged_in?).returns(false)
      assert_nil authenticated_only {"result"}
    end
  end
  
  context "#team_lead_only" do
    should "call the supplied block if the current user is logged in and team_lead" do
      self.stubs(:logged_in?).returns(true)
      self.stubs(:team_lead_logged_in?).returns(true)
      assert_equal "result", team_lead_only {"result"}
    end

    should "not call the supplied block if the current user is anonymous" do
      self.stubs(:logged_in?).returns(false)
      assert_nil team_lead_only {"result"}
    end

    should "not call the supplied block if the current user is logged in but not team_lead" do
      self.stubs(:logged_in?).returns(true)
      self.stubs(:team_lead_logged_in?).returns(false)
      assert_nil team_lead_only {"result"}
    end
  end
  
  context "#admin_only" do
    should "call the supplied block if the current user is logged in and an admin" do
      self.stubs(:logged_in?).returns(true)
      self.stubs(:admin_logged_in?).returns(true)
      assert_equal "result", admin_only {"result"}
    end

    should "not call the supplied block if the current user is anonymous" do
      self.stubs(:logged_in?).returns(false)
      assert_nil admin_only {"result"}
    end

    should "not call the supplied block if the current user is logged in but not an admin" do
      self.stubs(:logged_in?).returns(true)
      self.stubs(:admin_logged_in?).returns(false)
      assert_nil admin_only {"result"}
    end
  end
  
  should "provide an array of U.S. states" do
    assert_equal [[ "Alabama", "AL" ], [ "Alaska", "AK" ], [ "Arizona", "AZ" ], [ "Arkansas", "AR" ], [ "California", "CA" ], [ "Colorado", "CO" ], [ "Connecticut", "CT" ], [ "Delaware", "DE" ], [ "District Of Columbia", "DC" ], [ "Florida", "FL" ], [ "Georgia", "GA" ], [ "Hawaii", "HI" ], [ "Idaho", "ID" ], [ "Illinois", "IL" ], [ "Indiana", "IN" ], [ "Iowa", "IA" ], [ "Kansas", "KS" ], [ "Kentucky", "KY" ], [ "Louisiana", "LA" ], [ "Maine", "ME" ], [ "Maryland", "MD" ], [ "Massachusetts", "MA" ], [ "Michigan", "MI" ], [ "Minnesota", "MN" ], [ "Mississippi", "MS" ], [ "Missouri", "MO" ], [ "Montana", "MT" ], [ "Nebraska", "NE" ], [ "Nevada", "NV" ], [ "New Hampshire", "NH" ], [ "New Jersey", "NJ" ], [ "New Mexico", "NM" ], [ "New York", "NY" ], [ "North Carolina", "NC" ], [ "North Dakota", "ND" ], [ "Ohio", "OH" ], [ "Oklahoma", "OK" ], [ "Oregon", "OR" ], [ "Pennsylvania", "PA" ], [ "Rhode Island", "RI" ], [ "South Carolina", "SC" ], [ "South Dakota", "SD" ], [ "Tennessee", "TN" ], [ "Texas", "TX" ], [ "Utah", "UT" ], [ "Vermont", "VT" ], [ "Virginia", "VA" ], [ "Washington", "WA" ], [ "West Virginia", "WV" ], [ "Wisconsin", "WI" ], [ "Wyoming", "WY" ]], state_options
  end
  
  should "provide an array of U.S. states plus blank" do
    assert_equal [["the label", ""], [ "Alabama", "AL" ], [ "Alaska", "AK" ], [ "Arizona", "AZ" ], [ "Arkansas", "AR" ], [ "California", "CA" ], [ "Colorado", "CO" ], [ "Connecticut", "CT" ], [ "Delaware", "DE" ], [ "District Of Columbia", "DC" ], [ "Florida", "FL" ], [ "Georgia", "GA" ], [ "Hawaii", "HI" ], [ "Idaho", "ID" ], [ "Illinois", "IL" ], [ "Indiana", "IN" ], [ "Iowa", "IA" ], [ "Kansas", "KS" ], [ "Kentucky", "KY" ], [ "Louisiana", "LA" ], [ "Maine", "ME" ], [ "Maryland", "MD" ], [ "Massachusetts", "MA" ], [ "Michigan", "MI" ], [ "Minnesota", "MN" ], [ "Mississippi", "MS" ], [ "Missouri", "MO" ], [ "Montana", "MT" ], [ "Nebraska", "NE" ], [ "Nevada", "NV" ], [ "New Hampshire", "NH" ], [ "New Jersey", "NJ" ], [ "New Mexico", "NM" ], [ "New York", "NY" ], [ "North Carolina", "NC" ], [ "North Dakota", "ND" ], [ "Ohio", "OH" ], [ "Oklahoma", "OK" ], [ "Oregon", "OR" ], [ "Pennsylvania", "PA" ], [ "Rhode Island", "RI" ], [ "South Carolina", "SC" ], [ "South Dakota", "SD" ], [ "Tennessee", "TN" ], [ "Texas", "TX" ], [ "Utah", "UT" ], [ "Vermont", "VT" ], [ "Virginia", "VA" ], [ "Washington", "WA" ], [ "West Virginia", "WV" ], [ "Wisconsin", "WI" ], [ "Wyoming", "WY" ]], state_options_with_blank("the label")
  end
  
  context "#full_state_name" do
    should "look up a state name" do
      assert_equal "North Carolina", full_state_name("NC")
    end
    
    should "return nil if no match" do
      assert_nil full_state_name("XX")
    end
  end
end
