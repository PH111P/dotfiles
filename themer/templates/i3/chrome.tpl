{
  "version": "1.0",
  "name": "themer theme",
  "manifest_version": 2,
  "theme": {
    "images" : {
      "theme_frame" : "bg.png",
      "theme_frame_overlay" : "bg.png",
      "theme_toolbar" : "bg.png",
      "theme_ntp_background" : "bg.png"
    },
    "colors" : {
      "frame" : [{{level1bg|red}}, {{level1bg|green}}, {{level1bg|blue}}],
      "toolbar" : [{{level3bg|red}}, {{level3bg|green}}, {{level3bg|blue}}],
      "ntp_background" : [{{level3bg|red}}, {{level3bg|green}}, {{level3bg|blue}}],
      "ntp_text" : [{{level3fg|red}}, {{level3fg|green}}, {{level3fg|blue}}],
      "bookmark_text" : [{{level3fg|red}}, {{level3fg|green}}, {{level3fg|blue}}],
      "tab_text" : [{{level1fg|red}}, {{level1fg|green}}, {{level1fg|blue}}],
      "ntp_text" : [{{level2fg|red}}, {{level2fg|green}}, {{level2fg|blue}}],
      "ntp_section" : [207, 221, 192],
      "button_background" : [{{level2bg|red}}, {{level2bg|green}}, {{level2bg|blue}}]
    },
    "tints" : {
      "buttons" : [0.33, 0.5, 0.47]
    },
    "properties" : {
      "ntp_background_alignment" : "center"
    }
  }
}
