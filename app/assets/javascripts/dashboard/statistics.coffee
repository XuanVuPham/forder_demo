$(document).ready ->
  $('.datetimepicker').datetimepicker
    timepicker: false,
    format: 'Y/m/d'

  $('.timepicker').datetimepicker
    timepicker: true

  $('.datepicker').datetimepicker
    timepicker: false,
    format: 'm/d/Y'

  $('.datepicker2').datetimepicker
    timepicker: false,
    format: 'Y/m/d'
