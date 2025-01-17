require "application_system_test_case"

class TranslationsTest < ApplicationSystemTestCase
  setup do
    @translation = translations(:one)
  end

  test "visiting the index" do
    visit translations_url
    assert_selector "h1", text: "Translations"
  end

  test "should create translation" do
    visit translations_url
    click_on "New translation"

    fill_in "Anwser", with: @translation.anwser
    fill_in "Question", with: @translation.question
    fill_in "Search count", with: @translation.search_count
    click_on "Create Translation"

    assert_text "Translation was successfully created"
    click_on "Back"
  end

  test "should update Translation" do
    visit translation_url(@translation)
    click_on "Edit this translation", match: :first

    fill_in "Anwser", with: @translation.anwser
    fill_in "Question", with: @translation.question
    fill_in "Search count", with: @translation.search_count
    click_on "Update Translation"

    assert_text "Translation was successfully updated"
    click_on "Back"
  end

  test "should destroy Translation" do
    visit translation_url(@translation)
    click_on "Destroy this translation", match: :first

    assert_text "Translation was successfully destroyed"
  end
end
