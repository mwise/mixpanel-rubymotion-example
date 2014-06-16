class AppDelegate
  MIXPANEL_TOKEN = ""

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @mixpanel = Mixpanel.sharedInstanceWithToken(MIXPANEL_TOKEN)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = MainController.new

    @window.makeKeyAndVisible
    true
  end
end
