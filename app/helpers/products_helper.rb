module ProductsHelper
  def categories_options(categories)
    options = []

    categories.each do |category|
      options << [category.title, category.id]
    end

    options
  end
end
