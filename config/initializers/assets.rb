# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile +=
  %w( navigation.css home.css product_detail.css about_us.css file_download.css
  footer.css admin/home.css side_bar.css admin/product_form.css product_catelogs.css top_navgation.js
  home_adv_animation.js contact_us.css about_us_page.css faq.css news.css  product_page.css home_product_page.css
  admin/oauth.css)
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
