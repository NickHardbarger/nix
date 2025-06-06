{ pkgs, ... }:
{
  # Reddit says my request has been blocked?
  # old.reddit seems to work just fine
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      #config.source('qutemacs.py')
      config.source('custom.py')
    '';
    greasemonkey = [
      (pkgs.writeText "youtube-ads.js" ''
        // ==UserScript==
        // @name         Auto Skip YouTube Ads 
        // @version      1.0.0
        // @description  Speed up and skip YouTube ads automatically 
        // @author       jso8910
        // @match        *://*.youtube.com/*
        // @exclude      *://*.youtube.com/subscribe_embed?*
        // ==/UserScript==
        setInterval(() => {
        	const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button')
        	if (btn) {
        		btn.click()
        	}
        	const ad = [...document.querySelectorAll('.ad-showing')][0];
        	if (ad) {
        		document.querySelector('video').playbackRate = 10;
        	}
        }, 50)
      '')
    ];
    quickmarks = { };
  };

  home.file = {
    ".config/qutebrowser/qutemacs.py".source = ../../qutebrowser/qutemacs.py;
    ".config/qutebrowser/custom.py".source = ../../qutebrowser/custom.py;
    ".config/qutebrowser/styles/youtube.css".source = ../../qutebrowser/youtube.css;
    ".config/qutebrowser/styles/theme.css".source = ../../qutebrowser/theme.css;
  };
}
