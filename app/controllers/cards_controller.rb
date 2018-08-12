class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  before_action :load_deck

  # GET /cards
  def index
    @cards = @deck.cards.all

    render json: @cards
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    @card = @deck.cards.new(card_params)

    if @card.save
      render json: @card, status: :created, location: redirect_to @card
    else
      render json: @card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @deck.cards.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:question, :deck_id)
    end

    def load_deck
      @deck = Deck.find(params[:deck_id])
    end

end
