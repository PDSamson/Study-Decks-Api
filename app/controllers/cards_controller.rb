class CardsController < ApplicationController
  before_action :load_deck
  before_action :set_card, only: [:show, :update, :destroy]

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

    # if @card.save
    #   render json: @card, status: :created, location: @card
    # else
    #   render json: @card.errors, status: :unprocessable_entity
    #   end

    if @card.save
      ## update the url passed to redirect_to as below
      redirect_to deck_card_url(@deck, @card)
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
      params.require(:card).permit(:question, :answer, :deck_id)
    end

    def load_deck
      @deck = Deck.find(params[:deck_id])
    end

end
