class HomeScreen < PM::Screen
  title "Your title here"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button

    @hello_world = append!(UILabel, :hello_world)
    @foo = append!(UIImageView, :image)
    @foo.remote_image = "https://placehold.it/350x350"
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
