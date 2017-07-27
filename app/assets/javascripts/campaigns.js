// progressbar.js@1.0.0 version is used
// Docs: http://progressbarjs.readthedocs.org/en/1.0.0/

var bar = new ProgressBar.Line(ProgressBar, {
  strokeWidth: 4,
  easing: 'easeInOut',
  duration: 1400,
  color: '#000',
  trailColor: '#eee',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'},
  text: {
    style: {
      // Text color.
      // Default: same as stroke color (options.color)
      color: '#000',
      position: 'absolute',
      right: '0',
      top: '30px',
      padding: 0,
      margin: 0,
      transform: null
    },
    autoStyleContainer: false
  },
  from: {color: '#000'},
  to: {color: '#000'},
  step: (state, bar) => {
    bar.setText(Math.round(bar.value() * 100) + ' have signed');
  }
});

bar.animate(1.0);  // Number from 0.0 to 1.0
