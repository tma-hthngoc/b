# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  opts =
    autoEnable: true
    replace: true
    enableUi: false
    draggable: false
    ui:
      textBold: true
      textItalic: true
      textUnderline: true
      textStrike: true
      quoteBlock: true
      fontSizeInc: true
      fontSizeDec: true
      plugins:
        dock:
          docked: true
          dockToElement: true
        placeholder: 
          content: '[Your comment here]'
  opts2 =
    autoEnable: true
    plugins:
      dock:
        docked: true
        dockToElement: true
        persist: false
    
  # $('#status_report_issues_risks').editor(opts2)
  # $('#status_report_highlight').editor(opts2)
  # $('#status_report_next_steps').editor(opts)
  # $('#status_report_remarks').editor(opts)
  
  1  
