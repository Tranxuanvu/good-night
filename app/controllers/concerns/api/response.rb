module Api
  module Response
    def render_json(object)
      render json: object
    end

    def render_pagy(pagy)
      {
        current_page: pagy.page,
        total_pages: pagy.pages,
        current_items: pagy.items,
        total_items: pagy.count
      }
    end
  end
end
