class MainController < UIViewController

 def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @mixpanel = Mixpanel.sharedInstance
    # Mixpanel also tracks the app version and iOS version in the background.
    @mixpanel.track("RubyMotion App Loaded")
    @my_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @my_button.frame = [[110,150],[100,37]]
    @my_button.setTitle("Track This", forState:UIControlStateNormal)
    @my_button.when(UIControlEventTouchUpInside) do
      red = rand(255)
      green = rand(255)
      blue = rand(255)
      color = BubbleWrap.rgb_color(red, green, blue)
      self.view.backgroundColor = color
      # This is a contrived example, but you could create a Funnel on Mixpanel
      # that would find all random colors generated between a rgb color range.
      @mixpanel.track("Click Event Color",
                      properties: {
                        red: red,
                        green: green,
                        blue: blue
                      })
    end
    view.addSubview(@my_button)
  end

  def viewDidUnload
    # Ensure all events are synced to the server before unloading the app.
    # Mixpanel syncs every 30 seconds by default.
    @mixpanel.flush
  end

end
