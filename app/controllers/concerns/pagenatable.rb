module Pagenatable
  def page_info(object)
    max_page = object.total_pages
    @page_info = {
      max_page: max_page,
      next_page: object.next_page,
      previous_page: object.prev_page,
      current_page: object.current_page,
      page_range: (1..max_page).to_a
    }
  end
end
