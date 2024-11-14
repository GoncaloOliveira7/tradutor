# Imports the Google Cloud client library
require "google/cloud/translate/v2"

class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[show edit update destroy]

  # GET /translations or /translations.json
  def index
    @translations = Current.session.user.translations
  end

  # GET /translations/1 or /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = Current.session.user.translations.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations or /translations.json
  def create
    @translation = Translation.new(translation_params)

    @translation.answer = google_translate translation_params[:question]

    @translation.user = Current.session.user

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, notice: "Translation was successfully created." }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1 or /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: "Translation was successfully updated." }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1 or /translations/1.json
  def destroy
    @translation.destroy!

    respond_to do |format|
      format.html { redirect_to translations_path, status: :see_other, notice: "Translation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def google_translate(text)
    # Instantiates a client
    client = Google::Cloud::Translate::V2.new

    client.translate text, to: "pt"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_translation
    @translation = Translation.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def translation_params
    params.expect(translation: [ :question ])
  end
end
