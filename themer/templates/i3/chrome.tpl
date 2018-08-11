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
      "ntp_text" : [20, 40, 0],
      "ntp_link" : [36, 70, 0],
      "ntp_section" : [207, 221, 192],
      "button_background" : [255, 255, 255]
    },
    "tints" : {
      "buttons" : [0.33, 0.5, 0.47]
    },
    "properties" : {
      "ntp_background_alignment" : "center"
    }
  }
}
