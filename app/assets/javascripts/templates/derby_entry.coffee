window.app ||= {}

app.DerbyEntryTemplate =
"""
<div class='entry' id='entry-{{entry_id}}'>
  <div class='entry-img'>
    <a href="">
      <img src='{{image_path}}' size='186x186' alt='{{title}}'/>
    </a>
  </div>
  <div class='entry-title'>
    <a href="">
      {{title}}
    </a>
  </div>
</div>
"""
